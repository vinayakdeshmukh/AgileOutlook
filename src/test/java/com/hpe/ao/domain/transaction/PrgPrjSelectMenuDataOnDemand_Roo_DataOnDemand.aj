// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.PrgPrjSelectMenu;
import com.hpe.ao.domain.transaction.PrgPrjSelectMenuDataOnDemand;
import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.ProgramDataOnDemand;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectDataOnDemand;
import com.hpe.ao.service.PrgPrjSelectMenuService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PrgPrjSelectMenuDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PrgPrjSelectMenuDataOnDemand: @Component;
    
    private Random PrgPrjSelectMenuDataOnDemand.rnd = new SecureRandom();
    
    private List<PrgPrjSelectMenu> PrgPrjSelectMenuDataOnDemand.data;
    
    @Autowired
    ProgramDataOnDemand PrgPrjSelectMenuDataOnDemand.programDataOnDemand;
    
    @Autowired
    ProjectDataOnDemand PrgPrjSelectMenuDataOnDemand.projectDataOnDemand;
    
    @Autowired
    PrgPrjSelectMenuService PrgPrjSelectMenuDataOnDemand.prgPrjSelectMenuService;
    
    public PrgPrjSelectMenu PrgPrjSelectMenuDataOnDemand.getNewTransientPrgPrjSelectMenu(int index) {
        PrgPrjSelectMenu obj = new PrgPrjSelectMenu();
        setCreateUser(obj, index);
        setProgram(obj, index);
        setProject(obj, index);
        return obj;
    }
    
    public void PrgPrjSelectMenuDataOnDemand.setCreateUser(PrgPrjSelectMenu obj, int index) {
        String createUser = "createUser_" + index;
        if (createUser.length() > 30) {
            createUser = createUser.substring(0, 30);
        }
        obj.setCreateUser(createUser);
    }
    
    public void PrgPrjSelectMenuDataOnDemand.setProgram(PrgPrjSelectMenu obj, int index) {
        Program program = programDataOnDemand.getRandomProgram();
        obj.setProgram(program);
    }
    
    public void PrgPrjSelectMenuDataOnDemand.setProject(PrgPrjSelectMenu obj, int index) {
        Project project = projectDataOnDemand.getRandomProject();
        obj.setProject(project);
    }
    
    public PrgPrjSelectMenu PrgPrjSelectMenuDataOnDemand.getSpecificPrgPrjSelectMenu(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PrgPrjSelectMenu obj = data.get(index);
        Long id = obj.getId();
        return prgPrjSelectMenuService.findPrgPrjSelectMenu(id);
    }
    
    public PrgPrjSelectMenu PrgPrjSelectMenuDataOnDemand.getRandomPrgPrjSelectMenu() {
        init();
        PrgPrjSelectMenu obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return prgPrjSelectMenuService.findPrgPrjSelectMenu(id);
    }
    
    public boolean PrgPrjSelectMenuDataOnDemand.modifyPrgPrjSelectMenu(PrgPrjSelectMenu obj) {
        return false;
    }
    
    public void PrgPrjSelectMenuDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = prgPrjSelectMenuService.findPrgPrjSelectMenuEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PrgPrjSelectMenu' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PrgPrjSelectMenu>();
        for (int i = 0; i < 10; i++) {
            PrgPrjSelectMenu obj = getNewTransientPrgPrjSelectMenu(i);
            try {
                prgPrjSelectMenuService.savePrgPrjSelectMenu(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
