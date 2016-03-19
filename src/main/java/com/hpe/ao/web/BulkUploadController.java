package com.hpe.ao.web;

import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hpe.ao.domain.transaction.Feature;
import com.hpe.ao.model.FileUpload;
import com.hpe.ao.reference.FileUploadType;
import com.hpe.ao.service.FeatureService;

@RequestMapping("/bulkupload/**")
@Controller
public class BulkUploadController {

	@Autowired
	FeatureService featureSrv;

	@RequestMapping(method = RequestMethod.POST)
	public String post(@Valid FileUpload fileUpload, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, fileUpload, httpServletRequest);
			return "bulkupload/index";
		}
		uiModel.asMap().clear();
		uiModel.addAttribute("display", "success");
		MultipartFile file = (MultipartFile) fileUpload.getFile();
		featureSrv.bulkUpload(file, Feature.class);

		return "bulkupload/index";
	}

	@RequestMapping
	public String index(Model uiModel, HttpServletRequest httpServletRequest) {
		populateEditForm(uiModel, new FileUpload(), httpServletRequest);

		return "bulkupload/index";
	}

	private void populateEditForm(Model uiModel, FileUpload fileUpload, HttpServletRequest httpServletRequest) {
		uiModel.addAttribute("fileUpload", fileUpload);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("fileuploadtypes", Arrays.asList(FileUploadType.values()));

		fileUpload.setEffectiveDate(new Date());
		fileUpload.setCreateUser(httpServletRequest.getUserPrincipal().getName());

		uiModel.addAttribute("display", "form");
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("fileUpload_effectivedate_date_format",
				DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
	}
}
