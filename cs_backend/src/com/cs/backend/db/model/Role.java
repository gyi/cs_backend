package com.cs.backend.db.model;

public class Role {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column cs_role.id
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	private Integer id=null;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column cs_role.roleName
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	private String roleName=null;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column cs_role.isDeleted
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	private Integer isDeleted=null;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column cs_role.describle
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	private String describle=null;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column cs_role.createTime
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	private Long createTime=null;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column cs_role.id
	 * @return  the value of cs_role.id
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column cs_role.id
	 * @param id  the value for cs_role.id
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column cs_role.roleName
	 * @return  the value of cs_role.roleName
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column cs_role.roleName
	 * @param roleName  the value for cs_role.roleName
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column cs_role.isDeleted
	 * @return  the value of cs_role.isDeleted
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public Integer getIsDeleted() {
		return isDeleted;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column cs_role.isDeleted
	 * @param isDeleted  the value for cs_role.isDeleted
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column cs_role.describle
	 * @return  the value of cs_role.describle
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public String getDescrible() {
		return describle;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column cs_role.describle
	 * @param describle  the value for cs_role.describle
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public void setDescrible(String describle) {
		this.describle = describle;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column cs_role.createTime
	 * @return  the value of cs_role.createTime
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public Long getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column cs_role.createTime
	 * @param createTime  the value for cs_role.createTime
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
}