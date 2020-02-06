package com.ust.MailSimulator.DAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.ust.MailSimulator.DTO.Mail_info;
import com.ust.MailSimulator.DTO.User_info;

public interface MyDAO {
	void register(User_info dto);
	boolean login(User_info dto, HttpServletRequest req);
	void compose(Mail_info dto, HttpServletRequest req,HttpServletResponse res, User_info dto1, HttpSession session);
	List<Mail_info> sent(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session);
    List<Mail_info> draft(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session);
	List<Mail_info> inbox(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session);
	void logout(Mail_info dto,HttpServletRequest req, HttpServletResponse res ,HttpSession session);
	List<Mail_info> delete(Mail_info dto,HttpServletRequest req, HttpServletResponse res ,HttpSession session);
	void updatepass(User_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session);
	List<Mail_info> deletedItems(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session);
    List<Mail_info> deleteParmanent(Mail_info dto,HttpServletRequest req, HttpServletResponse res ,HttpSession session);
	List<Mail_info> revertback(Mail_info dto,HttpServletRequest req, HttpServletResponse res ,HttpSession session);
	List<Mail_info> composeDrafted(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
			HttpSession session);
	Mail_info send(Mail_info dto,HttpServletRequest req);
	void composedata(Mail_info dto, HttpServletRequest req, HttpServletResponse res, HttpSession session);
	
	
	
	
	
	
}
