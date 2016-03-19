package com.hpe.ao.web;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hpe.ao.bean.SessionCache;
import com.hpe.ao.domain.transaction.PrgPrjSelectMenu;

@RequestMapping("/prgprjselectmenus")
@Controller
@RooWebScaffold(path = "prgprjselectmenus", formBackingObject = PrgPrjSelectMenu.class)
public class PrgPrjSelectMenuController {
	
	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel, HttpServletRequest httpServletRequest) {
		populateEditForm(uiModel, new PrgPrjSelectMenu(), httpServletRequest);
		List<String[]> dependencies = new ArrayList<String[]>();
		if (programService.countAllPrograms() == 0) {
			dependencies.add(new String[] { "program", "programs" });
		}
		if (projectService.countAllProjects() == 0) {
			dependencies.add(new String[] { "project", "projects" });
		}
		uiModel.addAttribute("dependencies", dependencies);
		return "prgprjselectmenus/create";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid PrgPrjSelectMenu prgPrjSelectMenu, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, prgPrjSelectMenu, httpServletRequest);
			return "prgprjselectmenus/create";
		}

		SessionCache sessionCache = new SessionCache();
		sessionCache.setProgramProject(prgPrjSelectMenu.getProgram(), prgPrjSelectMenu.getProject());
		SessionCache.setSessionCache(httpServletRequest, sessionCache);
		uiModel.asMap().clear();
		prgPrjSelectMenuService.savePrgPrjSelectMenu(prgPrjSelectMenu);

		return "redirect:/projects/"
				+ encodeUrlPathSegment(prgPrjSelectMenu.getProject().getId().toString(), httpServletRequest);
	}
	
	private void populateEditForm(Model uiModel, PrgPrjSelectMenu prgPrjSelectMenu,
			HttpServletRequest httpServletRequest) {
		populateEditForm(uiModel, prgPrjSelectMenu);
		prgPrjSelectMenu.setCreateUser(httpServletRequest.getUserPrincipal().getName());
	}
}
