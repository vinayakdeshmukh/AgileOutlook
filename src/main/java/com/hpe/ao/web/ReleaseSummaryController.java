package com.hpe.ao.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hpe.ao.model.ReleaseSummary;
import com.hpe.ao.service.ProjectReleaseService;

@RequestMapping("/releasesummary/**")
@Controller
public class ReleaseSummaryController {

	@Autowired
	ProjectReleaseService prjRelSrv;

	@RequestMapping(method = RequestMethod.POST, value = "{id}")
	public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request,
			HttpServletResponse response) {
	}

	@RequestMapping
	public String index(Model uiModel, HttpServletRequest httpServletRequest) {

		ReleaseSummary relSumm = prjRelSrv.getReleaseSummary(new Long(1));
		populateEditForm(uiModel, relSumm, httpServletRequest);

		return "releasesummary/index";
	}

	private void populateEditForm(Model uiModel, ReleaseSummary relSumm, HttpServletRequest httpServletRequest) {
		uiModel.addAttribute("releaseSummary", relSumm);
		uiModel.addAttribute("projectReleases", prjRelSrv.findAllProjectReleases());
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("display", "form");
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("releaseSummary_startDateSIT_date_format",
				DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
	}
}
