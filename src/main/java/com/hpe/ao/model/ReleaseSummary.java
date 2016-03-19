package com.hpe.ao.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;

import com.hpe.ao.domain.transaction.ProjectRelease;

@RooJavaBean
public class ReleaseSummary {

	/**
	 */
	@NotNull
	ProjectRelease projectRelease;

	List<ApplicationSummary> applicationSummaryList;

	BigDecimal releaseStoryCountBaseline;

	BigDecimal releaseStoryPointBaseline;

	Date startDateSITBaseline;

	Date startDateUATBaseline;

	Date startDateIMPBaseline;

	BigDecimal contingencyBaseline;

	/* ----------------------------- */

	BigDecimal releaseStoryCountActual;

	BigDecimal releaseStoryPointActual;

	Date startDateSITActual;

	Date startDateUATActual;

	Date startDateIMPActual;

	BigDecimal contingencyActual;

	public void increaseStoryCountBaseline(BigDecimal incr) {
		addNumbers(releaseStoryCountBaseline, incr);
	}

	public void increaseStoryCountActual(BigDecimal incr) {
		addNumbers(releaseStoryCountActual, incr);
	}

	public void increaseStoryPointBaseline(BigDecimal incr) {
		addNumbers(releaseStoryPointBaseline, incr);
	}

	public void increaseStoryPointActual(BigDecimal incr) {
		addNumbers(releaseStoryPointActual, incr);
	}

	private BigDecimal addNumbers(BigDecimal number1, BigDecimal number2) {
		if (number1 == null) {
			number1 = BigDecimal.ZERO;
		}

		if (number2 != null) {
			number1 = number1.add(number2);
		}
		return number1;
	}

	public void increaseCountAndPoint(ApplicationSummary appSumm) {
		releaseStoryCountBaseline = addNumbers(releaseStoryCountBaseline, appSumm.getApplicationStoryCountBaseline());
		releaseStoryCountActual = addNumbers(releaseStoryCountActual, appSumm.getApplicationStoryCountActual());
		releaseStoryPointBaseline = addNumbers(releaseStoryPointBaseline, appSumm.getApplicationStoryPointBaseline());
		releaseStoryPointActual = addNumbers(releaseStoryPointActual, appSumm.getApplicationStoryPointActual());
	}

}
