package com.hpe.ao.service;
import java.util.List;

import org.springframework.roo.addon.layers.service.annotations.RooService;

import com.hpe.ao.domain.transaction.Application;

@RooService(domainTypes = { com.hpe.ao.domain.transaction.Application.class })
public interface ApplicationService {

	List<Application> getApplicationListByProject(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long projectId);

	List<Application> getApplicationListByProject(String sortFieldName, String sortOrder, Long projectId);
}
