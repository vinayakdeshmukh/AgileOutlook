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
@RooJpaActiveRecord(table = "T2_PRJ")
public class Project extends BaseScheduleEntity {

    /**
     */
    @Column(name = "LEAD_NAME")
    @Size(max = 30)
    private String leadName;

    /**
     */
    @NotNull
    @ManyToOne
    private Program program;

    /**
     */
    @Column(name = "TEAM_APD")
    private BigDecimal teamAveragePointDaily;

    /**
     */
    @Column(name = "AVRG_POINT_PS")
    private BigDecimal averagePointsPerStory;

    /**
     */
    @Column(name = "AVRG_TEAM_COUNT")
    private BigDecimal averageTeamCount;

    /**
     */
    @Column(name = "AVRG_TEAM_SIZE")
    private BigDecimal averageTeamSize;
}
