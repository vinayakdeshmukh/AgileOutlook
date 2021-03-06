// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.framework;

import com.hpe.ao.domain.framework.TransactionLog;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect TransactionLog_Roo_Jpa_Entity {
    
    declare @type: TransactionLog: @Entity;
    
    declare @type: TransactionLog: @Table(name = "T1_TRNS_LOG");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long TransactionLog.id;
    
    @Version
    @Column(name = "version")
    private Integer TransactionLog.version;
    
    public Long TransactionLog.getId() {
        return this.id;
    }
    
    public void TransactionLog.setId(Long id) {
        this.id = id;
    }
    
    public Integer TransactionLog.getVersion() {
        return this.version;
    }
    
    public void TransactionLog.setVersion(Integer version) {
        this.version = version;
    }
    
}
