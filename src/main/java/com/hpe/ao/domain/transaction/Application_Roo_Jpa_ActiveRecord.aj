// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.transaction;

import com.hpe.ao.domain.transaction.Application;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Application_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Application.fieldNames4OrderClauseFilter = java.util.Arrays.asList("leadName", "project", "priority", "storyCountBaseline", "storyPointBaseline", "storyCountActual", "storyPointActual");
    
    public static long Application.countApplications() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Application o", Long.class).getSingleResult();
    }
    
    public static List<Application> Application.findAllApplications() {
        return entityManager().createQuery("SELECT o FROM Application o", Application.class).getResultList();
    }
    
    public static List<Application> Application.findAllApplications(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Application o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Application.class).getResultList();
    }
    
    public static Application Application.findApplication(Long id) {
        if (id == null) return null;
        return entityManager().find(Application.class, id);
    }
    
    public static List<Application> Application.findApplicationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Application o", Application.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Application> Application.findApplicationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Application o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Application.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Application Application.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Application merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
