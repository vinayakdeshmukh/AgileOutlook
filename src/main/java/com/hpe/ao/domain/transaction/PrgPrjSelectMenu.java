package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.AbstractEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T3_PRG_PRJ_SEL_MENU")
public class PrgPrjSelectMenu extends AbstractEntity {

    /**
     */
    @Column(name = "CRT_USER")
    @Size(max = 30)
    private String createUser;

    /**
     */
    @NotNull
    @ManyToOne
    private Program program;

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;
}
