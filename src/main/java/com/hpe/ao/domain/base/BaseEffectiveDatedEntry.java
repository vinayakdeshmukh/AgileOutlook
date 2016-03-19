package com.hpe.ao.domain.base;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(mappedSuperclass = true)
public abstract class BaseEffectiveDatedEntry extends AbstractEntity {

    /**
     */
    @Column(name = "EFF_DT")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date effectiveDate;

    /**
     */
    @Column(name = "ENTRY_CMNTS")
    @Size(max = 250)
    private String entryComments;
}
