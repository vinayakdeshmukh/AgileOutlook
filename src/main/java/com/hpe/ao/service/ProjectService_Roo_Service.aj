// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.service.ProjectService;
import java.util.List;

privileged aspect ProjectService_Roo_Service {
    
    public abstract long ProjectService.countAllProjects();    
    public abstract void ProjectService.deleteProject(Project project);    
    public abstract Project ProjectService.findProject(Long id);    
    public abstract List<Project> ProjectService.findAllProjects();    
    public abstract List<Project> ProjectService.findProjectEntries(int firstResult, int maxResults);    
    public abstract void ProjectService.saveProject(Project project);    
    public abstract Project ProjectService.updateProject(Project project);    
}
