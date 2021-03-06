// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.web;

import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.reference.Status;
import com.hpe.ao.service.ApplicationService;
import com.hpe.ao.service.ProjectService;
import com.hpe.ao.service.TagService;
import com.hpe.ao.web.ApplicationController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ApplicationController_Roo_Controller {
    
    @Autowired
    ProjectService ApplicationController.projectService;
    
    @Autowired
    ApplicationService ApplicationController.applicationService;
    
    @Autowired
    TagService ApplicationController.tagService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ApplicationController.create(@Valid Application application, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, application);
            return "applications/create";
        }
        uiModel.asMap().clear();
        applicationService.saveApplication(application);
        return "redirect:/applications/" + encodeUrlPathSegment(application.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ApplicationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Application());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (projectService.countAllProjects() == 0) {
            dependencies.add(new String[] { "project", "projects" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "applications/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ApplicationController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("application", applicationService.findApplication(id));
        uiModel.addAttribute("itemId", id);
        return "applications/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ApplicationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("applications", Application.findApplicationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) applicationService.countAllApplications() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("applications", Application.findAllApplications(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "applications/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ApplicationController.update(@Valid Application application, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, application);
            return "applications/update";
        }
        uiModel.asMap().clear();
        applicationService.updateApplication(application);
        return "redirect:/applications/" + encodeUrlPathSegment(application.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ApplicationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, applicationService.findApplication(id));
        return "applications/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ApplicationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Application application = applicationService.findApplication(id);
        applicationService.deleteApplication(application);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/applications";
    }
    
    void ApplicationController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("application_startdatebaseline_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("application_enddatebaseline_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("application_startdateactual_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("application_enddateactual_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ApplicationController.populateEditForm(Model uiModel, Application application) {
        uiModel.addAttribute("application", application);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tags", tagService.findAllTags());
        uiModel.addAttribute("projects", projectService.findAllProjects());
        uiModel.addAttribute("statuses", Arrays.asList(Status.values()));
    }
    
    String ApplicationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
