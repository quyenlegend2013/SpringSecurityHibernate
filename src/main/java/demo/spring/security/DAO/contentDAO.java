package demo.spring.security.DAO;

import java.util.List;

import demo.spring.security.model.Content;
import demo.spring.security.model.Member;

public interface contentDAO {
	
public List<Content> listEmployee() ;


	public List<Content> getContent();

	public List<Content> getContentByAuthorId(int id);

	public Content getContentById(int id);

	public void addContent(Content ct, Member member);

	public void updateContent(Content ct);

	public void deleteContent(int id);

	public List<Content> searchContent(String s);

	public List<Content> searchContentbyAuthorId(String s,int id);
}
