package com.hpe.ao.service;

import java.util.Date;
import java.util.List;

import org.springframework.roo.addon.layers.service.annotations.RooService;

import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.model.ReleaseSummary;

@RooService(domainTypes = { com.hpe.ao.domain.transaction.ProjectRelease.class })
public interface ProjectReleaseService {

	ReleaseSummary getReleaseSummary(Long releaseId);

	ProjectRelease refreshBaselineAndActuals(ProjectRelease projectRelease, Date startDateBaseline,
			Date startDateActual);

	ProjectRelease refreshBaseline(ProjectRelease projectRelease, Date startDateBaseline);

	ProjectRelease refreshActuals(ProjectRelease projectRelease, Date startDateActual);

	List<ProjectRelease> getProjectReleaseListByProject(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long projectId);

	List<ProjectRelease> getProjectReleaseListByProject(String sortFieldName, String sortOrder, Long projectId);
}
