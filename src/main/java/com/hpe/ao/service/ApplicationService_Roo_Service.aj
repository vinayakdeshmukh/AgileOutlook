// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.service.ApplicationService;
import java.util.List;

privileged aspect ApplicationService_Roo_Service {
    
    public abstract long ApplicationService.countAllApplications();    
    public abstract void ApplicationService.deleteApplication(Application application);    
    public abstract Application ApplicationService.findApplication(Long id);    
    public abstract List<Application> ApplicationService.findAllApplications();    
    public abstract List<Application> ApplicationService.findApplicationEntries(int firstResult, int maxResults);    
    public abstract void ApplicationService.saveApplication(Application application);    
    public abstract Application ApplicationService.updateApplication(Application application);    
}