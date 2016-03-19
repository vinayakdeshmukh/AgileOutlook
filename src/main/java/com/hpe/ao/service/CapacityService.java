package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.roo.addon.layers.service.annotations.RooService;

import com.hpe.ao.domain.transaction.Capacity;

@RooService(domainTypes = { com.hpe.ao.domain.transaction.Capacity.class })
public interface CapacityService {
	BigDecimal[] getCapacity(Date fromDate, Date endDate);

	Date getDateForCapacity(Date fromDate, BigDecimal pointTotal, boolean baseline);

	List<Capacity> getCapacityListByProject(int firstResult, int sizeNo, String sortFieldName, String sortOrder,
			Long projectId);

	List<Capacity> getCapacityListByProject(String sortFieldName, String sortOrder, Long projectId);
}
