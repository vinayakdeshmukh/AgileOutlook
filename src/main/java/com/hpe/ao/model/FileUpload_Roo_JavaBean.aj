// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.model;

import com.hpe.ao.model.FileUpload;
import com.hpe.ao.reference.FileUploadType;
import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

privileged aspect FileUpload_Roo_JavaBean {
    
    public Date FileUpload.getEffectiveDate() {
        return this.effectiveDate;
    }
    
    public void FileUpload.setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    
    public String FileUpload.getEntryComments() {
        return this.entryComments;
    }
    
    public void FileUpload.setEntryComments(String entryComments) {
        this.entryComments = entryComments;
    }
    
    public String FileUpload.getCreateUser() {
        return this.createUser;
    }
    
    public void FileUpload.setCreateUser(String createUser) {
        this.createUser = createUser;
    }
    
    public FileUploadType FileUpload.getFileUploadType() {
        return this.fileUploadType;
    }
    
    public void FileUpload.setFileUploadType(FileUploadType fileUploadType) {
        this.fileUploadType = fileUploadType;
    }
    
    public String FileUpload.getFileName() {
        return this.fileName;
    }
    
    public void FileUpload.setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    public MultipartFile FileUpload.getFile() {
        return this.file;
    }
    
    public void FileUpload.setFile(MultipartFile file) {
        this.file = file;
    }
    
}
