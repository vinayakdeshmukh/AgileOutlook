package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.BaseScheduleEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T2_PRJ_RLS", finders = { "findProjectReleasesByProject" })
public class ProjectRelease extends BaseScheduleEntity {

    /**
     */
    @Column(name = "LEAD_NAME")
    @Size(max = 30)
    private String leadName;

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;

    /**
     */
    @Column(name = "DURATION_SIT_BL")
    private BigDecimal durationSITBaseline;

    /**
     */
    @Column(name = "DURATION_UAT_BL")
    private BigDecimal durationUATBaseline;

    /**
     */
    @Column(name = "DURATION_IMP_BL")
    private BigDecimal durationIMPBaseline;

    /**
     */
    @Column(name = "GO_LIVE_DT_BL")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date goLiveDateBaseline;

    /**
     */
    @Column(name = "DURATION_SIT_AL")
    private BigDecimal durationSITActual;

    /**
     */
    @Column(name = "DURATION_UAT_AL")
    private BigDecimal durationUATActual;

    /**
     */
    @Column(name = "DURATION_IMP_AL")
    private BigDecimal durationIMPActual;

    /**
     */
    @Column(name = "GO_LIVE_DT_AL")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date goLiveDateActual;

    /**
     */
    private transient BigDecimal availableCapacity;
}
