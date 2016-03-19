package com.hpe.ao.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.hpe.ao.domain.base.AbstractEntity;
import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.domain.transaction.Feature;
import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.reference.Status;

public class FeatureServiceImpl implements FeatureService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	ApplicationService appSrv;

	@Autowired
	ProjectReleaseService prjRelSrv;

	@Autowired
	ProjectService projectSrv;

	@Autowired
	ProjectReleaseService prjReleaseSrv;

	static final String JPQL = "SELECT feature.application.id, "
			+ " SUM(feature.storyCountBaseline),  SUM(feature.storyPointBaseline), "
			+ " SUM(feature.storyCountActual),  SUM(feature.storyPointActual) " + " FROM Feature feature "
			+ " WHERE feature.application in (SELECT DISTINCT application from Application application "
			+ "	WHERE application.project.id = :projectId ) " + " GROUP BY feature.application.id";

	static final String JPQL_BASELINE_POINT_TOTAL_BY_REL = "SELECT SUM(feature.storyPointBaseline) "
			+ " FROM Feature feature WHERE feature.projectRelease = :projectRelease";

	static final String JPQL_ACTUAL_POINT_TOTAL_BY_REL = "SELECT SUM(feature.storyPointActual) "
			+ " FROM Feature feature WHERE feature.projectRelease = :projectRelease";

	@Override
	public List<Feature> getFeatureListByProjectRelease(int firstResult, int maxResults, String sortFieldName,
			String sortOrder, Long releaseId) {
		ProjectRelease projectRelease = prjReleaseSrv.findProjectRelease(releaseId);
		TypedQuery<Feature> q = Feature.findFeaturesByProjectRelease(projectRelease, sortFieldName, sortOrder);
		return q.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	@Override
	public List<Feature> getFeatureListByProjectRelease(String sortFieldName, String sortOrder, Long releaseId) {
		ProjectRelease projectRelease = prjReleaseSrv.findProjectRelease(releaseId);
		TypedQuery<Feature> q = Feature.findFeaturesByProjectRelease(projectRelease, sortFieldName, sortOrder);
		return q.getResultList();
	}

	@Override
	public List<Object[]> getFeatureSummaryByApplication(Long projectId) {
		Query query = entityManager.createQuery(JPQL);
		query.setParameter("projectId", projectId);
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.getResultList();

		return list;
	}

	@Override
	public BigDecimal getBaselinePointTotalByRelease(ProjectRelease projectRelease) {
		Query query = entityManager.createQuery(JPQL_BASELINE_POINT_TOTAL_BY_REL);
		query.setParameter("projectRelease", projectRelease);
		BigDecimal pointTotal = (BigDecimal) query.getSingleResult();

		return pointTotal;
	}

	@Override
	public BigDecimal getActualPointTotalByRelease(ProjectRelease projectRelease) {
		Query query = entityManager.createQuery(JPQL_ACTUAL_POINT_TOTAL_BY_REL);
		query.setParameter("projectRelease", projectRelease);
		BigDecimal pointTotal = (BigDecimal) query.getSingleResult();

		return pointTotal;
	}

	@Override
	public void bulkUpload(MultipartFile file, Class<? extends AbstractEntity> cls) {
		try {
			String line = "";
			String cvsSplitBy = ",";
			ArrayList<String> colList = new ArrayList<String>();

			InputStream is = file.getInputStream();
			Reader reader = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(reader);
			line = br.readLine();
			String[] headers = line.split(cvsSplitBy);

			colList.addAll(Arrays.asList(headers));
			while ((line = br.readLine()) != null) {
				String[] data = line.split(cvsSplitBy);
				if (cls == Feature.class) {
					createFeature(colList, data);
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private String getStringValue(ArrayList<String> colList, String[] data, String colName) {
		String strData = null;
		int colIndex = colList.indexOf(colName);
		if (colIndex > -1 && colIndex < data.length) {
			strData = data[colIndex];
		}

		return strData;
	}

	private BigDecimal getBigDecimalValue(ArrayList<String> colList, String[] data, String colName) {
		String strData = getStringValue(colList, data, colName);
		return (StringUtils.isEmpty(strData)) ? null : new BigDecimal(strData);

	}

	private Date getDateValue(ArrayList<String> colList, String[] data, String colName) throws ParseException {
		String strData = getStringValue(colList, data, colName);
		return (StringUtils.isEmpty(strData)) ? null : new SimpleDateFormat("yyyy-MM-dd").parse(strData);

	}

	private void createFeature(ArrayList<String> colList, String[] data) throws Exception {
		Feature feature = new Feature();

		Long appId = new Long(data[colList.indexOf("application")]);
		Application app = appSrv.findApplication(appId);
		feature.setApplication(app);

		Long relId = new Long(data[colList.indexOf("projectRelease")]);
		ProjectRelease prjRel = prjRelSrv.findProjectRelease(relId);
		feature.setProjectRelease(prjRel);

		feature.setStatus(Status.valueOf(data[colList.indexOf("status")]));

		// String --
		feature.setDescription(getStringValue(colList, data, "description"));
		feature.setLeadName(getStringValue(colList, data, "leadName"));
		feature.setName(getStringValue(colList, data, "name"));

		// Date --
		feature.setEndDateActual(getDateValue(colList, data, "endDateActual"));
		feature.setEndDateBaseline(getDateValue(colList, data, "endDateBaseline"));
		feature.setStartDateActual(getDateValue(colList, data, "startDateActual"));
		feature.setStartDateBaseline(getDateValue(colList, data, "startDateBaseline"));

		// BigDecimal --
		feature.setStoryCountActual(getBigDecimalValue(colList, data, "storyCountActual"));
		feature.setStoryCountBaseline(getBigDecimalValue(colList, data, "storyCountBaseline"));
		feature.setStoryPointActual(getBigDecimalValue(colList, data, "storyPointActual"));
		feature.setStoryPointBaseline(getBigDecimalValue(colList, data, "storyPointBaseline"));
		feature.persist();
	}

}
