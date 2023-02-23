package site.itwill.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.itwill.dto.Member;
import site.itwill.exception.LoginAuthFailException;
import site.itwill.exception.MemberExistsException;
import site.itwill.exception.MemberNotFoundException;
import site.itwill.service.MemberService;
import site.itwill.util.EmailSendBean;
import site.itwill.util.Math_random;
import site.itwill.util.ScriptUtil;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	

	//�쉶�썝�젙蹂� �엯�젰�븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() throws Exception {
		return "member/member_join";
	}

	//�쉶�썝�젙蹂� �엯�젰諛쏆븘 MEMBER�뀒�씠釉붿뿉 ���옣�븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String join(@ModelAttribute Member member) throws MemberExistsException {
		memberService.insertMember(member);
		return "redirect:/member/login";//�쉶�썝媛��엯 �셿猷뚯떆 濡쒓렇�씤�솕硫댁쑝濡� �씠�룞 
	}
	
	//�씤利앹젙蹂�(ID/PW) �엯�젰�븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/member_login"; 
	}
	
	//�씤利앹젙蹂�(ID/PW)瑜� �쟾�떖諛쏆븘 MEMBER �뀒�씠釉붿뿉 ���옣�맂 �쉶�썝�젙蹂댁� 鍮꾧탳�븯�뿬 �씤利앹쿂由ы븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member,HttpSession session) 
			throws LoginAuthFailException, MemberNotFoundException {
		//�씤利앹떎�뙣�떆
		memberService.loginAuth(member);
		System.out.println("濡쒓렇�씤�떎�뙣");
		
		//�씤利앹꽦怨듭떆
		session.setAttribute("loginMember", memberService.selectMember(member.getmId()));
		System.out.println("濡쒓렇�씤�꽦怨�");
		String path=(String) session.getAttribute("prev_url");
	      if(path==null) {
	         return "member/member_login";
	      }else {
	         session.removeAttribute("prev_url");
	         return "redirect:"+path;
	      }
	}

	//濡쒓렇�븘�썐 �슂泥��븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login"; 
	}
	
	//�쉶�썝�젙蹂� 蹂�寃쏀븯�뒗 �럹�씠吏� 異쒕젰 硫붿냼�뱶 
	//濡쒓렇�씤 �궗�슜�옄留� �슂泥�媛��뒫�븯�룄濡� �씤�꽣�뀎�듃 �궗�슜
	@RequestMapping(value = "/member/update", method = RequestMethod.GET) 
		public String update(@RequestParam String mId, Model model, HttpSession session) throws MemberNotFoundException { 
			Member member=(Member)session.getAttribute("loginMember");
			mId=member.getmId();
			model.addAttribute("member", memberService.selectMember(mId));
		return "member/member_mypage"; 
	}
	

	//�쉶�썝�젙蹂� 蹂�寃쏀븯�뒗 硫붿냼�뱶
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String update(@ModelAttribute Member member,HttpSession session) throws MemberNotFoundException {
		memberService.updateMember(member);
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		//蹂�寃쏀쉶�썝�씠 �쁽�옱 濡쒓렇�씤 �궗�슜�옄�씤 寃쎌슦
		if(loginMember.getmId().equals(member.getmId())) {
			session.setAttribute("loginMember", memberService.selectMember(member.getmId()));
		}
		return "redirect:/member/update?mId="+member.getmId(); 
	}

	//�쉶�썝�젙蹂� �궘�젣�븯�뒗 硫붿냼�뱶
	//濡쒓렇�씤 �궗�슜�옄留� �슂泥�媛��뒫�븯�룄濡� �씤�꽣�뀎�듃 �궗�슜
	@RequestMapping(value = "/member/delete")
	public String delete(@RequestParam String mId,HttpSession session) throws MemberNotFoundException {
		memberService.deleteMember(mId);
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		if(loginMember.getmId().equals(mId)) {
			return "redirect:/member/logout";
		}
		return "redirect:/member/login"; 
	}

	
	@RequestMapping(value = "/member/find", method = RequestMethod.GET) 
	public String find() {
		return "member/member_id_pw_find";
	}
	
	
	@RequestMapping(value = "/member/find", method = RequestMethod.POST) 
	public String find(Member member, Model model) throws MemberNotFoundException {
	
		try {
			Member member2=memberService.selectId(member);
			model.addAttribute("check", 0);
		 	model.addAttribute("mId", member2.getmId());
		 	return "member/member_id_pw_find"; 	
		} catch (MemberNotFoundException e) {
			model.addAttribute("check", 1); 
			return "member/member_id_pw_find"; 	
		}
		
		/*if(member2==null) { 
			model.addAttribute("check", 1); 
			return "member/member_id_pw_find";
		} else {
		 	model.addAttribute("check", 0);
		 	model.addAttribute("mId", member2.getmId());
		}	
			return "member/member_id_pw_find"; 
		}*/
	}
		
	@RequestMapping(value = "/member/findPw", method = RequestMethod.POST) 
	public String findPw(@ModelAttribute Member member, HttpSession session, HttpServletResponse response, HttpServletRequest request ) throws MemberNotFoundException, IOException {
		
		member.setmPw(Math_random.getTempPassword(10));
		String pw=member.getmPw();
		member.setmPw(BCrypt.hashpw(member.getmPw(), BCrypt.gensalt()));
		int checkone=memberService.updatePw(member);
		if(checkone==0) {
			ScriptUtil.alertAndMovePage(response, "일치하는 회원정보가 없습니다.");
			return "member/member_id_pw_find";
		} else {
			ApplicationContext context=new ClassPathXmlApplicationContext("email.xml");
			EmailSendBean bean=context.getBean("emailSendBean", EmailSendBean.class);
			
			bean.sendEmail(member.getmEmail(), "Aspring 임시비밀번호 안내입니다."
					, "임시비밀번호는"+pw+"입니다.");
			((ClassPathXmlApplicationContext)context).close();
			
			ScriptUtil.alertAndMovePage(response, "임시비밀번호를 메일로 전송하였습니다. 확인후 마이페이지에서 비밀번호를 수정해주세요.");
		}
		return "member/member_login";	
	}
	
	@RequestMapping(value = "/admin/list")
	public String list(Model model) {
		model.addAttribute("memberList", memberService.selectMemberList());
		return "admin/dist/admin_memberlist";
	}

	
	@RequestMapping(value = "/member/mileage")
	public String mileage() {
		return "member/member_mileage"; 
	}
	
	@RequestMapping(value = "/member/mybook")
	public String mybook() {
		return "member/member_mybook"; 
	}
	
	@ExceptionHandler(MemberExistsException.class)
	public String exceptionHandler(MemberExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member", exception.getMember());
		return "member/member_join";
	}
	
	@ExceptionHandler(LoginAuthFailException.class)
	public String exceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("mId", exception.getmId());
		return "member/member_login";
	}
}
