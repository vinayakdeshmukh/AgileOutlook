// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.CapacityEntry;
import com.hpe.ao.service.CapacityEntryService;
import java.util.List;

privileged aspect CapacityEntryService_Roo_Service {
    
    public abstract long CapacityEntryService.countAllCapacityEntrys();    
    public abstract void CapacityEntryService.deleteCapacityEntry(CapacityEntry capacityEntry);    
    public abstract CapacityEntry CapacityEntryService.findCapacityEntry(Long id);    
    public abstract List<CapacityEntry> CapacityEntryService.findAllCapacityEntrys();    
    public abstract List<CapacityEntry> CapacityEntryService.findCapacityEntryEntries(int firstResult, int maxResults);    
    public abstract void CapacityEntryService.saveCapacityEntry(CapacityEntry capacityEntry);    
    public abstract CapacityEntry CapacityEntryService.updateCapacityEntry(CapacityEntry capacityEntry);    
}
