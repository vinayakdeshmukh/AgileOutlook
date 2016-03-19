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

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T2_FTR", finders = { "findFeaturesByProjectRelease" })
public class Feature extends BaseScheduleEntity {

    /**
     */
    @Column(name = "LEAD_NAME")
    @Size(max = 30)
    private String leadName;

    /**
     */
    @NotNull
    @ManyToOne
    private Application application;

    /**
     */
    @NotNull
    @ManyToOne
    private ProjectRelease projectRelease;

    /**
     */
    @Column(name = "STORY_COUNT_BL")
    private BigDecimal storyCountBaseline;

    /**
     */
    @Column(name = "STORY_POINT_BL")
    private BigDecimal storyPointBaseline;

    /**
     */
    @Column(name = "STORY_COUNT_AL")
    private BigDecimal storyCountActual;

    /**
     */
    @Column(name = "STORY_POINT_AL")
    private BigDecimal storyPointActual;
}
