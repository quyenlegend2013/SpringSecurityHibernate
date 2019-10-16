package demo.spring.security.model;


import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "Member")
public class Member implements Serializable{
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MemberID")
	@Basic(optional = false)
	private int memberID;

	
	@Column(name = "Firstname")
	private String firstname;
	
	@Column(name = "Lastname")
	private String lastname;
	
	@Column(name = "Username")
	private String username;
	
	@Column(name = "Password")
	@Basic(optional = false)
	private String password;
	
	@Column(name = "Phone")
	private String phone;
	
	@Column(name = "Description")
	private String description;
	
	@Column(name = "CreatedDate")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date createDate;
	
	@Column(name = "UpdateTime")
	private Time updateTime;
	
	
	
	@JoinColumn(name = "RoleID", referencedColumnName = "RoleID")
	@ManyToOne(targetEntity = Role.class)
	//@Column(name = "RoleID")
	private Role roleID;
	
	@Column(name = "Email")
	@Basic(optional = false)
	private String email;
	
	
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Time getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Time updateTime) {
		this.updateTime = updateTime;
	}
	
	public Role getRoleID() {
		return roleID;
	}
	public void setRoleID(Role roleID) {
		this.roleID = roleID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Member(int memberID, String firstname, String lastname, String username, String password, String phone,
				  String description, Date createDate, Time updateTime, Role roleID, String email) {
		super();
		this.memberID = memberID;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.description = description;
		this.createDate = createDate;
		this.updateTime = updateTime;
		this.roleID = roleID;
		this.email = email;
	}
	public Member(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public Member() {
		super();
	}


    public String getPasswordrepeat() {
		return "";
    }
}
