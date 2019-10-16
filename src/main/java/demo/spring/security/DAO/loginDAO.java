package demo.spring.security.DAO;

import demo.spring.security.model.Member;

public interface loginDAO {
	
	public boolean getMember(String email, String password);
	public Member getId(String email);
	

}
