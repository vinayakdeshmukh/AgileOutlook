// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.domain.transaction.ApplicationDataOnDemand;
import com.hpe.ao.domain.transaction.Feature;
import com.hpe.ao.domain.transaction.FeatureDataOnDemand;
import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.domain.transaction.ProjectReleaseDataOnDemand;
import com.hpe.ao.reference.Status;
import com.hpe.ao.service.FeatureService;
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

privileged aspect FeatureDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FeatureDataOnDemand: @Component;
    
    private Random FeatureDataOnDemand.rnd = new SecureRandom();
    
    private List<Feature> FeatureDataOnDemand.data;
    
    @Autowired
    ApplicationDataOnDemand FeatureDataOnDemand.applicationDataOnDemand;
    
    @Autowired
    ProjectReleaseDataOnDemand FeatureDataOnDemand.projectReleaseDataOnDemand;
    
    @Autowired
    FeatureService FeatureDataOnDemand.featureService;
    
    public Feature FeatureDataOnDemand.getNewTransientFeature(int index) {
        Feature obj = new Feature();
        setApplication(obj, index);
        setDescription(obj, index);
        setEndDateActual(obj, index);
        setEndDateBaseline(obj, index);
        setLeadName(obj, index);
        setName(obj, index);
        setProjectRelease(obj, index);
        setStartDateActual(obj, index);
        setStartDateBaseline(obj, index);
        setStatus(obj, index);
        setStoryCountActual(obj, index);
        setStoryCountBaseline(obj, index);
        setStoryPointActual(obj, index);
        setStoryPointBaseline(obj, index);
        return obj;
    }
    
    public void FeatureDataOnDemand.setApplication(Feature obj, int index) {
        Application application = applicationDataOnDemand.getRandomApplication();
        obj.setApplication(application);
    }
    
    public void FeatureDataOnDemand.setDescription(Feature obj, int index) {
        String description = "description_" + index;
        if (description.length() > 250) {
            description = description.substring(0, 250);
        }
        obj.setDescription(description);
    }
    
    public void FeatureDataOnDemand.setEndDateActual(Feature obj, int index) {
        Date endDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateActual(endDateActual);
    }
    
    public void FeatureDataOnDemand.setEndDateBaseline(Feature obj, int index) {
        Date endDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateBaseline(endDateBaseline);
    }
    
    public void FeatureDataOnDemand.setLeadName(Feature obj, int index) {
        String leadName = "leadName_" + index;
        if (leadName.length() > 30) {
            leadName = leadName.substring(0, 30);
        }
        obj.setLeadName(leadName);
    }
    
    public void FeatureDataOnDemand.setName(Feature obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public void FeatureDataOnDemand.setProjectRelease(Feature obj, int index) {
        ProjectRelease projectRelease = projectReleaseDataOnDemand.getRandomProjectRelease();
        obj.setProjectRelease(projectRelease);
    }
    
    public void FeatureDataOnDemand.setStartDateActual(Feature obj, int index) {
        Date startDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateActual(startDateActual);
    }
    
    public void FeatureDataOnDemand.setStartDateBaseline(Feature obj, int index) {
        Date startDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateBaseline(startDateBaseline);
    }
    
    public void FeatureDataOnDemand.setStatus(Feature obj, int index) {
        Status status = Status.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public void FeatureDataOnDemand.setStoryCountActual(Feature obj, int index) {
        BigDecimal storyCountActual = BigDecimal.valueOf(index);
        obj.setStoryCountActual(storyCountActual);
    }
    
    public void FeatureDataOnDemand.setStoryCountBaseline(Feature obj, int index) {
        BigDecimal storyCountBaseline = BigDecimal.valueOf(index);
        obj.setStoryCountBaseline(storyCountBaseline);
    }
    
    public void FeatureDataOnDemand.setStoryPointActual(Feature obj, int index) {
        BigDecimal storyPointActual = BigDecimal.valueOf(index);
        obj.setStoryPointActual(storyPointActual);
    }
    
    public void FeatureDataOnDemand.setStoryPointBaseline(Feature obj, int index) {
        BigDecimal storyPointBaseline = BigDecimal.valueOf(index);
        obj.setStoryPointBaseline(storyPointBaseline);
    }
    
    public Feature FeatureDataOnDemand.getSpecificFeature(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Feature obj = data.get(index);
        Long id = obj.getId();
        return featureService.findFeature(id);
    }
    
    public Feature FeatureDataOnDemand.getRandomFeature() {
        init();
        Feature obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return featureService.findFeature(id);
    }
    
    public boolean FeatureDataOnDemand.modifyFeature(Feature obj) {
        return false;
    }
    
    public void FeatureDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = featureService.findFeatureEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Feature' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Feature>();
        for (int i = 0; i < 10; i++) {
            Feature obj = getNewTransientFeature(i);
            try {
                featureService.saveFeature(obj);
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