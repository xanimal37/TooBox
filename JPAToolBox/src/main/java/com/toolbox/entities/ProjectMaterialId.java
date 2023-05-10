package com.toolbox.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class ProjectMaterialId implements Serializable{
	
	private static final long serialVersionUID = 593473254242282990L;
	private int projectId;
    private int buildingMaterialId;
    
    public ProjectMaterialId() {}
    
    public ProjectMaterialId(int projectId, int buildingMaterialId) {
        this.projectId = projectId;
        this.buildingMaterialId = buildingMaterialId;
    }

	@Override
	public int hashCode() {
		return Objects.hash(buildingMaterialId, projectId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProjectMaterialId other = (ProjectMaterialId) obj;
		return buildingMaterialId == other.buildingMaterialId && projectId == other.projectId;
	}
    
    

}
