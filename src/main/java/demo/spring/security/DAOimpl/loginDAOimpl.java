package demo.spring.security.DAOimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import demo.spring.security.DAO.loginDAO;
import demo.spring.security.model.Member;


@Repository
@Transactional
public class loginDAOimpl implements loginDAO {

	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean getMember(String email, String password) {
		// TODO Auto-generated method stub
		Member mber=new Member();
		//boolean userFound = false;
		Session session = this.sessionFactory.getCurrentSession();
		org.hibernate.query.Query query = session.createQuery("FROM Member o where o.email=:email");
		query.setParameter("email",email);
		List<Member> memberList=query.list();
		if(memberList.size()>0)
		{
			String hash=memberList.get(memberList.size()-1).getPassword();
			if(BCrypt.checkpw(password, hash) ){
				return true;
			}
		}
		return false;

	/*	Query query=session.createQuery("from Member o where o.email=:email and o.password=:pass");
		query.setParameter("email",email);
		boolean valuate = BCrypt.checkpw(password, "$2a$12$OFOICietLS3.qRtzIe6jE.vF.fmtL22DqIZ18WNMmQ.8nS7Frq5aO");
		System.out.println(valuate);

		query.setParameter("pass",password);
		List list =query.list();
		if ((list != null) && (list.size() > 0)) {
			userFound= true;
		}
		return userFound;   */
	}

	public Member getId(String email) {
		// TODO Auto-generated method stub

		 Member mber=new Member();
	        Session session = this.sessionFactory.getCurrentSession();
	        Query query= (Query) session.createQuery("from Member o where o.email=:email");
	        query.setParameter("email",email);
	        List<Member> list =query.list();
	        if ((list != null) && (list.size() > 0)) {
	            return (Member) list.get(list.size()-1);
	            
	        }
	        return null;
	}





}
