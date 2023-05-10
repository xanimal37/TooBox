package com.toolbox.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class ProjectMaterial {

	@EmbeddedId
	private ProjectMaterialId projectMaterialId;
    
    private Integer count;
    @Column(name="cost_per_unit")
    private Double costPerUnit;
    
    public ProjectMaterial() {}
    
	public ProjectMaterialId getProjectMaterialId() {
		return projectMaterialId;
	}
	
	public void setProjectMaterialId(ProjectMaterialId projectMaterialId) {
		this.projectMaterialId = projectMaterialId;
	}
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getCostPerUnit() {
		return costPerUnit;
	}
	public void setCostPerUnit(Double costPerUnit) {
		this.costPerUnit = costPerUnit;
	}

	@Override
	public int hashCode() {
		return Objects.hash(projectMaterialId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProjectMaterial other = (ProjectMaterial) obj;
		return Objects.equals(projectMaterialId, other.projectMaterialId);
	}

	@Override
	public String toString() {
		return "ProjectMaterial [projectMaterialId=" + projectMaterialId + ", count=" + count + ", costPerUnit="
				+ costPerUnit + "]";
	}
	
	
    
    
}
