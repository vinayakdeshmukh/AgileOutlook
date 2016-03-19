// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hpe.ao.domain.framework;

import com.hpe.ao.domain.framework.Tag;
import com.hpe.ao.domain.framework.TagDataOnDemand;
import com.hpe.ao.service.TagService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TagDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TagDataOnDemand: @Component;
    
    private Random TagDataOnDemand.rnd = new SecureRandom();
    
    private List<Tag> TagDataOnDemand.data;
    
    @Autowired
    TagService TagDataOnDemand.tagService;
    
    public Tag TagDataOnDemand.getNewTransientTag(int index) {
        Tag obj = new Tag();
        setCategory(obj, index);
        setDescription(obj, index);
        setName(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void TagDataOnDemand.setCategory(Tag obj, int index) {
        String category = "category_" + index;
        if (category.length() > 30) {
            category = category.substring(0, 30);
        }
        obj.setCategory(category);
    }
    
    public void TagDataOnDemand.setDescription(Tag obj, int index) {
        String description = "description_" + index;
        if (description.length() > 250) {
            description = description.substring(0, 250);
        }
        obj.setDescription(description);
    }
    
    public void TagDataOnDemand.setName(Tag obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public void TagDataOnDemand.setType(Tag obj, int index) {
        String type = "type_" + index;
        if (type.length() > 30) {
            type = type.substring(0, 30);
        }
        obj.setType(type);
    }
    
    public Tag TagDataOnDemand.getSpecificTag(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Tag obj = data.get(index);
        Long id = obj.getId();
        return tagService.findTag(id);
    }
    
    public Tag TagDataOnDemand.getRandomTag() {
        init();
        Tag obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return tagService.findTag(id);
    }
    
    public boolean TagDataOnDemand.modifyTag(Tag obj) {
        return false;
    }
    
    public void TagDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = tagService.findTagEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Tag' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Tag>();
        for (int i = 0; i < 10; i++) {
            Tag obj = getNewTransientTag(i);
            try {
                tagService.saveTag(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}