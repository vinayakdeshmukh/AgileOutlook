// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.ProgramDataOnDemand;
import com.hpe.ao.reference.Status;
import com.hpe.ao.service.ProgramService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProgramDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProgramDataOnDemand: @Component;
    
    private Random ProgramDataOnDemand.rnd = new SecureRandom();
    
    private List<Program> ProgramDataOnDemand.data;
    
    @Autowired
    ProgramService ProgramDataOnDemand.programService;
    
    public Program ProgramDataOnDemand.getNewTransientProgram(int index) {
        Program obj = new Program();
        setDescription(obj, index);
        setEndDateActual(obj, index);
        setEndDateBaseline(obj, index);
        setName(obj, index);
        setOrgName(obj, index);
        setStartDateActual(obj, index);
        setStartDateBaseline(obj, index);
        setStatus(obj, index);
        return obj;
    }
    
    public void ProgramDataOnDemand.setDescription(Program obj, int index) {
        String description = "description_" + index;
        if (description.length() > 250) {
            description = description.substring(0, 250);
        }
        obj.setDescription(description);
    }
    
    public void ProgramDataOnDemand.setEndDateActual(Program obj, int index) {
        Date endDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateActual(endDateActual);
    }
    
    public void ProgramDataOnDemand.setEndDateBaseline(Program obj, int index) {
        Date endDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateBaseline(endDateBaseline);
    }
    
    public void ProgramDataOnDemand.setName(Program obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public void ProgramDataOnDemand.setOrgName(Program obj, int index) {
        String orgName = "orgName_" + index;
        if (orgName.length() > 30) {
            orgName = orgName.substring(0, 30);
        }
        obj.setOrgName(orgName);
    }
    
    public void ProgramDataOnDemand.setStartDateActual(Program obj, int index) {
        Date startDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateActual(startDateActual);
    }
    
    public void ProgramDataOnDemand.setStartDateBaseline(Program obj, int index) {
        Date startDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateBaseline(startDateBaseline);
    }
    
    public void ProgramDataOnDemand.setStatus(Program obj, int index) {
        Status status = Status.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public Program ProgramDataOnDemand.getSpecificProgram(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Program obj = data.get(index);
        Long id = obj.getId();
        return programService.findProgram(id);
    }
    
    public Program ProgramDataOnDemand.getRandomProgram() {
        init();
        Program obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return programService.findProgram(id);
    }
    
    public boolean ProgramDataOnDemand.modifyProgram(Program obj) {
        return false;
    }
    
    public void ProgramDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = programService.findProgramEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Program' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Program>();
        for (int i = 0; i < 10; i++) {
            Program obj = getNewTransientProgram(i);
            try {
                programService.saveProgram(obj);
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
