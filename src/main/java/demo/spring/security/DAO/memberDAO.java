package demo.spring.security.DAO;

import demo.spring.security.model.Member;

import java.util.List;

public interface memberDAO {
    public List<Member> getAllMember();
    public Member getMemberById(int id);
    public void deleteMemberById(int id);
    public List<Member> searchMember(String s);
    public boolean checkEmailExist(String email);
    public void updateMember(Member mb);
}
