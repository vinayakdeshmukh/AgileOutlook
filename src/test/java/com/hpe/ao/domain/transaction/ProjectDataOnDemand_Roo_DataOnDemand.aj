// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.ProgramDataOnDemand;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectDataOnDemand;
import com.hpe.ao.reference.Status;
import com.hpe.ao.service.ProjectService;
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

privileged aspect ProjectDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProjectDataOnDemand: @Component;
    
    private Random ProjectDataOnDemand.rnd = new SecureRandom();
    
    private List<Project> ProjectDataOnDemand.data;
    
    @Autowired
    ProgramDataOnDemand ProjectDataOnDemand.programDataOnDemand;
    
    @Autowired
    ProjectService ProjectDataOnDemand.projectService;
    
    public Project ProjectDataOnDemand.getNewTransientProject(int index) {
        Project obj = new Project();
        setAveragePointsPerStory(obj, index);
        setAverageTeamCount(obj, index);
        setAverageTeamSize(obj, index);
        setDescription(obj, index);
        setEndDateActual(obj, index);
        setEndDateBaseline(obj, index);
        setLeadName(obj, index);
        setName(obj, index);
        setProgram(obj, index);
        setStartDateActual(obj, index);
        setStartDateBaseline(obj, index);
        setStatus(obj, index);
        setTeamAveragePointDaily(obj, index);
        return obj;
    }
    
    public void ProjectDataOnDemand.setAveragePointsPerStory(Project obj, int index) {
        BigDecimal averagePointsPerStory = BigDecimal.valueOf(index);
        obj.setAveragePointsPerStory(averagePointsPerStory);
    }
    
    public void ProjectDataOnDemand.setAverageTeamCount(Project obj, int index) {
        BigDecimal averageTeamCount = BigDecimal.valueOf(index);
        obj.setAverageTeamCount(averageTeamCount);
    }
    
    public void ProjectDataOnDemand.setAverageTeamSize(Project obj, int index) {
        BigDecimal averageTeamSize = BigDecimal.valueOf(index);
        obj.setAverageTeamSize(averageTeamSize);
    }
    
    public void ProjectDataOnDemand.setDescription(Project obj, int index) {
        String description = "description_" + index;
        if (description.length() > 250) {
            description = description.substring(0, 250);
        }
        obj.setDescription(description);
    }
    
    public void ProjectDataOnDemand.setEndDateActual(Project obj, int index) {
        Date endDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateActual(endDateActual);
    }
    
    public void ProjectDataOnDemand.setEndDateBaseline(Project obj, int index) {
        Date endDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDateBaseline(endDateBaseline);
    }
    
    public void ProjectDataOnDemand.setLeadName(Project obj, int index) {
        String leadName = "leadName_" + index;
        if (leadName.length() > 30) {
            leadName = leadName.substring(0, 30);
        }
        obj.setLeadName(leadName);
    }
    
    public void ProjectDataOnDemand.setName(Project obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public void ProjectDataOnDemand.setProgram(Project obj, int index) {
        Program program = programDataOnDemand.getRandomProgram();
        obj.setProgram(program);
    }
    
    public void ProjectDataOnDemand.setStartDateActual(Project obj, int index) {
        Date startDateActual = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateActual(startDateActual);
    }
    
    public void ProjectDataOnDemand.setStartDateBaseline(Project obj, int index) {
        Date startDateBaseline = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDateBaseline(startDateBaseline);
    }
    
    public void ProjectDataOnDemand.setStatus(Project obj, int index) {
        Status status = Status.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public void ProjectDataOnDemand.setTeamAveragePointDaily(Project obj, int index) {
        BigDecimal teamAveragePointDaily = BigDecimal.valueOf(index);
        obj.setTeamAveragePointDaily(teamAveragePointDaily);
    }
    
    public Project ProjectDataOnDemand.getSpecificProject(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Project obj = data.get(index);
        Long id = obj.getId();
        return projectService.findProject(id);
    }
    
    public Project ProjectDataOnDemand.getRandomProject() {
        init();
        Project obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return projectService.findProject(id);
    }
    
    public boolean ProjectDataOnDemand.modifyProject(Project obj) {
        return false;
    }
    
    public void ProjectDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = projectService.findProjectEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Project' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Project>();
        for (int i = 0; i < 10; i++) {
            Project obj = getNewTransientProject(i);
            try {
                projectService.saveProject(obj);
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
