package com.hpe.ao.service;

import org.springframework.roo.addon.layers.service.annotations.RooService;

import com.hpe.ao.domain.transaction.Project;

@RooService(domainTypes = { com.hpe.ao.domain.transaction.Project.class })
public interface ProjectService {

	Project adjustBaseline(Long projectId);
}
