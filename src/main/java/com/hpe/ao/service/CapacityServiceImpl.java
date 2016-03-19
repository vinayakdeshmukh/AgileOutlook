package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.transaction.Capacity;
import com.hpe.ao.domain.transaction.Project;

public class CapacityServiceImpl implements CapacityService {

	static Logger logger = Logger.getLogger(CapacityServiceImpl.class.getName());

	static final String jpql = "SELECT SUM(capacity.pointCapacityBaseline),  SUM(capacity.pointCapacityActual)"
			+ " FROM Capacity capacity  WHERE capacity.effectiveDate between :fromDate and :endDate";

	static final String JPQL_RUNNING_TOTAL_FROM_DATE = "SELECT c1.effectiveDate, c1.pointCapacityBaseline, c1.pointCapacityActual, "
			+ " SUM(c2.pointCapacityBaseline), SUM(c2.pointCapacityActual) " + " FROM   Capacity c1, Capacity c2 "
			+ " WHERE c1.effectiveDate > :fromDate AND (c2.effectiveDate <= c1.effectiveDate AND c2.effectiveDate > :fromDate) "
			+ " GROUP BY c1.effectiveDate, c1.pointCapacityBaseline, c1.pointCapacityActual "
			+ " ORDER BY c1.effectiveDate";

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	ProjectService projectSrv;

	@Override
	public BigDecimal[] getCapacity(Date fromDate, Date endDate) {
		BigDecimal[] capacity = new BigDecimal[2];

		Query query = entityManager.createQuery(jpql);
		query.setParameter("fromDate", fromDate);
		query.setParameter("endDate", endDate);
		Object[] result = (Object[]) query.getSingleResult();
		capacity[0] = (BigDecimal) result[0];
		capacity[1] = (BigDecimal) result[1];

		logger.debug("capacity[0]" + capacity[0]);
		logger.debug("capacity[1]" + capacity[1]);

		return capacity;
	}

	@Override
	public Date getDateForCapacity(Date fromDate, BigDecimal pointTotal, boolean baseline) {
		logger.debug(" -------------------------------------------------------------------------------");
		logger.debug("baseline : " + baseline + " fromDate : " + fromDate + " pointTotal : " + pointTotal);
		Query query = entityManager.createQuery(JPQL_RUNNING_TOTAL_FROM_DATE);
		query.setParameter("fromDate", fromDate);

		int arrayIndex = (baseline) ? 3 : 4;

		@SuppressWarnings("unchecked")
		List<Object[]> result = query.getResultList();
		logger.debug("result : " + result);
		for (Object[] objects : result) {
			logger.debug("objects[0]: " + objects[0] + "objects[1]: " + objects[1] + "objects[2]: " + objects[2]
					+ "objects[3]: " + objects[3] + "objects[4]: " + objects[4]);
			if (((BigDecimal) objects[arrayIndex]).compareTo(pointTotal) == 1) {
				logger.debug("Running Total: " + objects[arrayIndex] + " for Effective Date: " + objects[0]);
				return (Date) objects[0];
			}
		}

		return null;
	}

	@Override
	public List<Capacity> getCapacityListByProject(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<Capacity> q = Capacity.findCapacitysByProject(project, sortFieldName, sortOrder);

		return q.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	@Override
	public List<Capacity> getCapacityListByProject(String sortFieldName, String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<Capacity> q = Capacity.findCapacitysByProject(project, sortFieldName, sortOrder);

		return q.getResultList();
	}
}
