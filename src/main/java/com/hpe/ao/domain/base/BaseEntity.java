package com.hpe.ao.domain.base;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(mappedSuperclass = true)
public abstract class BaseEntity extends AbstractEntity {

    /**
     */
    @NotNull
    @Column(name = "NAME")
    @Size(min = 3, max = 30)
    private String name;

    /**
     */
    @Column(name = "DSCRP")
    @Size(max = 250)
    private String description;
}
