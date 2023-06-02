package com.toolbox.services;

import java.util.List;

import com.toolbox.entities.Project;

public interface ProjectService {

	public List<Project> getUserProjects(String username);
}
