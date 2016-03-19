package com.hpe.ao.web;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hpe.ao.domain.transaction.Feature;

@RequestMapping("/features")
@Controller
@RooWebScaffold(path = "features", formBackingObject = Feature.class)
public class FeatureController {

	static Logger logger = Logger.getLogger(FeatureController.class.getName());

	@RequestMapping(params = "listbyrelease", produces = "text/html")
	public String listbyrelease(@RequestParam(value = "listbyrelease", required = true) Long releaseId,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			@RequestParam(value = "sortFieldName", required = false) String sortFieldName,
			@RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
		logger.debug("IN - listbyrelease() releaseId = " + releaseId);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;

			uiModel.addAttribute("features", featureService.getFeatureListByProjectRelease(firstResult, sizeNo,
					sortFieldName, sortOrder, releaseId));
			float nrOfPages = (float) featureService.countAllFeatures() / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("features",
					featureService.getFeatureListByProjectRelease(sortFieldName, sortOrder, releaseId));
		}
		// addDateTimeFormatPatterns(uiModel);
		return "features/list";
	}
}
