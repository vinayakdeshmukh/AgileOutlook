package com.hpe.ao.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;

import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.Project;

@RooJavaBean
public class SessionCache {

	Program program;
	Project project;
	Long projectId;
	Long programId;

	public void setProgramProject(Program program, Project project) {
		this.program = program;
		this.programId = program.getId();

		this.project = project;
		this.projectId = project.getId();
	}

	public static void setSessionCache(HttpServletRequest req, SessionCache sessionCache) {
		req.getSession().setAttribute("sessionCache", sessionCache);
	}

	public static SessionCache getSessionCache(HttpServletRequest req) {
		return (SessionCache) req.getSession().getAttribute("sessionCache");
	}

}
