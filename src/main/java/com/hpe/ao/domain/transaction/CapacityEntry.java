package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.AbstractEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.hpe.ao.reference.CapacityEntryType;
import javax.persistence.Enumerated;
import java.math.BigDecimal;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T3_CPCT_ENTRY")
public class CapacityEntry extends AbstractEntity {

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;

    /**
     */
    @NotNull
    @Column(name = "START_DT")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date startDate;

    /**
     */
    @Column(name = "END_DT")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date endDate;

    /**
     */
    @NotNull
    @Enumerated
    private CapacityEntryType capacityEntryType;

    /**
     */
    @NotNull
    @Column(name = "TEAM_COUNT")
    private BigDecimal teamCount;

    /**
     */
    @NotNull
    @Column(name = "TEAM_SIZE")
    private BigDecimal teamSize;

    /**
     */
    @NotNull
    @Column(name = "TEAM_AVLB")
    private BigDecimal teamAvailability;

    /**
     */
    @NotNull
    @Column(name = "TEAN_APD")
    private BigDecimal teamAveragePointDaily;

    /**
     */
    @Column(name = "POINT_CPCT")
    private BigDecimal pointCapacity;

    /**
     * acceleration or deceleration factor
     */
    @Column(name = "FACTOR_1")
    private BigDecimal factor1;

    /**
     */
    @Column(name = "FACTOR_1_DSCR")
    private String factor1Description;

    /**
     * acceleration or deceleration factor
     */
    @Column(name = "FACTOR_2")
    private BigDecimal factor2;

    /**
     */
    @Column(name = "FACTOR_2_DSCR")
    private String factor2Description;

    /**
     * acceleration or deceleration factor
     */
    @Column(name = "FACTOR_3")
    private BigDecimal factor3;

    /**
     */
    @Column(name = "FACTOR_3_DSCR")
    private String factor3Description;

    /**
     */
    @Column(name = "ENTRY_CMNTS")
    @Size(max = 250)
    private String entryComments;
}
