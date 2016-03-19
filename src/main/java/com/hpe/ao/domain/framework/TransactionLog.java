package com.hpe.ao.domain.framework;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.hpe.ao.reference.LogType;
import javax.persistence.Enumerated;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T1_TRNS_LOG")
public class TransactionLog {

    /**
     */
    @NotNull
    @Column(name = "ENTITY_NAME")
    @Size(min = 3, max = 30)
    private String entityName;

    /**
     */
    @NotNull
    @Column(name = "ENTITY_KEY1")
    private Long entiyKey1;

    /**
     */
    @Column(name = "ENTITY_KEY2")
    private Long entityKey2;

    /**
     */
    @NotNull
    @Column(name = "LOG_TYPE")
    @Enumerated
    private LogType logType;

    /**
     */
    @NotNull
    @Column(name = "LOG_USER")
    @Size(max = 30)
    private String logUser;

    /**
     */
    @NotNull
    @Column(name = "CRT_TS")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date logTimestamp;

    /**
     */
    @Column(name = "LOG_DATA")
    @Size(max = 1000)
    private String logData;
}
