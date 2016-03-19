package com.hpe.ao.web;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hpe.ao.domain.transaction.PrgPrjInitSetup;
import com.hpe.ao.service.PrgPrjInitSetupService;
import com.hpe.ao.util.AppUtil;

@RequestMapping("/prgprjinitsetups")
@Controller
@RooWebScaffold(path = "prgprjinitsetups", formBackingObject = PrgPrjInitSetup.class)
public class PrgPrjInitSetupController {

	@Autowired
	PrgPrjInitSetupService prgPrjInitSetupService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid PrgPrjInitSetup prgPrjInitSetup, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, prgPrjInitSetup);
			return "prgprjinitsetups/create";
		}
		uiModel.asMap().clear();
		prgPrjInitSetupService.savePrgPrjInitSetup(prgPrjInitSetup);
		return "index";
	}

	void populateEditForm(Model uiModel, PrgPrjInitSetup prgPrjInitSetup) {
		uiModel.addAttribute("prgPrjInitSetup", prgPrjInitSetup);
		addDateTimeFormatPatterns(uiModel);

		prgPrjInitSetup.setProgram1("STARS");
		prgPrjInitSetup.setOrgName("ODT");
		prgPrjInitSetup.setStartDateBaseline(AppUtil.getFirstMonday(2016, 1));
		prgPrjInitSetup.setProject11("STARS - Backend");
		prgPrjInitSetup.setProject11TeamAveragePointDaily(new BigDecimal(7));
		prgPrjInitSetup.setProject11TeamCount(new BigDecimal(4));
		prgPrjInitSetup.setProject11TeamSize(new BigDecimal(3));
		prgPrjInitSetup.setRelease111("Release-7");
		prgPrjInitSetup.setApplication111("CAT");
		prgPrjInitSetup.setApplication112("CIG");
		prgPrjInitSetup.setApplication113("OTP");
		prgPrjInitSetup.setProject12("STARS - Frontend");
		prgPrjInitSetup.setProject12TeamAveragePointDaily(new BigDecimal(7));
		prgPrjInitSetup.setProject12TeamCount(new BigDecimal(4));
		prgPrjInitSetup.setProject12TeamSize(new BigDecimal(3));
		prgPrjInitSetup.setRelease121("Release-7");
		prgPrjInitSetup.setApplication121("CAT");
		// prgPrjInitSetup.setApplication122("application122");
		// prgPrjInitSetup.setApplication123("application123");
	}
}
