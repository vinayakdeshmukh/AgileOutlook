// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.CapacityEntry;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.reference.CapacityEntryType;
import java.math.BigDecimal;
import java.util.Date;

privileged aspect CapacityEntry_Roo_JavaBean {
    
    public Project CapacityEntry.getProject() {
        return this.project;
    }
    
    public void CapacityEntry.setProject(Project project) {
        this.project = project;
    }
    
    public Date CapacityEntry.getStartDate() {
        return this.startDate;
    }
    
    public void CapacityEntry.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date CapacityEntry.getEndDate() {
        return this.endDate;
    }
    
    public void CapacityEntry.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public CapacityEntryType CapacityEntry.getCapacityEntryType() {
        return this.capacityEntryType;
    }
    
    public void CapacityEntry.setCapacityEntryType(CapacityEntryType capacityEntryType) {
        this.capacityEntryType = capacityEntryType;
    }
    
    public BigDecimal CapacityEntry.getTeamCount() {
        return this.teamCount;
    }
    
    public void CapacityEntry.setTeamCount(BigDecimal teamCount) {
        this.teamCount = teamCount;
    }
    
    public BigDecimal CapacityEntry.getTeamSize() {
        return this.teamSize;
    }
    
    public void CapacityEntry.setTeamSize(BigDecimal teamSize) {
        this.teamSize = teamSize;
    }
    
    public BigDecimal CapacityEntry.getTeamAvailability() {
        return this.teamAvailability;
    }
    
    public void CapacityEntry.setTeamAvailability(BigDecimal teamAvailability) {
        this.teamAvailability = teamAvailability;
    }
    
    public BigDecimal CapacityEntry.getTeamAveragePointDaily() {
        return this.teamAveragePointDaily;
    }
    
    public void CapacityEntry.setTeamAveragePointDaily(BigDecimal teamAveragePointDaily) {
        this.teamAveragePointDaily = teamAveragePointDaily;
    }
    
    public BigDecimal CapacityEntry.getPointCapacity() {
        return this.pointCapacity;
    }
    
    public void CapacityEntry.setPointCapacity(BigDecimal pointCapacity) {
        this.pointCapacity = pointCapacity;
    }
    
    public BigDecimal CapacityEntry.getFactor1() {
        return this.factor1;
    }
    
    public void CapacityEntry.setFactor1(BigDecimal factor1) {
        this.factor1 = factor1;
    }
    
    public String CapacityEntry.getFactor1Description() {
        return this.factor1Description;
    }
    
    public void CapacityEntry.setFactor1Description(String factor1Description) {
        this.factor1Description = factor1Description;
    }
    
    public BigDecimal CapacityEntry.getFactor2() {
        return this.factor2;
    }
    
    public void CapacityEntry.setFactor2(BigDecimal factor2) {
        this.factor2 = factor2;
    }
    
    public String CapacityEntry.getFactor2Description() {
        return this.factor2Description;
    }
    
    public void CapacityEntry.setFactor2Description(String factor2Description) {
        this.factor2Description = factor2Description;
    }
    
    public BigDecimal CapacityEntry.getFactor3() {
        return this.factor3;
    }
    
    public void CapacityEntry.setFactor3(BigDecimal factor3) {
        this.factor3 = factor3;
    }
    
    public String CapacityEntry.getFactor3Description() {
        return this.factor3Description;
    }
    
    public void CapacityEntry.setFactor3Description(String factor3Description) {
        this.factor3Description = factor3Description;
    }
    
    public String CapacityEntry.getEntryComments() {
        return this.entryComments;
    }
    
    public void CapacityEntry.setEntryComments(String entryComments) {
        this.entryComments = entryComments;
    }
    
}