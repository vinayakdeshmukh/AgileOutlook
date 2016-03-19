// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.web;

import com.hpe.ao.domain.transaction.Feature;
import com.hpe.ao.domain.transaction.ProgressEntry;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.service.FeatureService;
import com.hpe.ao.service.ProgressEntryService;
import com.hpe.ao.service.ProjectService;
import com.hpe.ao.web.ProgressEntryController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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

privileged aspect ProgressEntryController_Roo_Controller {
    
    @Autowired
    ProjectService ProgressEntryController.projectService;
    
    @Autowired
    FeatureService ProgressEntryController.featureService;
    
    @Autowired
    ProgressEntryService ProgressEntryController.progressEntryService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProgressEntryController.create(@Valid ProgressEntry progressEntry, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, progressEntry);
            return "progressentrys/create";
        }
        uiModel.asMap().clear();
        progressEntryService.saveProgressEntry(progressEntry);
        return "redirect:/progressentrys/" + encodeUrlPathSegment(progressEntry.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProgressEntryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProgressEntry());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (projectService.countAllProjects() == 0) {
            dependencies.add(new String[] { "project", "projects" });
        }
        if (featureService.countAllFeatures() == 0) {
            dependencies.add(new String[] { "feature", "features" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "progressentrys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProgressEntryController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("progressentry", progressEntryService.findProgressEntry(id));
        uiModel.addAttribute("itemId", id);
        return "progressentrys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProgressEntryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("progressentrys", ProgressEntry.findProgressEntryEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) progressEntryService.countAllProgressEntrys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("progressentrys", ProgressEntry.findAllProgressEntrys(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "progressentrys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProgressEntryController.update(@Valid ProgressEntry progressEntry, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, progressEntry);
            return "progressentrys/update";
        }
        uiModel.asMap().clear();
        progressEntryService.updateProgressEntry(progressEntry);
        return "redirect:/progressentrys/" + encodeUrlPathSegment(progressEntry.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProgressEntryController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, progressEntryService.findProgressEntry(id));
        return "progressentrys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProgressEntryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProgressEntry progressEntry = progressEntryService.findProgressEntry(id);
        progressEntryService.deleteProgressEntry(progressEntry);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/progressentrys";
    }
    
    void ProgressEntryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("progressEntry_effectivedate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ProgressEntryController.populateEditForm(Model uiModel, ProgressEntry progressEntry) {
        uiModel.addAttribute("progressEntry", progressEntry);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("features", featureService.findAllFeatures());
        uiModel.addAttribute("projects", projectService.findAllProjects());
    }
    
    String ProgressEntryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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