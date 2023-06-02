package com.toolbox.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toolbox.entities.Project;
import com.toolbox.services.ProjectService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost"})
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	//get projects
	@GetMapping(path="/project")
	public List<Project> getProjects(HttpServletRequest req, HttpServletResponse res, Principal principal){
		return projectService.getUserProjects(principal.getName());
	}

}
