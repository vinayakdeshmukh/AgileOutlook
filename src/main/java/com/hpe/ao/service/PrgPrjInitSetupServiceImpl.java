package com.hpe.ao.service;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.hpe.ao.domain.transaction.Application;
import com.hpe.ao.domain.transaction.PrgPrjInitSetup;
import com.hpe.ao.domain.transaction.Program;
import com.hpe.ao.domain.transaction.Project;
import com.hpe.ao.domain.transaction.ProjectRelease;
import com.hpe.ao.reference.Status;

public class PrgPrjInitSetupServiceImpl implements PrgPrjInitSetupService {

	@Autowired
	ProgramService prgSrv;

	@Autowired
	ProjectService prjSrv;

	@Autowired
	ApplicationService appSrv;

	@Autowired
	ProjectReleaseService rlsSrv;

	public void savePrgPrjInitSetup(PrgPrjInitSetup prgPrjInitSetup) {
		prgPrjInitSetup.persist();
		initSetup(prgPrjInitSetup);
	}

	public void initSetup(PrgPrjInitSetup initSetup) {

		Date startDtBl = initSetup.getStartDateBaseline();

		Program program1 = createProgram(initSetup.getProgram1(), startDtBl, initSetup.getOrgName());

		if (!StringUtils.isEmpty(initSetup.getProject11())) {
			Project project11 = createProject(initSetup.getProject11(), startDtBl, program1,
					initSetup.getProject11TeamCount(), initSetup.getProject11TeamSize(),
					initSetup.getProject11TeamAveragePointDaily());
			createApplication(initSetup.getApplication111(), startDtBl, project11);
			createApplication(initSetup.getApplication112(), startDtBl, project11);
			createApplication(initSetup.getApplication113(), startDtBl, project11);
			createApplication(initSetup.getApplication114(), startDtBl, project11);
			createProjectRelease(initSetup.getRelease111(), startDtBl, null, project11);
		}

		if (!StringUtils.isEmpty(initSetup.getProject12())) {
			Project project12 = createProject(initSetup.getProject12(), startDtBl, program1,
					initSetup.getProject12TeamCount(), initSetup.getProject12TeamSize(),
					initSetup.getProject12TeamAveragePointDaily());
			createApplication(initSetup.getApplication121(), startDtBl, project12);
			createApplication(initSetup.getApplication122(), startDtBl, project12);
			createApplication(initSetup.getApplication123(), startDtBl, project12);
			createApplication(initSetup.getApplication124(), startDtBl, project12);
			createProjectRelease(initSetup.getRelease121(), startDtBl, null, project12);
		}

	}

	private Program createProgram(String name, Date startDtBl, String orgName) {
		if (!StringUtils.isEmpty(name) && !StringUtils.isEmpty(orgName)) {
			Program program = new Program();
			program.setName(name);
			program.setOrgName(orgName);
			program.setStartDateBaseline(startDtBl);
			program.setStartDateActual(startDtBl);
			program.setStatus(Status.Planned);
			prgSrv.saveProgram(program);

			return program;
		}

		return null;
	}

	private Project createProject(String name, Date startDtBl, Program program, BigDecimal averageTeamCount,
			BigDecimal averageTeamSize, BigDecimal teamAveragePointDaily) {
		if (!StringUtils.isEmpty(name) && program != null) {
			Project project = new Project();
			project.setProgram(program);
			project.setName(name);
			project.setStatus(Status.Planned);
			project.setStartDateBaseline(startDtBl);
			project.setStartDateActual(startDtBl);

			project.setAverageTeamCount(averageTeamCount);
			project.setAverageTeamSize(averageTeamSize);
			project.setTeamAveragePointDaily(teamAveragePointDaily);

			prjSrv.saveProject(project);

			return project;
		}

		return null;
	}

	private Application createApplication(String name, Date startDtBl, Project project) {
		if (!StringUtils.isEmpty(name) && project != null) {
			Application application = new Application();
			application.setProject(project);
			application.setName(name);
			application.setStatus(Status.Planned);
			application.setStartDateBaseline(startDtBl);
			application.setStartDateActual(startDtBl);
			appSrv.saveApplication(application);

			return application;
		}

		return null;
	}

	private ProjectRelease createProjectRelease(String name, Date startDtBl, Date endDtBl, Project project) {
		if (!StringUtils.isEmpty(name) && project != null) {
			ProjectRelease release = new ProjectRelease();
			release.setProject(project);
			release.setName(name);

			// - START Date
			release.setStartDateBaseline(startDtBl);
			release.setStartDateActual(startDtBl);

			release.setDurationSITBaseline(new BigDecimal(6));
			release.setDurationUATBaseline(new BigDecimal(6));
			release.setDurationIMPBaseline(new BigDecimal(3));

			release.setDurationSITActual(new BigDecimal(6));
			release.setDurationUATActual(new BigDecimal(6));
			release.setDurationIMPActual(new BigDecimal(3));

			// - END Date
			release.setEndDateBaseline(endDtBl);
			release.setEndDateActual(endDtBl);

			// - GoLIVE Date
			release.setGoLiveDateBaseline(endDtBl);
			release.setGoLiveDateActual(endDtBl);

			rlsSrv.saveProjectRelease(release);

			return release;
		}

		return null;
	}
}
