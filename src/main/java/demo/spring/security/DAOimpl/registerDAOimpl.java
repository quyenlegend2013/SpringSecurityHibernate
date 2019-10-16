package demo.spring.security.DAOimpl;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import demo.spring.security.model.Content;
import demo.spring.security.model.Member;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import demo.spring.security.DAO.registerDAO;
import demo.spring.security.model.Role;


@Repository
@Transactional
public class registerDAOimpl implements registerDAO{

	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	
	public List<Member> listMember() {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Member> membertList = session.createQuery("from Member").list();
		return membertList;
	}

	public Member getMember(int memberID) {
		// TODO Auto-generated method stub
		return (Member)sessionFactory.getCurrentSession().get(Member.class, memberID);
	}

	public void addMember(Member member) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Member member1=new Member();
		member1.setUsername(member.getUsername());
		String hash = BCrypt.hashpw(member.getPassword(), BCrypt.gensalt(12));
		System.out.println("BCrypt hash: " + hash);
		member1.setPassword(hash);
		//member1.setPassword(member.getPassword());
		member1.setEmail(member.getEmail());
		member1.setRoleID(new Role(2,"User"));
		Date date=new Date();
		member1.setCreateDate(date);
		session.save(member1); //insert

		
	}



	public void updateMember(Member mb) {
		// TODO Auto-generated method stub
		
		Session session=this.sessionFactory.getCurrentSession();
		Member mber=new Member();
		
		Query query= session.createQuery("from Member c where c.memberID = :memberID ");
		query.setParameter("memberID", mb.getMemberID()); // set memberID
		mber = (Member)query.list().get(0);
		mber.setFirstname(mb.getFirstname());
		mber.setLastname(mb.getLastname());
		mber.setEmail(mb.getEmail());
		mber.setPhone(mb.getPhone());
		mber.setDescription(mb.getDescription());
		
		Date date = new Date();
		mber.setCreateDate(date);
		Time sqlTime = new Time(date.getHours(),date.getMinutes(),date.getSeconds()); //get gio tu ngay hien tai
		mber.setUpdateTime(sqlTime);
		session.update(mber);
		
		
		
	}
	

}
