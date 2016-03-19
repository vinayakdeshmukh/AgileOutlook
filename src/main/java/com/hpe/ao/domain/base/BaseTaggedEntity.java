package com.hpe.ao.domain.base;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import com.hpe.ao.domain.framework.Tag;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import com.hpe.ao.reference.Status;
import javax.persistence.Column;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(mappedSuperclass = true)
public abstract class BaseTaggedEntity extends BaseEntity {

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Tag> tag = new HashSet<Tag>();

    /**
     */
    @Column(name = "STATUS")
    @Enumerated
    private Status status;
}
