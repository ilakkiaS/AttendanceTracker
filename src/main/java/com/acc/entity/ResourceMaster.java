package com.acc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class ResourceMaster {
	@Id
	@Column(name = "employee_id")
	Long employeeId;
	@Column(name = "enterprise_id")
	String enterpriseId;
	@Column(name = "employee_name")
	String employeeName;
	@Column(name = "password")
	String password;
	@Column(name = "designation")
	String designation;
	@Column(name = "career_level")
	Integer careerLevel;
	@Column(name = "supervisor_id")
	Long supervisorId;
	@Column(name = "technology")
	String technology;
	@Column(name = "default_shift")
	String defaultShift;
	public String getEnterpriseId() {
		return enterpriseId;
	}
	public void setEnterpriseId(String enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public int getCareerLevel() {
		return careerLevel;
	}
	public void setCareerLevel(int careerLevel) {
		this.careerLevel = careerLevel;
	}
	public long getSupervisorId() {
		return supervisorId;
	}
	public void setSupervisorId(long supervisorId) {
		this.supervisorId = supervisorId;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public String getDefaultShift() {
		return defaultShift;
	}
	public void setDefaultShift(String defaultShift) {
		this.defaultShift = defaultShift;
	}

}
