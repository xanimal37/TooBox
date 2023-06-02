package com.toolbox.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Tool {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String brand;
	private String name;
	private String description;
	@Column(name="ref_image_url")
	private String refImageURL;
	
	//relationships
	@ManyToOne
	@JoinColumn(name="inventory_id")
	private Inventory inventory;
	
	@ManyToOne
	@JoinColumn(name="tool_condition_id")
	private ToolCondition toolCondition;
	
	public Tool() {}
	
	public ToolCondition getToolCondition() {
		return toolCondition;
	}

	public void setToolCondition(ToolCondition toolCondition) {
		this.toolCondition = toolCondition;
	}

	public Inventory getInventory() {
		return inventory;
	}
	
	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRefImageURL() {
		return refImageURL;
	}
	public void setRefImageURL(String refImageURL) {
		this.refImageURL = refImageURL;
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
		Tool other = (Tool) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Tool [id=" + id + ", name=" + name + "]";
	}
	
	
	
}
