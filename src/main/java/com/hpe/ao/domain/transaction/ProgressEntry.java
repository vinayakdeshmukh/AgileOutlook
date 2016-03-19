package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.BaseEffectiveDatedEntry;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T3_PRGR_ENTRY")
public class ProgressEntry extends BaseEffectiveDatedEntry {

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;

    /**
     */
    @NotNull
    @ManyToOne
    private Feature feature;

    /**
     */
    @NotNull
    @Column(name = "STORY_COUNT_CMPL")
    private BigDecimal storyCountComplete;

    /**
     */
    @NotNull
    @Column(name = "STORY_POINT_CMPL")
    private BigDecimal storyPointComplete;
}
