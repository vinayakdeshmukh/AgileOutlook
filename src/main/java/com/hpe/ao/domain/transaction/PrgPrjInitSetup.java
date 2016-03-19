package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.AbstractEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T3_PRG_PRJ_INIT_SETUP")
public class PrgPrjInitSetup extends AbstractEntity {

    /**
     */
    @NotNull
    @Column(name = "PROGRAM1_NAME")
    @Size(min = 3, max = 30)
    private String program1;

    /**
     */
    @NotNull
    @Column(name = "ORG_NAME")
    @Size(min = 3, max = 30)
    private String orgName;

    /**
     */
    @NotNull
    @Column(name = "START_DT_BL")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date startDateBaseline;

    /**
     */
    @NotNull
    @Column(name = "PROJECT11_NAME")
    @Size(max = 30)
    private String project11;

    /**
     */
    @NotNull
    @Column(name = "PROJECT11_TEAM_COUNT")
    private BigDecimal project11TeamCount;

    /**
     */
    @NotNull
    @Column(name = "PROJECT11_TEAM_SIZE")
    private BigDecimal project11TeamSize;

    /**
     */
    @NotNull
    @Column(name = "PROJECT11_TEAN_APD")
    private BigDecimal project11TeamAveragePointDaily;

    /**
     */
    @NotNull
    @Column(name = "RLS111_NAME")
    @Size(max = 30)
    private String release111;

    /**
     */
    @Column(name = "PROJECT12_NAME")
    @Size(max = 30)
    private String project12;

    /**
     */
    @Column(name = "PROJECT12_TEAM_COUNT")
    private BigDecimal project12TeamCount;

    /**
     */
    @Column(name = "PROJECT12TEAM_SIZE")
    private BigDecimal project12TeamSize;

    /**
     */
    @Column(name = "PROJECT12_TEAN_APD")
    private BigDecimal project12TeamAveragePointDaily;

    /**
     */
    @Column(name = "RLS121_NAME")
    @Size(max = 30)
    private String release121;

    /**
     */
    @Column(name = "PROJECT13_NAME")
    @Size(max = 30)
    private String project13;

    /**
     */
    @Column(name = "PROJECT13_TEAM_COUNT")
    private BigDecimal project13TeamCount;

    /**
     */
    @Column(name = "PROJECT13_TEAM_SIZE")
    private BigDecimal project13TeamSize;

    /**
     */
    @Column(name = "PROJECT13_TEAN_APD")
    private BigDecimal project13TeamAveragePointDaily;

    /**
     */
    @Column(name = "RLS131_NAME")
    @Size(max = 30)
    private String release131;

    /**
     */
    @Column(name = "APPLICATION111_NAME")
    @Size(max = 30)
    private String application111;

    /**
     */
    @Column(name = "APPLICATION112_NAME")
    @Size(max = 30)
    private String application112;

    /**
     */
    @Column(name = "APPLICATION113_NAME")
    @Size(max = 30)
    private String application113;

    /**
     */
    @Column(name = "APPLICATION114_NAME")
    @Size(max = 30)
    private String application114;

    /**
     */
    @Column(name = "APPLICATION121_NAME")
    @Size(max = 30)
    private String application121;

    /**
     */
    @Column(name = "APPLICATION122_NAME")
    @Size(max = 30)
    private String application122;

    /**
     */
    @Column(name = "APPLICATION123_NAME")
    @Size(max = 30)
    private String application123;

    /**
     */
    @Column(name = "APPLICATION124_NAME")
    @Size(max = 30)
    private String application124;

    /**
     */
    @Column(name = "APPLICATION131_NAME")
    @Size(max = 30)
    private String application131;

    /**
     */
    @Column(name = "APPLICATION132_NAME")
    @Size(max = 30)
    private String application132;

    /**
     */
    @Column(name = "APPLICATION133_NAME")
    @Size(max = 30)
    private String application133;

    /**
     */
    @Column(name = "APPLICATION134_NAME")
    @Size(max = 30)
    private String application134;
}
