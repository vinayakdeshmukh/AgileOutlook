package com.hpe.ao.model;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;

import com.hpe.ao.domain.transaction.Application;

@RooJavaBean
public class ApplicationSummary {

	/**
	 */
	@NotNull
	private Application application;

	private BigDecimal applicationStoryCountBaseline;

	private BigDecimal applicationStoryPointBaseline;

	private BigDecimal applicationStoryCountActual;

	private BigDecimal applicationStoryPointActual;
}
