package com.toolbox.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Builder {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="hourly_rate")
	private Double hourlyRate;
	
	//relationships
	@OneToOne
    @JoinColumn(name="specialty_id")
	private Specialty specialty;
	
	@OneToOne
    @JoinColumn(name="user_id")
	private User user;
	
	@ManyToMany
	@JoinTable(name="builder_has_customer",
	    joinColumns=@JoinColumn(name="builder_id"),
	    inverseJoinColumns=@JoinColumn(name="customer_id")
	  )
	private List<Customer> customers;
	
	@OneToMany(mappedBy="builder")
	private List<Project> projects;
	
	//getters setters
	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Specialty getSpecialty() {
		return specialty;
	}

	public void setSpecialty(Specialty specialty) {
		this.specialty = specialty;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	//constructor
	public Builder() {}
	
	//getters setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Double getHourlyRate() {
		return hourlyRate;
	}
	public void setHourlyRate(Double hourlyRate) {
		this.hourlyRate = hourlyRate;
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
		Builder other = (Builder) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Builder [id=" + id + ", hourlyRate=" + hourlyRate + "]";
	}
	
	

}
