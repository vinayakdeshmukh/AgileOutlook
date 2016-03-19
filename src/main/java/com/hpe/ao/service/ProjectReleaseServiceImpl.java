package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.model.ApplicationSummary;
import com.hpe.ao.model.ReleaseSummary;
import com.hpe.ao.util.AppUtil;

public class ProjectReleaseServiceImpl implements ProjectReleaseService {

	static Logger logger = Logger.getLogger(ProjectReleaseServiceImpl.class.getName());

	@Autowired
	FeatureService featureSrv;

	@Autowired
	ApplicationService appSrv;

	@Autowired
	CapacityService capacitySrv;

	@Autowired
	ProjectService projectSrv;

	@Override
	public List<ProjectRelease> getProjectReleaseListByProject(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<ProjectRelease> q = ProjectRelease.findProjectReleasesByProject(project, sortFieldName, sortOrder);

		return q.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	@Override
	public List<ProjectRelease> getProjectReleaseListByProject(String sortFieldName, String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<ProjectRelease> q = ProjectRelease.findProjectReleasesByProject(project, sortFieldName, sortOrder);

		return q.getResultList();
	}

	@Override
	public ProjectRelease refreshBaselineAndActuals(ProjectRelease projectRelease, Date startDateBaseline,
			Date startDateActual) {
		projectRelease = refreshBaseline(projectRelease, startDateBaseline);
		projectRelease = refreshActuals(projectRelease, startDateActual);
		saveProjectRelease(projectRelease);

		return projectRelease;
	}

	@Override
	public ProjectRelease refreshBaseline(ProjectRelease projectRelease, Date startDateBaseline) {
		projectRelease.setStartDateBaseline(startDateBaseline);

		// Get baseline POINT total
		BigDecimal relPointTotal = featureSrv.getBaselinePointTotalByRelease(projectRelease);

		// Get baseline Date for from CAPACITY for development
		Date devEndDate = capacitySrv.getDateForCapacity(startDateBaseline, relPointTotal, true);
		logger.debug("devEndDate : " + devEndDate);

		Date sitStartDate = AppUtil.getNextMonday(devEndDate);
		logger.debug("sitStartDate : " + sitStartDate);

		int durationSITBaseline = projectRelease.getDurationSITBaseline().intValue();
		int durationUATBaseline = projectRelease.getDurationUATBaseline().intValue();
		int durationIMPBaseline = projectRelease.getDurationIMPBaseline().intValue();

		int durationafterDev = durationSITBaseline + durationUATBaseline + durationIMPBaseline;
		logger.debug("Duration After DEV : " + durationSITBaseline + " + " + durationUATBaseline + " + "
				+ durationIMPBaseline + " = " + durationafterDev + "( Weeks )");
		durationafterDev = durationafterDev * 7;
		Date goLiveStartDate = AppUtil.getDate(sitStartDate, durationafterDev);
		logger.debug("goLiveStartDate : " + goLiveStartDate);

		Date currGoLiveDateBaseline = projectRelease.getGoLiveDateBaseline();
		logger.debug("currGoLiveDateBaseline : " + currGoLiveDateBaseline);
		if (currGoLiveDateBaseline == null) {
			logger.debug("GoLiveDateBaseline : updated to " + goLiveStartDate);
			projectRelease.setGoLiveDateBaseline(goLiveStartDate);
			projectRelease.setEndDateBaseline(goLiveStartDate);
		} else if (AppUtil.getDateDiffDays(goLiveStartDate, currGoLiveDateBaseline) > 0) {
			logger.debug("GoLiveDateBaseline : Do you want to update??? " + goLiveStartDate);
			// projectRelease.setGoLiveDateBaseline(goLiveStartDate);
			// projectRelease.setEndDateBaseline(goLiveStartDate);
		} else {
			logger.debug("GoLiveDateBaseline : NOT updated");
		}
		// endDateBaseline = goLiveStartDate;
		return projectRelease;
	}

	@Override
	public ProjectRelease refreshActuals(ProjectRelease projectRelease, Date startDateActual) {
		projectRelease.setStartDateActual(startDateActual);
		// Get baseline POINT total
		BigDecimal relPointTotal = featureSrv.getActualPointTotalByRelease(projectRelease);

		// Get baseline Date for from CAPACITY for development
		Date devEndDateActual = capacitySrv.getDateForCapacity(startDateActual, relPointTotal, false);
		logger.debug("devEndDateActual : " + devEndDateActual);

		Date sitStartDateActual = AppUtil.getNextMonday(devEndDateActual);
		logger.debug("sitStartDateActual : " + sitStartDateActual);

		int durationSITActual = projectRelease.getDurationSITActual().intValue();
		int durationUATActual = projectRelease.getDurationUATActual().intValue();
		int durationIMPActual = projectRelease.getDurationIMPActual().intValue();

		int durationafterDev = durationSITActual + durationUATActual + durationIMPActual;
		logger.debug("Duration After DEV Actual : " + durationSITActual + " + " + durationUATActual + " + "
				+ durationIMPActual + " = " + durationafterDev + "( Weeks )");
		durationafterDev = durationafterDev * 7;
		Date goLiveStartDateActual = AppUtil.getDate(sitStartDateActual, durationafterDev);
		logger.debug("goLiveStartDateActual : " + goLiveStartDateActual);

		// GoLive Date Actual can ONLY be changed Manually. the delay will be shown as -ve Contingency on summary.
		// projectRelease.setEndDateActual(goLiveStartDateActual);
		// projectRelease.setGoLiveDateActual(goLiveStartDateActual);
		// endDateActual = goLiveStartDate;
		return projectRelease;
	}

	@Override
	public ReleaseSummary getReleaseSummary(Long releaseId) {
		try {
			ReleaseSummary relSummary = new ReleaseSummary();
			ProjectRelease prjRel = findProjectRelease(releaseId);
			relSummary.setProjectRelease(prjRel);

			List<ApplicationSummary> appSummList = new ArrayList<ApplicationSummary>();
			if (prjRel != null) {
				Long projectId = prjRel.getProject().getId();
				List<Object[]> list = featureSrv.getFeatureSummaryByApplication(projectId);
				for (Object[] objects : list) {
					ApplicationSummary appSumm = new ApplicationSummary();
					appSumm.setApplication(appSrv.findApplication((Long) objects[0]));
					appSumm.setApplicationStoryCountBaseline((BigDecimal) objects[1]);
					appSumm.setApplicationStoryPointBaseline((BigDecimal) objects[2]);
					appSumm.setApplicationStoryCountActual((BigDecimal) objects[3]);
					appSumm.setApplicationStoryPointActual((BigDecimal) objects[4]);
					appSummList.add(appSumm);
					relSummary.increaseCountAndPoint(appSumm);
				}
				relSummary.setApplicationSummaryList(appSummList);

				setReleaseSummaryBaseline(prjRel, relSummary);
				setReleaseSummaryActual(prjRel, relSummary);

				return relSummary;
			}
		} catch (Exception exp) {
			exp.printStackTrace();
			return null;
		}

		return null;
	}

	private void setReleaseSummaryBaseline(ProjectRelease prjRel, ReleaseSummary relSummary) {
		Date fromDate = prjRel.getStartDateBaseline();
		BigDecimal relPointTotal = featureSrv.getBaselinePointTotalByRelease(prjRel);
		if(relPointTotal == null) return;
		
		// Get baseline Date for from CAPACITY for development
		Date devEndDateBaseline = capacitySrv.getDateForCapacity(fromDate, relPointTotal, true);
		logger.debug("devEndDateBaseline : " + devEndDateBaseline);

		Date sitStartDateBaseline = AppUtil.getNextMonday(devEndDateBaseline);
		logger.debug("sitStartDateBaseline : " + sitStartDateBaseline);
		relSummary.setStartDateSITBaseline(sitStartDateBaseline);

		Date uatStartDateBaseline = AppUtil.getDate(sitStartDateBaseline,
				prjRel.getDurationSITBaseline().intValue() * 7);
		uatStartDateBaseline = AppUtil.getNextMonday(uatStartDateBaseline);
		logger.debug("uatStartDateBaseline : " + uatStartDateBaseline);
		relSummary.setStartDateUATBaseline(uatStartDateBaseline);

		Date impStartDateBaseline = AppUtil.getDate(uatStartDateBaseline,
				prjRel.getDurationUATBaseline().intValue() * 7);
		impStartDateBaseline = AppUtil.getNextMonday(impStartDateBaseline);
		logger.debug("impStartDateBaseline : " + impStartDateBaseline);
		relSummary.setStartDateIMPBaseline(impStartDateBaseline);

		Date goLiveStartDateBaseline = AppUtil.getDate(impStartDateBaseline,
				prjRel.getDurationIMPBaseline().intValue() * 7);
		goLiveStartDateBaseline = AppUtil.getNextMonday(goLiveStartDateBaseline);
		logger.debug("goLiveStartDateBaseline : " + goLiveStartDateBaseline);

		Long diffDays = AppUtil.getDateDiffDays(prjRel.getGoLiveDateBaseline(), goLiveStartDateBaseline);
		relSummary.setContingencyBaseline(new BigDecimal(diffDays));
	}

	private void setReleaseSummaryActual(ProjectRelease prjRel, ReleaseSummary relSummary) {
		Date fromDateActual = prjRel.getStartDateActual();
		BigDecimal relPointTotalActual = featureSrv.getActualPointTotalByRelease(prjRel);
		if(relPointTotalActual == null) return;
		
		// Get baseline Date for from CAPACITY for development
		Date devEndDateActual = capacitySrv.getDateForCapacity(fromDateActual, relPointTotalActual, false);
		logger.debug("devEndDateActual : " + devEndDateActual);

		Date sitStartDateActual = AppUtil.getNextMonday(devEndDateActual);
		logger.debug("sitStartDateActual : " + sitStartDateActual);
		relSummary.setStartDateSITActual(sitStartDateActual);

		Date uatStartDateActual = AppUtil.getDate(sitStartDateActual, prjRel.getDurationSITActual().intValue() * 7);
		uatStartDateActual = AppUtil.getNextMonday(uatStartDateActual);
		logger.debug("uatStartDateActual : " + uatStartDateActual);
		relSummary.setStartDateUATActual(uatStartDateActual);

		Date impStartDateActual = AppUtil.getDate(uatStartDateActual, prjRel.getDurationUATActual().intValue() * 7);
		impStartDateActual = AppUtil.getNextMonday(impStartDateActual);
		logger.debug("impStartDateActual : " + impStartDateActual);
		relSummary.setStartDateIMPActual(impStartDateActual);

		// GoLive Date Actual can ONLY be changed Manually. the delay will be shown as -ve Contingency on summary.
		Date goLiveStartDateActual = AppUtil.getDate(impStartDateActual, prjRel.getDurationIMPActual().intValue() * 7);
		goLiveStartDateActual = AppUtil.getNextMonday(goLiveStartDateActual);
		logger.debug("goLiveStartDateActual : " + goLiveStartDateActual);

		Long diffDays = AppUtil.getDateDiffDays(prjRel.getGoLiveDateBaseline(), goLiveStartDateActual);
		relSummary.setContingencyActual(new BigDecimal(diffDays));
	}
}
