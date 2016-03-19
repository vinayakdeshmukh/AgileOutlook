// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.ProjectDataOnDemand;
import com.hpe.ao.domain.transaction.ProjectIntegrationTest;
import com.hpe.ao.service.ProjectService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjectIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProjectIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProjectIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProjectIntegrationTest: @Transactional;
    
    @Autowired
    ProjectDataOnDemand ProjectIntegrationTest.dod;
    
    @Autowired
    ProjectService ProjectIntegrationTest.projectService;
    
    @Test
    public void ProjectIntegrationTest.testCountAllProjects() {
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", dod.getRandomProject());
        long count = projectService.countAllProjects();
        Assert.assertTrue("Counter for 'Project' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProjectIntegrationTest.testFindProject() {
        Project obj = dod.getRandomProject();
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Project' failed to provide an identifier", id);
        obj = projectService.findProject(id);
        Assert.assertNotNull("Find method for 'Project' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Project' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProjectIntegrationTest.testFindAllProjects() {
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", dod.getRandomProject());
        long count = projectService.countAllProjects();
        Assert.assertTrue("Too expensive to perform a find all test for 'Project', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Project> result = projectService.findAllProjects();
        Assert.assertNotNull("Find all method for 'Project' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Project' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProjectIntegrationTest.testFindProjectEntries() {
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", dod.getRandomProject());
        long count = projectService.countAllProjects();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Project> result = projectService.findProjectEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Project' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Project' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProjectIntegrationTest.testFlush() {
        Project obj = dod.getRandomProject();
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Project' failed to provide an identifier", id);
        obj = projectService.findProject(id);
        Assert.assertNotNull("Find method for 'Project' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProject(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Project' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectIntegrationTest.testUpdateProjectUpdate() {
        Project obj = dod.getRandomProject();
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Project' failed to provide an identifier", id);
        obj = projectService.findProject(id);
        boolean modified =  dod.modifyProject(obj);
        Integer currentVersion = obj.getVersion();
        Project merged = (Project)projectService.updateProject(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Project' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectIntegrationTest.testSaveProject() {
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", dod.getRandomProject());
        Project obj = dod.getNewTransientProject(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Project' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Project' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Project' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProjectIntegrationTest.testDeleteProject() {
        Project obj = dod.getRandomProject();
        Assert.assertNotNull("Data on demand for 'Project' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Project' failed to provide an identifier", id);
        obj = projectService.findProject(id);
        projectService.deleteProject(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Project' with identifier '" + id + "'", projectService.findProject(id));
    }
    
}
