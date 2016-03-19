package com.hpe.ao.web;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hpe.ao.domain.framework.TransactionLog;

@RequestMapping("/transactionlogs")
@Controller
@RooWebScaffold(path = "transactionlogs", formBackingObject = TransactionLog.class)
public class TransactionLogController {
}
