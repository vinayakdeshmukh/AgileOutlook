// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.Capacity;
import com.hpe.ao.service.CapacityService;
import java.util.List;

privileged aspect CapacityService_Roo_Service {
    
    public abstract long CapacityService.countAllCapacitys();    
    public abstract void CapacityService.deleteCapacity(Capacity capacity);    
    public abstract Capacity CapacityService.findCapacity(Long id);    
    public abstract List<Capacity> CapacityService.findAllCapacitys();    
    public abstract List<Capacity> CapacityService.findCapacityEntries(int firstResult, int maxResults);    
    public abstract void CapacityService.saveCapacity(Capacity capacity);    
    public abstract Capacity CapacityService.updateCapacity(Capacity capacity);    
}
