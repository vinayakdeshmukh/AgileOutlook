package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.transaction.Capacity;
import com.hpe.ao.domain.transaction.CapacityEntry;
import com.hpe.ao.reference.CapacityEntryType;
import com.hpe.ao.util.AppUtil;

public class CapacityEntryServiceImpl implements CapacityEntryService {

	static Logger logger = Logger.getLogger(CapacityEntryServiceImpl.class.getName());

	public static final BigDecimal ONE_HUNDRED = new BigDecimal(100);

	@Autowired
	CapacityService capacitySrv;

	public void saveCapacityEntry(CapacityEntry capacityEntry) {
		getPointCapacity(capacityEntry);
		getPointCapacityExpression(capacityEntry);
		capacityEntry.persist();
		createUpdateCapacity(capacityEntry);
	}

	/**
	 * Start Date and End Date inclusive
	 * 
	 * @param capacityEntry
	 */
	private void createUpdateCapacity(CapacityEntry capacityEntry) {
		LocalDate endDate = (capacityEntry.getEndDate() == null)
				? LocalDate.fromDateFields(capacityEntry.getStartDate())
				: LocalDate.fromDateFields(capacityEntry.getEndDate());
		LocalDate nextDate = LocalDate.fromDateFields(capacityEntry.getStartDate());

		System.out.println("Creating Capaty Entries for Date Range : " + nextDate + " AND " + endDate);
		do {
			createUpdateCapacity(capacityEntry, nextDate);
			nextDate = nextDate.plusDays(1);
		} while (!nextDate.isAfter(endDate));
	}

	private void createUpdateCapacity(CapacityEntry capacityEntry, LocalDate startDate) {
		System.out.println("startDate = " + startDate);
		boolean update = true;
		boolean baseline = true;
		TypedQuery<Capacity> q = Capacity.findCapacitysByEffectiveDateEquals(AppUtil.getDate(startDate));
		List<Capacity> list = q.getResultList();
		Capacity aCapacity = null;
		if (list.isEmpty()) {
			update = false;
			aCapacity = new Capacity();
		} else if (list.size() == 1) {
			baseline = (capacityEntry.getCapacityEntryType().equals(CapacityEntryType.Actual)) ? false : true;
			aCapacity = list.get(0);
		}

		aCapacity.setEffectiveDate(startDate.toDateTimeAtStartOfDay().toDate());
		aCapacity.setProject(capacityEntry.getProject());

		BigDecimal pointCapacity = capacityEntry.getPointCapacity();

		// Baseline
		if (!update) {
			aCapacity.setTeamCountBaseline(capacityEntry.getTeamCount());
			aCapacity.setTeamSizeBaseline(capacityEntry.getTeamSize());
			aCapacity.setTeamAvailabilityBaseline(capacityEntry.getTeamAvailability());
			aCapacity.setTeamAveragePointDailyBaseline(capacityEntry.getTeamAveragePointDaily());
			aCapacity.setPointCapacityBaseline(pointCapacity);
		}

		// Actuals
		// if (!baseline) {
		aCapacity.setTeamCountActual(capacityEntry.getTeamCount());
		aCapacity.setTeamSizeActual(capacityEntry.getTeamSize());
		aCapacity.setTeamAvailabilityActual(capacityEntry.getTeamAvailability());
		aCapacity.setTeamAveragePointDailyActual(capacityEntry.getTeamAveragePointDaily());
		aCapacity.setPointCapacityActual(pointCapacity);
		// }
		
		aCapacity.setFactor1(capacityEntry.getFactor1());
		aCapacity.setFactor2(capacityEntry.getFactor2());
		aCapacity.setFactor3(capacityEntry.getFactor3());

		aCapacity.setEntryComments(capacityEntry.getEntryComments());

		if (update) {
			capacitySrv.updateCapacity(aCapacity);
		} else {
			capacitySrv.saveCapacity(aCapacity);
		}
	}

	private BigDecimal getPointCapacity(CapacityEntry capacityEntry) {

		BigDecimal pointCapacity = calculatePointCapacity(capacityEntry.getTeamCount(), capacityEntry.getTeamSize(),
				capacityEntry.getTeamAveragePointDaily(), capacityEntry.getTeamAvailability(),
				capacityEntry.getFactor1(), capacityEntry.getFactor2(), capacityEntry.getFactor3());
		capacityEntry.setPointCapacity(pointCapacity);
		return pointCapacity;
	}

	public BigDecimal calculatePointCapacity(BigDecimal teamCount, BigDecimal teamSizs,
			BigDecimal pointAveragePerTeamPerDay, BigDecimal teamAvailability, BigDecimal factor1, BigDecimal factor2,
			BigDecimal factor3) {
		BigDecimal ptCpt = teamCount.multiply(teamSizs);
		logger.debug("ptCpt : " + ptCpt);
		ptCpt = ptCpt.multiply(pointAveragePerTeamPerDay);
		logger.debug("ptCpt : " + ptCpt);
		ptCpt = percentage(ptCpt, teamAvailability);
		logger.debug("ptCpt : " + ptCpt);
		if (factor1 != null && factor1 != BigDecimal.ZERO) {
			ptCpt = ptCpt.add(percentage(ptCpt, factor1));
			logger.debug("ptCpt : " + ptCpt);
		}
		if (factor2 != null && factor2 != BigDecimal.ZERO) {
			ptCpt = ptCpt.add(percentage(ptCpt, factor2));
			logger.debug("ptCpt : " + ptCpt);
		}
		if (factor3 != null && factor3 != BigDecimal.ZERO) {
			ptCpt = ptCpt.add(percentage(ptCpt, factor3));
			logger.debug("ptCpt : " + ptCpt);
		}

		logger.debug("ptCpt : " + ptCpt);

		return ptCpt;
	}

	private String getPointCapacityExpression(CapacityEntry capacityEntry) {

		String expression = generatePointCapacityExpression(capacityEntry.getTeamCount(), capacityEntry.getTeamSize(),
				capacityEntry.getTeamAveragePointDaily(), capacityEntry.getTeamAvailability(),
				capacityEntry.getFactor1(), capacityEntry.getFactor2(), capacityEntry.getFactor3());
		capacityEntry.setEntryComments(expression);
		return expression;
	}

	public String generatePointCapacityExpression(BigDecimal teamCount, BigDecimal teamSizs,
			BigDecimal pointAveragePerTeamPerDay, BigDecimal teamAvailability, BigDecimal factor1, BigDecimal factor2,
			BigDecimal factor3) {
		StringBuilder str = new StringBuilder("Calculated = [ ( ");
		str.append(teamCount + " * " + teamSizs);
		str.append(" * " + pointAveragePerTeamPerDay + " ) ");
		str.append(" * " + teamAvailability + "% ] ");
		if (factor1 != null && factor1 != BigDecimal.ZERO) {
			str.append(" + [ " + factor1 + "% ] ");
		}
		if (factor2 != null && factor2 != BigDecimal.ZERO) {
			str.append(" + [ " + factor2 + "% ] ");
		}
		if (factor3 != null && factor3 != BigDecimal.ZERO) {
			str.append(" + [ " + factor3 + "% ] ");
		}

		logger.debug(str);
		return str.toString();
	}

	public static BigDecimal percentage(BigDecimal base, BigDecimal pct) {
		BigDecimal result = base.multiply(pct).divide(ONE_HUNDRED);
		logger.debug("base : " + base + ", percentage : " + pct + ", result : " + result);
		return result;
	}
}
