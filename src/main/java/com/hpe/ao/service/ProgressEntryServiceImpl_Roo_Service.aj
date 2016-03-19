// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.ProgressEntry;
import com.hpe.ao.service.ProgressEntryServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProgressEntryServiceImpl_Roo_Service {
    
    declare @type: ProgressEntryServiceImpl: @Service;
    
    declare @type: ProgressEntryServiceImpl: @Transactional;
    
    public long ProgressEntryServiceImpl.countAllProgressEntrys() {
        return ProgressEntry.countProgressEntrys();
    }
    
    public void ProgressEntryServiceImpl.deleteProgressEntry(ProgressEntry progressEntry) {
        progressEntry.remove();
    }
    
    public ProgressEntry ProgressEntryServiceImpl.findProgressEntry(Long id) {
        return ProgressEntry.findProgressEntry(id);
    }
    
    public List<ProgressEntry> ProgressEntryServiceImpl.findAllProgressEntrys() {
        return ProgressEntry.findAllProgressEntrys();
    }
    
    public List<ProgressEntry> ProgressEntryServiceImpl.findProgressEntryEntries(int firstResult, int maxResults) {
        return ProgressEntry.findProgressEntryEntries(firstResult, maxResults);
    }
    
    public void ProgressEntryServiceImpl.saveProgressEntry(ProgressEntry progressEntry) {
        progressEntry.persist();
    }
    
    public ProgressEntry ProgressEntryServiceImpl.updateProgressEntry(ProgressEntry progressEntry) {
        return progressEntry.merge();
    }
    
}