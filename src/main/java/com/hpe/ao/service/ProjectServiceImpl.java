package com.hpe.ao.service;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectRelease;

public class ProjectServiceImpl implements ProjectService {

	static Logger logger = Logger.getLogger(ProjectServiceImpl.class.getName());

	@Autowired
	ProjectReleaseService prjRelSrv;

	@Autowired
	FeatureService featureSrv;

	@Autowired
	CapacityService capacitySrv;

	@Override
	public Project adjustBaseline(Long projectId) {
		Project project = findProject(projectId);

		Date startDateBaseline = (Date) project.getStartDateBaseline().clone();
		Date startDateActual = (Date) project.getStartDateActual().clone();

		// Get ALL the RELEASES for this project
		TypedQuery<ProjectRelease> q = ProjectRelease.findProjectReleasesByProject(project, "startDateBaseline", "ASC");
		List<ProjectRelease> list = q.getResultList();
		for (ProjectRelease projectRelease : list) {

			projectRelease = prjRelSrv.refreshBaselineAndActuals(projectRelease, startDateBaseline, startDateActual);

			// Start Date for NEXT release and END date for Project if Last
			// Release
			startDateBaseline = projectRelease.getGoLiveDateBaseline();
			startDateActual = projectRelease.getGoLiveDateActual();
		}

		project.setEndDateBaseline(startDateBaseline);
		project.setEndDateActual(startDateActual);
		return project;
	}

}
