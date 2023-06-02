package com.toolbox.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.toolbox.entities.Project;

public interface ProjectRepository extends JpaRepository<Project,Integer>{
	
	List<Project> findByUser_Username(String username);

}
