package demo.spring.security.DAO;

import java.util.List;

import demo.spring.security.model.Member;


public interface registerDAO {
	
public List<Member> listMember() ;
	
	public Member getMember(int memberID);
	
	public void addMember(Member member);
	
	public void updateMember(Member mb);

}
