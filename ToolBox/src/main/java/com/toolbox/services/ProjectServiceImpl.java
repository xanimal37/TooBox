package com.toolbox.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toolbox.entities.Project;
import com.toolbox.repositories.ProjectRepository;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectRepository projectRepo;
	
	@Override
	public List<Project> getUserProjects(String username) {
		return projectRepo.findByUser_Username(username);
	}

}
