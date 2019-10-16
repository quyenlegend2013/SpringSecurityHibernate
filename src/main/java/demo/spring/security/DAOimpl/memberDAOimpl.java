package demo.spring.security.DAOimpl;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import demo.spring.security.DAO.memberDAO;
import demo.spring.security.model.Content;
import demo.spring.security.model.Member;

@Repository
@Transactional
public class memberDAOimpl implements memberDAO {

    @Autowired
    private SessionFactory sessionFactory;


    public List<Member> getAllMember() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Member");
        List<Member> ListMember=query.list();
        return ListMember;
    }

    public Member getMemberById(int id) {
        return (Member) sessionFactory.getCurrentSession().get(Member.class, id);
    }

    public void deleteMemberById(int id) {

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery(" FROM Content c where authorid= :authorid");
        query.setParameter("authorid",String.valueOf(id));
        List<Content> contentList=query.list();
        for (Content content:contentList) {
            session.delete(content);
        }

        Session session1 = this.sessionFactory.getCurrentSession();
        Member member = (Member) sessionFactory.getCurrentSession().load(Member.class, id);
        session1.delete(member);
    }

    public List<Member> searchMember(String s) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery(" FROM Member c where c.email like :s");
        query.setParameter("s","%"+s+"%");
        List<Member> ListMember=query.list();
        return ListMember;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean checkEmailExist(String email){
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Member where email= :email");
        query.setParameter("email",email);
        List<Member> listMember=query.list();
        if(listMember.size()>0){
            return true;
        }
        else return false;
    }

	public void updateMember(Member mb) {
		// TODO Auto-generated method stub
		
		Session session=this.sessionFactory.getCurrentSession();
		Member mber=new Member();
		
		Query query= session.createQuery("from Member c where c.memberID = :memberID ");
		query.setParameter("memberID", mb.getMemberID()); // set contentID
		mber = (Member)query.list().get(0);
		mber.setFirstname(mb.getFirstname());
		mber.setLastname(mb.getLastname());
		//mber.setEmail(mb.getEmail());
		mber.setPhone(mb.getPhone());
		mber.setDescription(mb.getDescription());
		
		Date date = new Date();
		mber.setCreateDate(date);
		Time sqlTime = new Time(date.getHours(),date.getMinutes(),date.getSeconds()); //get gio tu ngay hien tai
		mber.setUpdateTime(sqlTime);
		session.update(mber);
		
		
	}
}
