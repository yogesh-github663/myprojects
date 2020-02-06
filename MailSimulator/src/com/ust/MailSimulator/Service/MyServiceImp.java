package com.ust.MailSimulator.Service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.ust.MailSimulator.DAO.MyDAO;
import com.ust.MailSimulator.DTO.Mail_info;
import com.ust.MailSimulator.DTO.User_info;

@Component
public class MyServiceImp implements MyService {
	@Autowired
	MyDAO mdao;
	@Override
	public void register(User_info dto){
		System.out.println("Inside Service");
		mdao.register(dto);
	}
	
    @Override
	public boolean login(User_info dto,HttpServletRequest req){
		
		boolean b=mdao.login(dto, req);
		return b;
	}
    
    @Override
	public void compose(Mail_info dto,HttpServletRequest req,HttpServletResponse res, User_info dto1 ,HttpSession session) {
    	mdao.compose(dto, req,res, dto1, session);
	
	
		
	}

	@Override
	public List<Mail_info> sent(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session) {
		List<Mail_info> mlist=mdao.sent(dto,req,res,session);
		return mlist;
		
	}

	

	@Override
	public List<Mail_info> draft(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session) {
	List<Mail_info>	mlist=mdao.draft(dto,req,res,session);
		return mlist;
	}

	@Override
	public List<Mail_info>  inbox(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session) {
		
	return mdao.inbox(dto, req, res, session);
		
		
	}
	
	@Override
	public void logout(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
		
		mdao.logout(dto,req,res,session);
	}
	
    @Override
	public List<Mail_info> delete(Mail_info dto,HttpServletRequest req, HttpServletResponse res ,HttpSession session) {
		List<Mail_info> mlist=mdao.delete(dto,req,res,session);
		return mlist;
		
	}

	@Override
	public void updatepass(User_info dto, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mdao.updatepass(dto, req, res, session);
		
	}

	

	@Override
	public List<Mail_info> composeDrafted(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		List<Mail_info> mlist=mdao.composeDrafted(dto, req,res, session);
		return mlist;
		
	}

	@Override
	public List<Mail_info> deleteParmanent(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		List<Mail_info> mlist=mdao.delete(dto,req,res,session);
		return mlist;
		
	}

	@Override
	public List<Mail_info> revertback(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		List<Mail_info> mlist=mdao.revertback(dto,req,res,session);
		return mlist;
	}

	@Override
	public List<Mail_info> deletedItems(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		
		List<Mail_info> mlist=mdao.deletedItems(dto, req, res, session);
		return mlist;
	}

	@Override
	public Mail_info send(Mail_info dto, HttpServletRequest req) {
		return mdao.send(dto, req);
		
	}

	@Override
	public void composedata(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		
		 mdao.composedata(dto,req,res,session);
	}

	

	
	
	
}


