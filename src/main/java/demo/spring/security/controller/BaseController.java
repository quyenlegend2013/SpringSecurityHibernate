package demo.spring.security.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import demo.spring.security.model.Content;
import demo.spring.security.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class BaseController {

	@Autowired
	private demo.spring.security.DAO.contentDAO contentDAO;

	@Autowired
	private  demo.spring.security.DAO.memberDAO memberDAO;

	@Autowired
	private demo.spring.security.DAO.loginDAO loginDAO;

	@Autowired
	private demo.spring.security.DAO.registerDAO registerDAO;

	private String email;
	private int m=0;
	
	@RequestMapping(value = "/loadcontent")
	@ResponseBody
	public String loadContent(){

		List<Content> list = contentDAO.getContent();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/loadcontentbyauthorid/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String loadContentByAuthorId(@PathVariable String id){

		List<Content> list = contentDAO.getContentByAuthorId(Integer.valueOf(id));
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/loadmember")
	@ResponseBody
	public String loadMember(){

		List<Member> list = memberDAO.getAllMember();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/searchcontent/{s}",method = RequestMethod.GET)
	@ResponseBody
	public String searchContent(@PathVariable String s){
		List<Content> list = contentDAO.searchContent(s);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	@RequestMapping(value = "/searchcontentbyauthorid/{s}/{i}",method = RequestMethod.GET)
	@ResponseBody
	public String searchContentByAuthorId(@PathVariable String s,@PathVariable String i){
		List<Content> list = contentDAO.searchContentbyAuthorId(s,Integer.valueOf(i));
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/searchmember/{s}",method = RequestMethod.GET)
	@ResponseBody
	public String searchUser(@PathVariable String s){
		List<Member> list = memberDAO.searchMember(s);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}



	//cái này chỉ để test cái ajax thôi
	@RequestMapping(value = "/viewajax")
	public String showView(){
		return "viewajax";
	}



	@RequestMapping(value = "/deletecontent/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String deleteContent(@PathVariable String id){
		contentDAO.deleteContent(Integer.valueOf(id));
		List<String> list=new ArrayList<String>();
		list.add("success:true");
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/deletemember/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String deleteMember(@PathVariable String id){
		memberDAO.deleteMemberById(Integer.valueOf(id));
		List<String> list=new ArrayList<String>();
		list.add("success:true");
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/checkemail",method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam String email){
		List<String> list=new ArrayList<String>();
		if(memberDAO.checkEmailExist(email))
			list.add("success:true");
		else
			list.add("success:false");
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}



	@RequestMapping(value = { "/login", "/" })
	public String login(Model model) {

		
		if(m != 0)
		{
			return "redirect:list";
		}
		else
		{
			model.addAttribute("data",new Member());
			return "login";
		}
	}
    
	@RequestMapping(value = "/passLogin",method = RequestMethod.POST)
	public String passlogin(Model model, @ModelAttribute("data") Member mber, HttpSession session)
	{


		email = mber.getEmail();
		boolean userExists = loginDAO.getMember(mber.getEmail(), mber.getPassword());
		
		if(userExists){
			//m =loginDAO.getId(mber.getEmail()).getMemberID();
			m=loginDAO.getId(mber.getEmail()).getRoleID().getRoleID();
			model.addAttribute("data", mber);
			//System.out.println(loginDAO.getId(mber.getEmail()));
			session.setAttribute("userid",loginDAO.getId(mber.getEmail()).getMemberID());
			session.setAttribute("roleID", loginDAO.getId(mber.getEmail()).getRoleID().getRoleID());
			
			if(loginDAO.getId(mber.getEmail()).getRoleID().getRoleID()  == 1)
				
				return "adminviewcontent";
			else
				return "redirect:list";
		}
		else{
			model.addAttribute("error", true);
			return "redirect:login";
		}

	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/user")
	public String user() {
		return "user";
	}
	
	
	@RequestMapping(value = "/editProfile")
	public String showProfile(Model model,HttpServletRequest request,HttpSession session)
	{
		if(m==0)
		{
			return "redirect:login";
		}
		else
		{
			int id=Integer.parseInt(request.getParameter("id"));
			//int id=Integer.valueOf(session.getAttribute("userid").toString());
			Member mb=memberDAO.getMemberById(id);
			model.addAttribute("dataProfile", mb);
			return "editProfile";
		}
		
		
	}
	
	@RequestMapping(value="/passProfile", method=RequestMethod.POST)
	public String passProfile(@ModelAttribute("dataProfile") Member mb, BindingResult result){
		//System.out.println(update profile");
		memberDAO.updateMember(mb);
		return "redirect:/list";
	}
	

	
	@RequestMapping("/dangky")
	public String register(Model model) {
		
		if(m!=0)
		{
			return "redirect:list";
		}
		else
		{
			model.addAttribute("memberdata", new Member());
			return "dangky";
		}
		
		
		
	}


	
	@RequestMapping(value ="/saveUser", method=RequestMethod.POST)
	public String passregister(Model model,@ModelAttribute("memberdata") Member mb) {
		
		registerDAO.addMember(mb);
		model.addAttribute("success",true);
		return "redirect:login";
		
	}
	
	

	@RequestMapping("/logout")
	public String logout(final Model model,HttpSession session) {

		model.addAttribute("logout",true);
		session.removeAttribute("userid");
		m=0;
		return "redirect:login";
	}
	
	
	@RequestMapping(value = "/list")
	public String showview(Model model)
	{
		/*
		 * List<Content> list = contentDAO.listEmployee(); for (Content emp : list) {
		 * System.out.println("Emp No " + emp.getContentID()); }
		 * model.addAttribute("contents", list);
		 */
		if(m==0)
		{
			return "redirect:login";
		}
		else
		{
			return "list";
		}
		
		 
		
	}
	@RequestMapping(value = "/update")
	public String update(Model model,HttpServletRequest request)
	{
		if(m == 0)
		{
			return "redirect:login";
		}
		else
		{
			int id=Integer.parseInt(request.getParameter("id"));
			Content ct=contentDAO.getContentById(id);
			model.addAttribute("contentdata", ct);
			
			return "update";
		}
		
		
	}
	@RequestMapping(value="/updatecontent", method=RequestMethod.POST)
	public String updateEmployee(@ModelAttribute("contentdata") Content ct, BindingResult result){
		System.out.println("add Content");
		contentDAO.updateContent(ct);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/delete")
    public String deleteEmployee(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		contentDAO.deleteContent(id);
        return "redirect:/list";
    }
	
	@RequestMapping(value = "/create",method = RequestMethod.GET)
	public String addContent(Model model)
	{
		if(m==0)
		{
			return "redirect:login";
		}
		else
		{
			model.addAttribute("contentdata", new Content());
			return "create";
		}
		
		
	}
	
	@RequestMapping(value = "/addcontent",method =  RequestMethod.POST)
	public String andDataContent(Model model,@ModelAttribute("contentdata") Content ct)
	{
		Member author = loginDAO.getId(email);
		contentDAO.addContent(ct,author);
		model.addAttribute("success", true);
		return"redirect:create";
	}

	//Admin region
	@RequestMapping(value = "/adminviewcontent")
	public String viewAdminContent(){
		if(m==0 || m==2)
		{
			return "error";
		}
		else
		{
			return "adminviewcontent";
		}
		
		
	}
	@RequestMapping(value = "/adminviewmember")
	public String viewAdminMember(){
		
		if(m==0 || m==2)
		{
			return "error";
		}
		else
		{
			return "adminviewmember";
		}
		
	}

	@RequestMapping(value = "/error")
	public String error(Model model)
	{
		
		return "error";
	}
	

}
