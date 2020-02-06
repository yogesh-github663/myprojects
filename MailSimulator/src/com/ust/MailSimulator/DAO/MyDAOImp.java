package com.ust.MailSimulator.DAO;
    import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
	import org.hibernate.Session;
	import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.ordering.antlr.Factory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ust.MailSimulator.DTO.Mail_info;
import com.ust.MailSimulator.DTO.User_info;

	
	@Component
	public class MyDAOImp implements MyDAO {
		@Autowired
		SessionFactory sf;
		 
		
		
		@Override
	    public void register(com.ust.MailSimulator.DTO.User_info dto){
			Session ss=sf.openSession();
			Criteria cr=ss.createCriteria(User_info.class);
			cr.add(Restrictions.eq("Email", dto.getEmail()));
			User_info mdto= (User_info) cr.uniqueResult();
			if(mdto==null){
				ss.save(dto);
				ss.beginTransaction().commit();
				ss.close();	
				}
			}
		@Override
		public boolean login(User_info dto,HttpServletRequest req){
			Session ss=sf.openSession();
			Criteria cr=ss.createCriteria(User_info.class);
			cr.add(Restrictions.eq("Email", dto.getEmail()));
			cr.add(Restrictions.eq("Password", dto.getPassword()));
			User_info mdto=(User_info) cr.uniqueResult();
			ss.close();
			if(mdto!=null){
				HttpSession session=req.getSession();
				session.setAttribute("Email", dto.getEmail());
				String mail=(String) session.getAttribute("Email");
				System.out.println(mail);
				return true;
			}
			else{
				return false;
			}
			}
		@Override
		public void compose(Mail_info dto,HttpServletRequest req,HttpServletResponse res, User_info dto1 ,HttpSession session)  {
		    
			
			String mailto=req.getParameter("to");
			String sub=req.getParameter("sub");
			String msg=req.getParameter("msg");
			Session ss=sf.openSession();
			session=req.getSession(false);
			String usermail=(String)session.getAttribute("Email");
			System.out.println(mailto);
			System.out.println(usermail);
			Criteria cr1=ss.createCriteria(User_info.class);
			cr1.add(Restrictions.eq("Email",usermail));
            Mail_info mlinf=new Mail_info();
			Mail_info	mi1=new Mail_info();
			Criteria cr=ss.createCriteria(User_info.class);
			cr.add(Restrictions.eq("Email",mailto));
			User_info mdto=(User_info) cr.uniqueResult();
			
			if(mdto!=null){
				String s1=usermail;
				String s2=mailto;
				 if(s1.equals(s2)){
						System.out.println("mailto=usermail");
						mlinf.setTo_id(mailto);	
						mlinf.setSubject(sub);
						mlinf.setMessage(msg);
						mlinf.setStatus("sent");
						mlinf.setFrom_id(usermail);
					
				   
						mi1.setTo_id(mailto);	
						mi1.setSubject(sub);
						mi1.setMessage(msg);
						mi1.setStatus("inbox");
						mi1.setFrom_id(usermail);}
					else {
					mlinf.setTo_id(mailto);	
					mlinf.setSubject(sub);
					mlinf.setMessage(msg);
					mlinf.setStatus("sent");
					mlinf.setFrom_id(usermail);
					}
				
			}
			else{
			
				mlinf.setTo_id("invalid");
				mlinf.setSubject(sub);
				mlinf.setMessage(msg);
				mlinf.setStatus("draft");
				mlinf.setFrom_id(usermail);
				
				}
			
			
			ss.save(mlinf);
		    ss.save(mi1);
			ss.beginTransaction().commit();
			ss.close();
			try {
				PrintWriter pw=res.getWriter();
				pw.print("<h1 color=green>Email Sent Succesfully<h1>");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
			
		 }
	
	
	
		@Override
		public List<Mail_info> sent(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session) {
			    Session ss=sf.openSession();
			    session=req.getSession(false);
				String mailfrom=(String) session.getAttribute("Email");
				String to=dto.getTo_id();
				Query qry=ss.createQuery("from Mail_info where status='sent' and from_id=? ");
			    qry.setParameter(0,new String(mailfrom));
			    List<Mail_info> mlist=qry.list();
			    for (Mail_info m : mlist) {
					System.out.println(m);
			    }
			    return mlist;
				
			    
			    
			  }
			
		@Override
		public List<Mail_info> draft(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session){
			
			
			
			
			    
		        Session ss=sf.openSession();
		        String email=(String) session.getAttribute("Email");
				Query qry=ss.createQuery("from Mail_info where to_id='invalid' and from_id=? and status='draft'");
				qry.setParameter(0, new String(email));
				List<Mail_info> mlist=qry.list();
                return mlist; 
			   
			    
			    
		}
		@Override
		public List<Mail_info> inbox(Mail_info dto,HttpServletRequest req,HttpServletResponse res,HttpSession session) {
			
			
			    Session ss=sf.openSession();
				session=req.getSession(false);
				String inbox=(String) session.getAttribute("Email");
				System.out.println(inbox);
				dto=new Mail_info();
				Query qry=ss.createQuery("from Mail_info WHERE status='sent' OR status='inbox' and to_id=? ");
				qry.setParameter(0,new String(inbox));
				
				List<Mail_info> mlist=qry.list();
				return mlist;
			   
			
		
		
			
		
	}
		@Override
		public void logout(Mail_info dto,HttpServletRequest req,HttpServletResponse res ,HttpSession session) {
			if(session!=null){
				session.removeAttribute("Email");
				session.removeAttribute("Password");
				session.invalidate();
				}
				
			}
			
			
		@Override
		public List<Mail_info> delete(Mail_info dto,HttpServletRequest req,HttpServletResponse res ,HttpSession session){
		    Configuration cfg=new Configuration(); 
		    cfg.configure("hibernate.cfg.xml");
		    sf=cfg.buildSessionFactory();
		    Session ss=sf.openSession();
			String id=req.getParameter("id");
			int id1=Integer.parseInt(id);
		    session=req.getSession(false);
			
			
			Criteria cr=ss.createCriteria(Mail_info.class);
		    Query qr=ss.createQuery("from Mail_info where Id=?");
			qr.setParameter(0,new Integer(id1));
			
			List<Mail_info> mlist=qr.list();
			Object obj=ss.load(Mail_info.class, new Integer(id1));
			Mail_info mi=(Mail_info) obj;
			Transaction tx=ss.beginTransaction();
			mi.setStatus(new String("delete"));
			tx.commit();
			ss.close();
			try {
				PrintWriter pw=res.getWriter();
				pw.print("<h1 color=green>Email deleted Succesfully<h1>");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			sf.close();
			return mlist;
			
			
		}
		@Override
		public void updatepass(User_info dto, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
			 
			
			
			  String email=req.getParameter("email");
			  String pass=req.getParameter("newpassword");
			 
			  System.out.println(email);
			  System.out.println(pass);
			  Session ss=sf.openSession();
			  Query qry=ss.createQuery("Update from User_info set password=:pass where email=:email ");
			  qry.setParameter("pass", pass);
			  qry.setParameter("email", email);
			  qry.executeUpdate();
			  Transaction tx=ss.beginTransaction();
			
			  try {
					PrintWriter pw=res.getWriter();
					pw.print("<h1>Password Updated Successfully<h1>");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			  tx.commit();
			  ss.close();
			  sf.close();
			
	}
		@Override
		public List<Mail_info> deletedItems(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
				HttpSession session) {
			try {
				PrintWriter pw=res.getWriter();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			session=req.getSession(false);
			String inbox=(String) session.getAttribute("Email");
			Session ss=sf.openSession();
			dto=new Mail_info();
			Query qry=ss.createQuery(" from Mail_info WHERE to_id=? AND status='delete'");
			qry.setParameter(0,new String(inbox));
			List<Mail_info> mlist=qry.list();
			return mlist;
			
		}
		@Override
		public List<Mail_info> composeDrafted(Mail_info dto, HttpServletRequest req, HttpServletResponse res,HttpSession session) {
			
			String id=req.getParameter("id");
			int id1=Integer.parseInt(id);
			String mailto=req.getParameter("to");
			System.out.println(mailto);
			String sub=req.getParameter("sub");
			String msg=req.getParameter("msg");
			System.out.println(msg);
			session=req.getSession(false);
			String usermail=(String)session.getAttribute("Email");
		    Session ss=sf.openSession();
		    Criteria cr=ss.createCriteria(Mail_info.class);
		    cr.add(Restrictions.eq("id", id1));
		    Mail_info dt=(Mail_info) cr.uniqueResult();
		    dt.setMessage(msg);
		    dt.setTo_id(mailto);
		    dt.setSubject(sub);
		    dt.setStatus(new String("sent"));
		    ss.update(dt);
		    
//			Query qr=ss.createQuery("Update from Mail_info set to_id=:mailto , Subject=:sub , Message=:msg , status=:status where id=:id");
//			qr.setParameter("mailto",mailto);
//			qr.setParameter("sub",sub);
//			qr.setParameter("msg",msg);
//			
//			qr.setParameter("id",id);
//			int rows=qr.executeUpdate();
//			System.out.println(rows);
			ss.beginTransaction().commit();
		    ss.close();
		
		try {
			PrintWriter pw=res.getWriter();
			pw.print("<h1 color=green>Email Sent Succesfully<h1>");
		} catch (IOException e) {
			
			e.printStackTrace();
		
		}
		
		return null;
			    }
		@Override
		public List<Mail_info> deleteParmanent(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
				HttpSession session) {
			session=req.getSession(false);
			String del=(String) session.getAttribute("Email");
			Session ss=sf.openSession();
			dto=new Mail_info();
			Query qry=ss.createQuery("Delete from Mail_info WHERE to_id=? ");
			qry.setParameter(0,new String(del));
			List<Mail_info> mlist=qry.list();
			return mlist;
			
		}
		@Override
		public List<Mail_info> revertback(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
				HttpSession session) {
			     Configuration cfg=new Configuration(); 
			    cfg.configure("hibernate.cfg.xml");
			    sf=cfg.buildSessionFactory();
			    Session ss=sf.openSession();
				String id=req.getParameter("id");
				int id1=Integer.parseInt(id);
			    session=req.getSession(false);
				
				
				Criteria cr=ss.createCriteria(Mail_info.class);
			    Query qr=ss.createQuery("from Mail_info where Id=?");
				qr.setParameter(0,new Integer(id1));
				
				List<Mail_info> mlist=qr.list();
				Object obj=ss.load(Mail_info.class, new Integer(id1));
				Mail_info mi=(Mail_info) obj;
				Transaction tx=ss.beginTransaction();
				mi.setStatus(new String("sent"));
				tx.commit();
				ss.close();
				try {
					PrintWriter pw=res.getWriter();
					pw.print("<h1 color=green>Email deleted Succesfully<h1>");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				sf.close();
				return mlist;
			
		}
		@Override
		public Mail_info send(Mail_info dto, HttpServletRequest req) {
			String mid=req.getParameter("id");
			int id=Integer.parseInt(mid);
			Session ss=sf.openSession();
			Criteria cr=ss.createCriteria(Mail_info.class);
			cr.add(Restrictions.eq("id", id));
			Mail_info dt=(Mail_info) cr.uniqueResult();
			
			return dt;
		}
		@Override
		public void composedata(Mail_info dto, HttpServletRequest req, HttpServletResponse res,
				HttpSession session) {
			String to=req.getParameter("to");
			System.out.println(to);
			String sub=req.getParameter("sub");
			System.out.println(sub);
			String msg=req.getParameter("msg");
			System.out.println(msg);
			
			Session ss=sf.openSession();
			String mid=req.getParameter("id");
			int id=Integer.parseInt(mid);
			System.out.println(id);
			Query qr=ss.createQuery("Update from Mail_info set to_id=:to , subject=:sub , message=:msg , status='sent' where id=:id ");
			qr.setParameter("id",id);
			qr.setParameter("to",to);
			qr.setParameter("sub",sub);
			qr.setParameter("msg",msg);
			
			qr.executeUpdate();
			
		   /* Criteria cr=ss.createCriteria(Mail_info.class);
			cr.add(Restrictions.eq("id", id));
			Mail_info dt=(Mail_info) cr.uniqueResult();
			dt.setTo_id(to);
			dt.setMessage(msg);
			dt.setStatus(sta);
			ss.update(dt);*/
			ss.beginTransaction().commit();
			ss.close();
			
			
			
		}
		
}	

		
	
			   
		
			
		
	
		





