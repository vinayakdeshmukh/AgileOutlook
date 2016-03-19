package com.hpe.ao.domain.framework;
import com.hpe.ao.domain.base.BaseEntity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "R1_TAG")
public class Tag extends BaseEntity {

    /**
     */
    @Column(name = "TYPE")
    @Size(max = 30)
    private String type;

    /**
     */
    @Column(name = "CATEGORY")
    @Size(max = 30)
    private String category;
}
