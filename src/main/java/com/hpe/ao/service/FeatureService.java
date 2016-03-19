package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.roo.addon.layers.service.annotations.RooService;
import org.springframework.web.multipart.MultipartFile;

import com.hpe.ao.domain.base.AbstractEntity;
import com.hpe.ao.domain.transaction.Feature;
import com.hpe.ao.domain.transaction.ProjectRelease;

@RooService(domainTypes = { com.hpe.ao.domain.transaction.Feature.class })
public interface FeatureService {

	List<Object[]> getFeatureSummaryByApplication(Long projectId);

	void bulkUpload(MultipartFile file, Class<? extends AbstractEntity> cls);

	BigDecimal getBaselinePointTotalByRelease(ProjectRelease projectRelease);

	BigDecimal getActualPointTotalByRelease(ProjectRelease projectRelease);

	List<Feature> getFeatureListByProjectRelease(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long releaseId);

	List<Feature> getFeatureListByProjectRelease(String sortFieldName, String sortOrder, Long releaseId);

}
