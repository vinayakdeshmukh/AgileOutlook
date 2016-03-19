package com.hpe.ao.web;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hpe.ao.domain.transaction.ProgressEntry;

@RequestMapping("/progressentrys")
@Controller
@RooWebScaffold(path = "progressentrys", formBackingObject = ProgressEntry.class)
public class ProgressEntryController {
}
