// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.ProgressEntry;
import com.hpe.ao.service.ProgressEntryService;
import java.util.List;

privileged aspect ProgressEntryService_Roo_Service {
    
    public abstract long ProgressEntryService.countAllProgressEntrys();    
    public abstract void ProgressEntryService.deleteProgressEntry(ProgressEntry progressEntry);    
    public abstract ProgressEntry ProgressEntryService.findProgressEntry(Long id);    
    public abstract List<ProgressEntry> ProgressEntryService.findAllProgressEntrys();    
    public abstract List<ProgressEntry> ProgressEntryService.findProgressEntryEntries(int firstResult, int maxResults);    
    public abstract void ProgressEntryService.saveProgressEntry(ProgressEntry progressEntry);    
    public abstract ProgressEntry ProgressEntryService.updateProgressEntry(ProgressEntry progressEntry);    
}
