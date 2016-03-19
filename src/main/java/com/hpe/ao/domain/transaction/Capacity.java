package com.hpe.ao.domain.transaction;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import com.hpe.ao.domain.base.BaseEffectiveDatedEntry;

@EntityListeners({ com.hpe.ao.domain.transaction.CapacityEntityListener.class })
@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T2_CPCT", finders = { "findCapacitysByEffectiveDateEquals", "findCapacitysByProject" })
public class Capacity extends BaseEffectiveDatedEntry {

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;

    /**
     */
    @NotNull
    @Column(name = "TEAM_COUNT_BL")
    private BigDecimal teamCountBaseline;

    /**
     */
    @NotNull
    @Column(name = "TEAM_SIZE_BL")
    private BigDecimal teamSizeBaseline;

    /**
     */
    @NotNull
    @Column(name = "TEAM_AVLB_BL")
    private BigDecimal teamAvailabilityBaseline;

    /**
     */
    @NotNull
    @Column(name = "TEAM_APD_BL")
    private BigDecimal teamAveragePointDailyBaseline;

    /**
     */
    @Column(name = "POINT_CPCT_BL")
    private BigDecimal pointCapacityBaseline;

    /**
     */
    @Column(name = "TEAM_COUNT_AL")
    private BigDecimal teamCountActual;

    /**
     */
    @Column(name = "TEAM_SIZE_AL")
    private BigDecimal teamSizeActual;

    /**
     */
    @Column(name = "TEAM_AVLB_AL")
    private BigDecimal teamAvailabilityActual;

    /**
     */
    @Column(name = "TEAM_APD_AL")
    private BigDecimal teamAveragePointDailyActual;

    /**
     */
    @Column(name = "POINT_CPCT_AL")
    private BigDecimal pointCapacityActual;

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
}
