package com.hpe.ao.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hpe.ao.bean.SessionCache;
import com.hpe.ao.domain.transaction.CapacityEntry;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.service.ProjectService;
import com.hpe.ao.util.AppUtil;

@RequestMapping("/capacityentrys")
@Controller
@RooWebScaffold(path = "capacityentrys", formBackingObject = CapacityEntry.class)
public class CapacityEntryController {

	@Autowired
	ProjectService projectService;

	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel, HttpServletRequest httpServletRequest) {
		populateEditForm(uiModel, new CapacityEntry(), httpServletRequest);
		List<String[]> dependencies = new ArrayList<String[]>();
		if (projectService.countAllProjects() == 0) {
			dependencies.add(new String[] { "project", "projects" });
		}
		uiModel.addAttribute("dependencies", dependencies);
		return "capacityentrys/create";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid CapacityEntry capacityEntry, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, capacityEntry, httpServletRequest);
			return "capacityentrys/create";
		}
		uiModel.asMap().clear();
		capacityEntryService.saveCapacityEntry(capacityEntry);

		Long prjId = SessionCache.getSessionCache(httpServletRequest).getProjectId();
		return "redirect:/projects/" + encodeUrlPathSegment(prjId.toString(), httpServletRequest);
	}

	void populateEditForm(Model uiModel, CapacityEntry capacityEntry, HttpServletRequest httpServletRequest) {
		populateEditForm(uiModel, capacityEntry);

		Project prj = SessionCache.getSessionCache(httpServletRequest).getProject();
		capacityEntry.setProject(projectService.findProject(prj.getId()));
		capacityEntry.setTeamAveragePointDaily(prj.getTeamAveragePointDaily());
		capacityEntry.setTeamCount(new BigDecimal(4));
		capacityEntry.setTeamSize(new BigDecimal(3));
		capacityEntry.setTeamAvailability(new BigDecimal(100));

		capacityEntry.setFactor1(new BigDecimal(20));
		capacityEntry.setFactor1Description("Reuse - Framework Code");

		capacityEntry.setFactor2(new BigDecimal(-10));
		capacityEntry.setFactor2Description("New team memebers");

		Date jan1stMonday = AppUtil.getFirstMonday(2016, 1);
		Date jun1stMonday = AppUtil.getFirstMonday(2016, 6);
		capacityEntry.setStartDate(jan1stMonday);
		capacityEntry.setEndDate(jun1stMonday);
	}
}
