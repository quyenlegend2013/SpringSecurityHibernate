package demo.spring.security.DAOimpl;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import demo.spring.security.model.Content;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import demo.spring.security.DAO.contentDAO;
import demo.spring.security.DAO.loginDAO;
import demo.spring.security.model.Member;


@Repository
@Transactional
public class ContentDAOimpl implements contentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public List<Content> getContent() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Content");
		List<Content> contentList=query.list();
		return contentList;
	}

	public List<Content> getContentByAuthorId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Content where authorid= :authorid");
		query.setParameter("authorid",id);
		List<Content> contentList=query.list();
		return contentList;
	}

	public Content getContentById(int id) {
		return (Content)sessionFactory.getCurrentSession().get(Content.class, id);
	}

	public List<Content> listEmployee() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Content> contentList = session.createQuery("from Content").list();
		return contentList;
	}


//	public Member getMemberByID(int memberID) {
//		return (Member)sessionFactory.getCurrentSession().get(Member.class, memberID);
//	}
	
	public void addContent(Content ct, Member author) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		
		Content ctt=new Content();
		Member mber=new Member();
		//Query query= session.createQuery("from Content c, where c.authorID = :authorID"); //HQL
		//query.setParameter("authorID", user.getId()); // set contentID
		//ctt = (Content)query.list().get(0); //get data
		ctt.setTitle(ct.getTitle());
		ctt.setContents(ct.getContents());
		ctt.setBrief(ct.getBrief());
		
		//int id=Integer.parseInt(user.getId().toString());
		//ctt.setAuthorID(2);
		ctt.setAuthorID(author);
		
		Date date=new Date();
		ctt.setCreateDate(date);
		Time time=new Time(date.getHours(),date.getMinutes(),date.getSeconds());
		ctt.setUpdateTime(time);
		session.save(ctt);
		
	}
	/**
	 * @param content
	 * 
	 * Su dung HQL lay du lieu cu cua doi tuong sau do cap nhat lai cac thong tin moi
	 * 
	 */
	public void updateContent(Content ct) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Content ctt = new Content();
		Query query= session.createQuery("from Content c where c.contentID = :contentID "); //HQL
		query.setParameter("contentID", ct.getContentID()); // set contentID
		ctt = (Content)query.list().get(0); //get data
		ctt.setBrief(ct.getBrief());
		ctt.setContents(ct.getContents());
		ctt.setTitle(ct.getTitle());
		
		//get ngay gio hien tai
		Date date = new Date();
		ctt.setCreateDate(date);
		Time sqlTime = new Time(date.getHours(),date.getMinutes(),date.getSeconds()); //get gio tu ngay hien tai
		ctt.setUpdateTime(sqlTime);
		session.update(ctt);
		
	}

	public void deleteContent(int id) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Content uv=(Content)sessionFactory.getCurrentSession().load(Content.class, id);
		session.delete(uv);
	}

	public List<Content> searchContent(String s){
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM Content c where c.title like :s");
		query.setParameter("s","%"+s+"%");
		//query.setParameter("s","%g%");
		List<Content> contentList=query.list();
		return contentList;
	}

	public List<Content> searchContentbyAuthorId(String s, int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM Content c where authorid= :authorid and c.title like :s");
		query.setParameter("s","%"+s+"%");
		query.setParameter("authorid",String.valueOf(id));
		//query.setParameter("s","%g%");
		List<Content> contentList=query.list();
		return contentList;
	}


}
