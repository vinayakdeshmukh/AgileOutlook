// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.service;

import com.hpe.ao.domain.framework.TransactionLog;
import com.hpe.ao.service.TransactionLogServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TransactionLogServiceImpl_Roo_Service {
    
    declare @type: TransactionLogServiceImpl: @Service;
    
    declare @type: TransactionLogServiceImpl: @Transactional;
    
    public long TransactionLogServiceImpl.countAllTransactionLogs() {
        return TransactionLog.countTransactionLogs();
    }
    
    public void TransactionLogServiceImpl.deleteTransactionLog(TransactionLog transactionLog) {
        transactionLog.remove();
    }
    
    public TransactionLog TransactionLogServiceImpl.findTransactionLog(Long id) {
        return TransactionLog.findTransactionLog(id);
    }
    
    public List<TransactionLog> TransactionLogServiceImpl.findAllTransactionLogs() {
        return TransactionLog.findAllTransactionLogs();
    }
    
    public List<TransactionLog> TransactionLogServiceImpl.findTransactionLogEntries(int firstResult, int maxResults) {
        return TransactionLog.findTransactionLogEntries(firstResult, maxResults);
    }
    
    public void TransactionLogServiceImpl.saveTransactionLog(TransactionLog transactionLog) {
        transactionLog.persist();
    }
    
    public TransactionLog TransactionLogServiceImpl.updateTransactionLog(TransactionLog transactionLog) {
        return transactionLog.merge();
    }
    
}