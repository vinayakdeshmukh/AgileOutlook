package com.hpe.ao.service;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.Application;

public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	ProjectService projectSrv;
	
	@Override
	public List<Application> getApplicationListByProject(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<Application> q = Application.findApplicationsByProject(project, sortFieldName, sortOrder);

		return q.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	@Override
	public List<Application> getApplicationListByProject(String sortFieldName, String sortOrder, Long projectId) {
		Project project = projectSrv.findProject(projectId);
		TypedQuery<Application> q = Application.findApplicationsByProject(project, sortFieldName, sortOrder);

		return q.getResultList();
	}
}
