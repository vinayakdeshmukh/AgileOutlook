package com.hpe.ao.domain.base;

import javax.persistence.PostPersist;
import javax.persistence.PrePersist;

public class CommonEntityListener {

	@PrePersist
	public void prePersist(final AbstractEntity entity) {
		entity.prePersist();
	}

	@PostPersist
	public void postPersist(final AbstractEntity entity) {
		entity.postPersist();
	}
}
