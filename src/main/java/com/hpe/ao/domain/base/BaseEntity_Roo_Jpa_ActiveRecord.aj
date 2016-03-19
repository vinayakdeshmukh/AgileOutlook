// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.base;

import com.hpe.ao.domain.base.BaseEntity;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BaseEntity_Roo_Jpa_ActiveRecord {
    
    public static final List<String> BaseEntity.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "description");
    
    public static long BaseEntity.countBaseEntitys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BaseEntity o", Long.class).getSingleResult();
    }
    
    public static List<BaseEntity> BaseEntity.findAllBaseEntitys() {
        return entityManager().createQuery("SELECT o FROM BaseEntity o", BaseEntity.class).getResultList();
    }
    
    public static List<BaseEntity> BaseEntity.findAllBaseEntitys(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BaseEntity o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BaseEntity.class).getResultList();
    }
    
    public static BaseEntity BaseEntity.findBaseEntity(Long id) {
        if (id == null) return null;
        return entityManager().find(BaseEntity.class, id);
    }
    
    public static List<BaseEntity> BaseEntity.findBaseEntityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BaseEntity o", BaseEntity.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<BaseEntity> BaseEntity.findBaseEntityEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BaseEntity o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BaseEntity.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public BaseEntity BaseEntity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BaseEntity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
