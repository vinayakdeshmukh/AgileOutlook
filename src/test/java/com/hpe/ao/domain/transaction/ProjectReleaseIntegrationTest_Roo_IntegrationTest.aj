// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.ProjectReleaseDataOnDemand;
import com.hpe.ao.domain.transaction.ProjectReleaseIntegrationTest;
import com.hpe.ao.service.ProjectReleaseService;
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

privileged aspect ProjectReleaseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProjectReleaseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProjectReleaseIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProjectReleaseIntegrationTest: @Transactional;
    
    @Autowired
    ProjectReleaseDataOnDemand ProjectReleaseIntegrationTest.dod;
    
    @Autowired
    ProjectReleaseService ProjectReleaseIntegrationTest.projectReleaseService;
    
    @Test
    public void ProjectReleaseIntegrationTest.testCountAllProjectReleases() {
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", dod.getRandomProjectRelease());
        long count = projectReleaseService.countAllProjectReleases();
        Assert.assertTrue("Counter for 'ProjectRelease' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testFindProjectRelease() {
        ProjectRelease obj = dod.getRandomProjectRelease();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to provide an identifier", id);
        obj = projectReleaseService.findProjectRelease(id);
        Assert.assertNotNull("Find method for 'ProjectRelease' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ProjectRelease' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testFindAllProjectReleases() {
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", dod.getRandomProjectRelease());
        long count = projectReleaseService.countAllProjectReleases();
        Assert.assertTrue("Too expensive to perform a find all test for 'ProjectRelease', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ProjectRelease> result = projectReleaseService.findAllProjectReleases();
        Assert.assertNotNull("Find all method for 'ProjectRelease' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ProjectRelease' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testFindProjectReleaseEntries() {
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", dod.getRandomProjectRelease());
        long count = projectReleaseService.countAllProjectReleases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ProjectRelease> result = projectReleaseService.findProjectReleaseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ProjectRelease' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ProjectRelease' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testFlush() {
        ProjectRelease obj = dod.getRandomProjectRelease();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to provide an identifier", id);
        obj = projectReleaseService.findProjectRelease(id);
        Assert.assertNotNull("Find method for 'ProjectRelease' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProjectRelease(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ProjectRelease' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testUpdateProjectReleaseUpdate() {
        ProjectRelease obj = dod.getRandomProjectRelease();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to provide an identifier", id);
        obj = projectReleaseService.findProjectRelease(id);
        boolean modified =  dod.modifyProjectRelease(obj);
        Integer currentVersion = obj.getVersion();
        ProjectRelease merged = (ProjectRelease)projectReleaseService.updateProjectRelease(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ProjectRelease' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testSaveProjectRelease() {
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", dod.getRandomProjectRelease());
        ProjectRelease obj = dod.getNewTransientProjectRelease(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ProjectRelease' identifier to be null", obj.getId());
        try {
            projectReleaseService.saveProjectRelease(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'ProjectRelease' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProjectReleaseIntegrationTest.testDeleteProjectRelease() {
        ProjectRelease obj = dod.getRandomProjectRelease();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ProjectRelease' failed to provide an identifier", id);
        obj = projectReleaseService.findProjectRelease(id);
        projectReleaseService.deleteProjectRelease(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'ProjectRelease' with identifier '" + id + "'", projectReleaseService.findProjectRelease(id));
    }
    
}
