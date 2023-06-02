package com.toolbox.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Project {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="schedule_date")
	private LocalDateTime scheduleDate;
	@Column(name="start_date")
	private LocalDateTime startDate;
	@Column(name="finish_date")
	private LocalDateTime finishDate;
	@Column(name="payment_date")
	private LocalDateTime paymentDate;
	@Column(name="estimated_cost")
	private Double estimatedCost;
	@Column(name="final_cost")
	private Double finalCost;
	private Integer hours;
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	@Column(name="update_date")
	@UpdateTimestamp
	private LocalDateTime updateDate;
	
	//relationships
	@ManyToOne
	@JoinColumn(name="user_id")
	@JsonIgnoreProperties({"projects"})
	private User user;
	
	@JsonIgnoreProperties({"project"})
	@OneToMany(mappedBy="project")
	private List<ProjectMaterial> projectMaterials;
	
	public Project() {}
	
	
	
	public List<ProjectMaterial> getProjectMaterials() {
		return projectMaterials;
	}

	public void setProjectMaterials(List<ProjectMaterial> projectMaterials) {
		this.projectMaterials = projectMaterials;
	}

	//getters setters
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(LocalDateTime scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public LocalDateTime getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}
	public LocalDateTime getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(LocalDateTime finishDate) {
		this.finishDate = finishDate;
	}
	public LocalDateTime getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(LocalDateTime paymentDate) {
		this.paymentDate = paymentDate;
	}
	public Double getEstimatedCost() {
		return estimatedCost;
	}
	public void setEstimatedCost(Double estimatedCost) {
		this.estimatedCost = estimatedCost;
	}
	public Double getFinalCost() {
		return finalCost;
	}
	public void setFinalCost(Double finalCost) {
		this.finalCost = finalCost;
	}
	public Integer getHours() {
		return hours;
	}
	public void setHours(Integer hours) {
		this.hours = hours;
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
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Project other = (Project) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + "]";
	}
	
	
}
