package com.hpe.ao.web;

import org.apache.log4j.Logger;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.model.ReleaseSummary;

@RequestMapping("/projectreleases")
@Controller
@RooWebScaffold(path = "projectreleases", formBackingObject = ProjectRelease.class)
public class ProjectReleaseController {
	static Logger logger = Logger.getLogger(ProjectReleaseController.class.getName());

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Long id, Model uiModel) {

		ReleaseSummary relSumm = projectReleaseService.getReleaseSummary(id);
		uiModel.addAttribute("releaseSummary", relSumm);

		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("common_date_format",
				DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));

		uiModel.addAttribute("projectrelease", projectReleaseService.findProjectRelease(id));
		uiModel.addAttribute("itemId", id);
		return "projectreleases/show";
	}

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

			uiModel.addAttribute("projectreleases", projectReleaseService.getProjectReleaseListByProject(firstResult,
					sizeNo, sortFieldName, sortOrder, projectId));
			float nrOfPages = (float) projectReleaseService.countAllProjectReleases() / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("projectreleases",
					projectReleaseService.getProjectReleaseListByProject(sortFieldName, sortOrder, projectId));
		}
		// addDateTimeFormatPatterns(uiModel);
		return "projectreleases/list";
	}
}
