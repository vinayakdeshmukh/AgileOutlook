// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.Capacity;
import com.hpe.ao.domain.transaction.CapacityDataOnDemand;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectDataOnDemand;
import com.hpe.ao.service.CapacityService;
import java.math.BigDecimal;
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

privileged aspect CapacityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CapacityDataOnDemand: @Component;
    
    private Random CapacityDataOnDemand.rnd = new SecureRandom();
    
    private List<Capacity> CapacityDataOnDemand.data;
    
    @Autowired
    ProjectDataOnDemand CapacityDataOnDemand.projectDataOnDemand;
    
    @Autowired
    CapacityService CapacityDataOnDemand.capacityService;
    
    public Capacity CapacityDataOnDemand.getNewTransientCapacity(int index) {
        Capacity obj = new Capacity();
        setEffectiveDate(obj, index);
        setEntryComments(obj, index);
        setFactor1(obj, index);
        setFactor1Description(obj, index);
        setFactor2(obj, index);
        setFactor2Description(obj, index);
        setFactor3(obj, index);
        setFactor3Description(obj, index);
        setPointCapacityActual(obj, index);
        setPointCapacityBaseline(obj, index);
        setProject(obj, index);
        setTeamAvailabilityActual(obj, index);
        setTeamAvailabilityBaseline(obj, index);
        setTeamAveragePointDailyActual(obj, index);
        setTeamAveragePointDailyBaseline(obj, index);
        setTeamCountActual(obj, index);
        setTeamCountBaseline(obj, index);
        setTeamSizeActual(obj, index);
        setTeamSizeBaseline(obj, index);
        return obj;
    }
    
    public void CapacityDataOnDemand.setEffectiveDate(Capacity obj, int index) {
        Date effectiveDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEffectiveDate(effectiveDate);
    }
    
    public void CapacityDataOnDemand.setEntryComments(Capacity obj, int index) {
        String entryComments = "entryComments_" + index;
        if (entryComments.length() > 250) {
            entryComments = entryComments.substring(0, 250);
        }
        obj.setEntryComments(entryComments);
    }
    
    public void CapacityDataOnDemand.setFactor1(Capacity obj, int index) {
        BigDecimal factor1 = BigDecimal.valueOf(index);
        obj.setFactor1(factor1);
    }
    
    public void CapacityDataOnDemand.setFactor1Description(Capacity obj, int index) {
        String factor1Description = "factor1Description_" + index;
        obj.setFactor1Description(factor1Description);
    }
    
    public void CapacityDataOnDemand.setFactor2(Capacity obj, int index) {
        BigDecimal factor2 = BigDecimal.valueOf(index);
        obj.setFactor2(factor2);
    }
    
    public void CapacityDataOnDemand.setFactor2Description(Capacity obj, int index) {
        String factor2Description = "factor2Description_" + index;
        obj.setFactor2Description(factor2Description);
    }
    
    public void CapacityDataOnDemand.setFactor3(Capacity obj, int index) {
        BigDecimal factor3 = BigDecimal.valueOf(index);
        obj.setFactor3(factor3);
    }
    
    public void CapacityDataOnDemand.setFactor3Description(Capacity obj, int index) {
        String factor3Description = "factor3Description_" + index;
        obj.setFactor3Description(factor3Description);
    }
    
    public void CapacityDataOnDemand.setPointCapacityActual(Capacity obj, int index) {
        BigDecimal pointCapacityActual = BigDecimal.valueOf(index);
        obj.setPointCapacityActual(pointCapacityActual);
    }
    
    public void CapacityDataOnDemand.setPointCapacityBaseline(Capacity obj, int index) {
        BigDecimal pointCapacityBaseline = BigDecimal.valueOf(index);
        obj.setPointCapacityBaseline(pointCapacityBaseline);
    }
    
    public void CapacityDataOnDemand.setProject(Capacity obj, int index) {
        Project project = projectDataOnDemand.getRandomProject();
        obj.setProject(project);
    }
    
    public void CapacityDataOnDemand.setTeamAvailabilityActual(Capacity obj, int index) {
        BigDecimal teamAvailabilityActual = BigDecimal.valueOf(index);
        obj.setTeamAvailabilityActual(teamAvailabilityActual);
    }
    
    public void CapacityDataOnDemand.setTeamAvailabilityBaseline(Capacity obj, int index) {
        BigDecimal teamAvailabilityBaseline = BigDecimal.valueOf(index);
        obj.setTeamAvailabilityBaseline(teamAvailabilityBaseline);
    }
    
    public void CapacityDataOnDemand.setTeamAveragePointDailyActual(Capacity obj, int index) {
        BigDecimal teamAveragePointDailyActual = BigDecimal.valueOf(index);
        obj.setTeamAveragePointDailyActual(teamAveragePointDailyActual);
    }
    
    public void CapacityDataOnDemand.setTeamAveragePointDailyBaseline(Capacity obj, int index) {
        BigDecimal teamAveragePointDailyBaseline = BigDecimal.valueOf(index);
        obj.setTeamAveragePointDailyBaseline(teamAveragePointDailyBaseline);
    }
    
    public void CapacityDataOnDemand.setTeamCountActual(Capacity obj, int index) {
        BigDecimal teamCountActual = BigDecimal.valueOf(index);
        obj.setTeamCountActual(teamCountActual);
    }
    
    public void CapacityDataOnDemand.setTeamCountBaseline(Capacity obj, int index) {
        BigDecimal teamCountBaseline = BigDecimal.valueOf(index);
        obj.setTeamCountBaseline(teamCountBaseline);
    }
    
    public void CapacityDataOnDemand.setTeamSizeActual(Capacity obj, int index) {
        BigDecimal teamSizeActual = BigDecimal.valueOf(index);
        obj.setTeamSizeActual(teamSizeActual);
    }
    
    public void CapacityDataOnDemand.setTeamSizeBaseline(Capacity obj, int index) {
        BigDecimal teamSizeBaseline = BigDecimal.valueOf(index);
        obj.setTeamSizeBaseline(teamSizeBaseline);
    }
    
    public Capacity CapacityDataOnDemand.getSpecificCapacity(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Capacity obj = data.get(index);
        Long id = obj.getId();
        return capacityService.findCapacity(id);
    }
    
    public Capacity CapacityDataOnDemand.getRandomCapacity() {
        init();
        Capacity obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return capacityService.findCapacity(id);
    }
    
    public boolean CapacityDataOnDemand.modifyCapacity(Capacity obj) {
        return false;
    }
    
    public void CapacityDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = capacityService.findCapacityEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Capacity' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Capacity>();
        for (int i = 0; i < 10; i++) {
            Capacity obj = getNewTransientCapacity(i);
            try {
                capacityService.saveCapacity(obj);
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
