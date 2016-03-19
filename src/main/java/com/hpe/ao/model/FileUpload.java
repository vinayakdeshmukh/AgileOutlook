package com.hpe.ao.model;

import java.util.Date;

import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;
import org.springframework.web.multipart.MultipartFile;

import com.hpe.ao.reference.FileUploadType;

@RooJavaBean
public class FileUpload {

	/**
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "M-")
	private Date effectiveDate;

	/**
	 */
	@Size(max = 250)
	private String entryComments;

	/**
	 */
	@NotNull
	@Size(max = 30)
	private String createUser;

	/**
	 */
	@NotNull
	@Enumerated
	private FileUploadType fileUploadType;

	/**
	 */
	@NotNull
	@Size(max = 30)
	private String fileName;

	/**
	 */
	@NotNull
	@RooUploadedFile(contentType = "text/csv")
	@Lob
	private MultipartFile file;
}
