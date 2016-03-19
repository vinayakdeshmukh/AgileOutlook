package com.hpe.ao.web;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hpe.ao.domain.transaction.Application;

@RequestMapping("/applications")
@Controller
@RooWebScaffold(path = "applications", formBackingObject = Application.class)
public class ApplicationController {

	static Logger logger = Logger.getLogger(ApplicationController.class.getName());

	@RequestMapping(params = "listbyproject", produces = "text/html")
	public String listbyproject(@RequestParam(value = "listbyproject", required = true) Long projectId,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			@RequestParam(value = "sortFieldName", required = false) String sortFieldName,
			@RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
		logger.debug("IN - listbyrelease() projectId = " + projectId);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;

			uiModel.addAttribute("applications", applicationService.getApplicationListByProject(firstResult, sizeNo,
					sortFieldName, sortOrder, projectId));
			float nrOfPages = (float) applicationService.countAllApplications() / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("applications",
					applicationService.getApplicationListByProject(sortFieldName, sortOrder, projectId));
		}
		addDateTimeFormatPatterns(uiModel);
		return "applications/list";
	}
}
