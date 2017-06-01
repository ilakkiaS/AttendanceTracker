package com.acc.entity;

public class Project {
	Integer projectId;
	String projectName;
	Integer parentProjectId;
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Integer getParentProjectId() {
		return parentProjectId;
	}
	public void setParentProjectId(Integer parentProjectId) {
		this.parentProjectId = parentProjectId;
	}
	
}
