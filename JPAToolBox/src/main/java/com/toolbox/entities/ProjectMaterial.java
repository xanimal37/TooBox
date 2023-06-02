package com.toolbox.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Table(name="project_material")
@Entity
public class ProjectMaterial {

	@EmbeddedId
	private ProjectMaterialId projectMaterialId;
    
    private Integer count;
    @Column(name="cost_per_unit")
    private Double costPerUnit;
    
    //relationships
    @ManyToOne
    @JoinColumn(name="building_material_id")
    @MapsId(value="buildingMaterialId")
	private BuildingMaterial buildingMaterial;
    
    @JsonIgnoreProperties({"projectMaterials"})
    @ManyToOne
    @JoinColumn(name="project_id")
    @MapsId(value="projectId")
	private Project project;
    
    public ProjectMaterial() {}
    
    //getters and setters
	public BuildingMaterial getBuildingMaterial() {
		return buildingMaterial;
	}

	public void setBuildingMaterial(BuildingMaterial buildingMaterial) {
		this.buildingMaterial = buildingMaterial;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

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
