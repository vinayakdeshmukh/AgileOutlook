// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.web;

import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.reference.Status;
import com.hpe.ao.service.ProgramService;
import com.hpe.ao.service.TagService;
import com.hpe.ao.web.ProgramController;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
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

privileged aspect ProgramController_Roo_Controller {
    
    @Autowired
    ProgramService ProgramController.programService;
    
    @Autowired
    TagService ProgramController.tagService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProgramController.create(@Valid Program program, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, program);
            return "programs/create";
        }
        uiModel.asMap().clear();
        programService.saveProgram(program);
        return "redirect:/programs/" + encodeUrlPathSegment(program.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProgramController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Program());
        return "programs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProgramController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("program", programService.findProgram(id));
        uiModel.addAttribute("itemId", id);
        return "programs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProgramController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("programs", Program.findProgramEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) programService.countAllPrograms() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("programs", Program.findAllPrograms(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "programs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProgramController.update(@Valid Program program, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, program);
            return "programs/update";
        }
        uiModel.asMap().clear();
        programService.updateProgram(program);
        return "redirect:/programs/" + encodeUrlPathSegment(program.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProgramController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, programService.findProgram(id));
        return "programs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProgramController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Program program = programService.findProgram(id);
        programService.deleteProgram(program);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/programs";
    }
    
    void ProgramController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("program_startdatebaseline_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("program_enddatebaseline_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("program_startdateactual_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("program_enddateactual_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ProgramController.populateEditForm(Model uiModel, Program program) {
        uiModel.addAttribute("program", program);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tags", tagService.findAllTags());
        uiModel.addAttribute("statuses", Arrays.asList(Status.values()));
    }
    
    String ProgramController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
