package com.hpe.ao.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.annotations.converter.RooConversionService;

import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectRelease;

/**
 * A central place to register application converters and formatters.
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

	public Converter<Program, String> getProgramToStringConverter() {
		return new Converter<Program, String>() {
			public String convert(Program source) {
				return new StringBuilder().append(source.getId()).append("-").append(source.getName()).toString();
			}
		};
	}

	public Converter<Project, String> getProjectToStringConverter() {
		return new Converter<Project, String>() {
			public String convert(Project source) {
				return new StringBuilder().append(source.getId()).append("-").append(source.getName()).toString();
			}
		};
	}

	public Converter<Application, String> getApplicationToStringConverter() {
		return new Converter<Application, String>() {
			public String convert(Application source) {
				return new StringBuilder().append(source.getId()).append("-").append(source.getName()).toString();
			}
		};
	}

	public Converter<ProjectRelease, String> getProjectReleaseToStringConverter() {
		return new Converter<ProjectRelease, String>() {
			public String convert(ProjectRelease source) {
				return new StringBuilder().append(source.getId()).append("-").append(source.getName()).toString();
			}
		};
	}
}
