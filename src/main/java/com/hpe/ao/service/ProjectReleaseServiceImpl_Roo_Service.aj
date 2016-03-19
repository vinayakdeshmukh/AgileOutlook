// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.service.ProjectReleaseServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjectReleaseServiceImpl_Roo_Service {
    
    declare @type: ProjectReleaseServiceImpl: @Service;
    
    declare @type: ProjectReleaseServiceImpl: @Transactional;
    
    public long ProjectReleaseServiceImpl.countAllProjectReleases() {
        return ProjectRelease.countProjectReleases();
    }
    
    public void ProjectReleaseServiceImpl.deleteProjectRelease(ProjectRelease projectRelease) {
        projectRelease.remove();
    }
    
    public ProjectRelease ProjectReleaseServiceImpl.findProjectRelease(Long id) {
        return ProjectRelease.findProjectRelease(id);
    }
    
    public List<ProjectRelease> ProjectReleaseServiceImpl.findAllProjectReleases() {
        return ProjectRelease.findAllProjectReleases();
    }
    
    public List<ProjectRelease> ProjectReleaseServiceImpl.findProjectReleaseEntries(int firstResult, int maxResults) {
        return ProjectRelease.findProjectReleaseEntries(firstResult, maxResults);
    }
    
    public void ProjectReleaseServiceImpl.saveProjectRelease(ProjectRelease projectRelease) {
        projectRelease.persist();
    }
    
    public ProjectRelease ProjectReleaseServiceImpl.updateProjectRelease(ProjectRelease projectRelease) {
        return projectRelease.merge();
    }
    
}
