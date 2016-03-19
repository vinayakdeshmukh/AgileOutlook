package com.hpe.ao.domain.base;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;

//@EntityListeners({ CommonEntityListener.class })
@RooJavaBean
@RooToString
@RooJpaActiveRecord(mappedSuperclass = true)
public abstract class AbstractEntity {

	public static Logger logger = Logger.getLogger(AbstractEntity.class.getName());

	public void prePersist() {
		// Empty...
		logger.debug("In - prePersist() " + this);
	}

	public void postPersist() {
		// Empty...
		logger.debug("In - postPersist() " + this);
	}
}
