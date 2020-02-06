package com.ust.MailSimulator.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ust.MailSimulator.DTO.Mail_info;
import com.ust.MailSimulator.DTO.User_info;
import com.ust.MailSimulator.Service.MyService;

@RequestMapping("/")
@Component
public class MyController {
	@Autowired
	MyService ms;
	
	@RequestMapping("/link1")
	public String m1(){
		return "login";
	}
	@RequestMapping("/link2")
	public String m2(){
		return "reg";
	}
	@RequestMapping("/link3")
	public String m3(){
		return "compose";
	}
	
	@RequestMapping("/link5")
	public String m7(){
		return "forgotpassword";
	}
	
	
	
	@RequestMapping("/link4")
	public String m5(){
		return "logout";
	}
	
	@RequestMapping("/link6")
	public String m8(){
		return "composeDeletedItems";
	}
	
	
	@RequestMapping(value="/Login",method=RequestMethod.POST)
    public String loginValidation(@ModelAttribute User_info dto,HttpServletRequest req){
    boolean b=ms.login(dto,req);
    if(b) {
    	System.out.println("Login Success");
    	return "home";
       }
    else
    {
    	System.out.println("Login Failed");
    	}
	return "login";
    } 
    
    @RequestMapping(value="/RegistrationData",method=RequestMethod.POST)
    public String registrationData(@ModelAttribute User_info dto){
    	
    	ms.register(dto);
		return "reg";
    	
    }
    
    @RequestMapping(value="/Compose",method=RequestMethod.POST)
    public void compose(@ModelAttribute Mail_info dto,HttpServletRequest req,HttpServletResponse res, User_info dto1,HttpSession session){
    	String email=(String) session.getAttribute("Email");
    	
		try {
			PrintWriter pw = res.getWriter();
			if(email==null){
		    	pw.print("Please Login First");
		    	
		    		}
		    	else{
		    		ms.compose(dto, req,res,dto1, session);
		    		
		    	}
		} catch (IOException e) {
			
			e.printStackTrace();
		}
    	
    	
		
    	
    }
   
	@RequestMapping(value="/sent")
    public ModelAndView sent(@ModelAttribute Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){

    	String email=(String) session.getAttribute("Email");
    	if(email==null){
    		return new ModelAndView("login","message","Login First");
    		}
    	else{
    		List<Mail_info> mlist=ms.sent(dto,req,res,session);
    		return new ModelAndView("sent","mlist",mlist);
    	}
    	
		
		
    } 
    
    @RequestMapping(value="/draft")
    public ModelAndView draft(@ModelAttribute Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	session=req.getSession(false);
    	String email=(String) session.getAttribute("Email");
    	if(email==null){
    		return new ModelAndView("login","message","Login First");
    		}
    	else{
    		List<Mail_info> mlist=ms.draft(dto,req,res,session);
    		return new ModelAndView("draft","mlist",mlist);
    	}
    	
		
    	
    }
    @RequestMapping(value="/inbox")
    public ModelAndView inbox(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	session=req.getSession(false);
    	String email=(String) session.getAttribute("Email");
    	if(email==null){
    		return new ModelAndView("login","message","Login First");
    		
    	}
    	else{
    		List<Mail_info> mlist=ms.inbox(dto,req,res, session);
    		
    		return new ModelAndView("inbox","mlist",mlist);
    		
    	}
    	
    }
    
    @RequestMapping(value="/logout")
    public String logout(@ModelAttribute Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	ms.logout(dto,req,res, session);
    	return "logout";
    	
		
    	
    }
    @RequestMapping("/delete")
    public List<Mail_info> delete(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	List<Mail_info> mlist=ms.delete(dto,req,res,session);
    	return mlist;
    	
    }
    
   
    
    @RequestMapping(value="/UpdatePassword",method=RequestMethod.POST)
    public void updatepass(@ModelAttribute User_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	
    	ms.updatepass(dto,req,res, session);
    	
	 }
    
    @RequestMapping(value="/deletedItems")
    public ModelAndView deletedItems(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	session=req.getSession(false);
    	String email=(String) session.getAttribute("Email");
    	if(email==null){
    		return new ModelAndView("login","message","Login First");
    		
    	}
    	else{
    		List<Mail_info> mlist=ms.deletedItems(dto,req,res, session);
    		
    		return new ModelAndView("deletedItems","mlist",mlist);
    		
    	}
    	
    }
    
   
    @RequestMapping("/deleteParmanent")
    public List<Mail_info> deleteParmanent(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	List<Mail_info> mlist=ms.delete(dto,req,res,session);
    	return mlist;
    	
    }
    
    @RequestMapping("/revertback")
    public List<Mail_info> revertback(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	List<Mail_info> mlist=ms.delete(dto,req,res,session);
    	return mlist;
    	
    }
    
    @RequestMapping(value="/ComposeDrafted",method=RequestMethod.POST)
    public ModelAndView composeDrafted(@ModelAttribute Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
    	String email=(String) session.getAttribute("Email");
    	if(email==null){
    		return new ModelAndView("login","message","Login First");
    		}
    	else{
    		System.out.println("Inside Controller");
    		ms.composedata(dto,req,res,session);
    		return new ModelAndView("home");
    	}
    }
    
    @RequestMapping(value="/send")
    public ModelAndView send(@ModelAttribute Mail_info dto,HttpServletRequest req){
    	Mail_info dt=ms.send(dto,req);
    	return new ModelAndView("composeDrafted","dto",dt);
    } 	
	
}
