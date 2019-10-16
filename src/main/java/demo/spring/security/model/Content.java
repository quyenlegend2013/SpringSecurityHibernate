package demo.spring.security.model;

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
@Table(name="Content")
public class Content {
	
	@Id
	@Column(name="ContentID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contentID;
	
	@Column(name="Title")
	private String title;
	
	@Column(name="Brief")
	private String brief;

	@Column(name="Contents")
	private String contents;

	@Column(name="CreateDate")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date createDate; 

	@Column(name="UpdateTime")
	private Time updateTime;

	@Column(name="Sort")
	private String sort;

	
	 @JoinColumn(name = "AuthorID", referencedColumnName = "MemberID")
	 @ManyToOne(targetEntity = Member.class)
	 @Basic(optional = false)
	 
	//@Column(name="AuthorID")
	private Member authorID;
	
	
	
	
	public int getContentID() {
		return contentID;
	}
	public void setContentID(int contentID) {
		this.contentID = contentID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public Member getAuthorID() {
		return authorID;
	}
	public void setAuthorID(Member authorID) {
		this.authorID = authorID;
	}
	public Content(int contentID, String title, String brief, String contents, Date createDate, Time updateTime,
				   String sort, Member authorID) {
		super();
		this.contentID = contentID;
		this.title = title;
		this.brief = brief;
		this.contents = contents;
		this.createDate = createDate;
		this.updateTime = updateTime;
		this.sort = sort;
		this.authorID = authorID;
	}
	public Content() {
		super();
	}
	

}
