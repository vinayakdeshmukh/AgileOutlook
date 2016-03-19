package com.hpe.ao.domain.transaction;
import com.hpe.ao.domain.base.BaseScheduleEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "T2_PRG")
public class Program extends BaseScheduleEntity {

    /**
     */
    @NotNull
    @Column(name = "ORG_NAME")
    @Size(max = 30)
    private String orgName;
}
