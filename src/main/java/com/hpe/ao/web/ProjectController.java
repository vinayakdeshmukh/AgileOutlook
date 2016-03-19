package com.hpe.ao.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.util.AppUtil;

@RequestMapping("/projects")
@Controller
@RooWebScaffold(path = "projects", formBackingObject = Project.class)
public class ProjectController {

	@RequestMapping(value = "/{id}", params = "adjustBaseline", produces = "text/html")
	public String adjustBaseline(@PathVariable("id") Long id, Model uiModel, HttpServletRequest httpServletRequest) {
		Project project = projectService.adjustBaseline(id);
		populateEditForm(uiModel, project);
		return "redirect:/projects/" + encodeUrlPathSegment(project.getId().toString(), httpServletRequest);
	}

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Long id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		Project project = projectService.findProject(id);
		uiModel.addAttribute("project", project);

		Long startDateDiff = AppUtil.getDateDiffDays(project.getStartDateBaseline(), project.getStartDateActual());
		Long endDateDiff = AppUtil.getDateDiffDays(project.getEndDateBaseline(), project.getEndDateActual());

		uiModel.addAttribute("startDateDiff", startDateDiff);
		uiModel.addAttribute("endDateDiff", endDateDiff);

		uiModel.addAttribute("itemId", id);
		return "projects/show";
	}
}
