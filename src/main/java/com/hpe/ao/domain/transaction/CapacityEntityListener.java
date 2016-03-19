package com.hpe.ao.domain.transaction;

import org.springframework.beans.factory.annotation.Autowired;

import com.hpe.ao.domain.base.AbstractEntity;
import com.hpe.ao.domain.base.CommonEntityListener;
import com.hpe.ao.service.ProjectReleaseService;

public class CapacityEntityListener extends CommonEntityListener {

	@Autowired
	ProjectReleaseService projectReleaseService;

	@Override
	public void prePersist(AbstractEntity entity) {
		super.prePersist(entity);

	}

	@Override
	public void postPersist(AbstractEntity entity) {
		super.postPersist(entity);
	}

}
