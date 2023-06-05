package com.toolbox.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Workday {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="start_time")
	private LocalDateTime startTime;
	@Column(name="finish_time")
	private LocalDateTime finishTime;
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	@Column(name="update_date")
	@UpdateTimestamp
	private LocalDateTime updateDate;
	private String note;
	//relationship
	@ManyToOne
	@JoinColumn(name="project_id")
	private Project project;
	
	//constructor
	
	//getters and setters
	public Project getProject() {
		return project;
	}
	
	void setProject(Project project) {
		this.project = project;
	}
	
	public String getNote() {
		return note;
	}
	
	public void setNote(String note) {
		this.note = note;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalDateTime startTime) {
		this.startTime = startTime;
	}
	public LocalDateTime getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(LocalDateTime finishTime) {
		this.finishTime = finishTime;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public LocalDateTime getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}
	
	

}
