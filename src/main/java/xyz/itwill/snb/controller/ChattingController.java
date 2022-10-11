package xyz.itwill.snb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import xyz.itwill.snb.service.ParticipantService;
import xyz.itwill.snb.service.WriteService;

@Controller
@RequiredArgsConstructor
public class ChattingController {
	
	@Autowired
	private WriteService writeService;
	
	private final ParticipantService participantService;
	
	@RequestMapping(value="/chat", method=RequestMethod.GET)
	public String view_chat(@RequestParam String bnum, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
	
		model.addAttribute("userid", session.getAttribute("loginUser"));  // session에서 아이디 가져오기
		
		if(bnum.matches("[0-9]+")) {
			model.addAttribute("board", writeService.choiceBoard(Integer.parseInt(bnum)));
		}
		return "chatting";
	}
	
	@RequestMapping(value="/chat", method=RequestMethod.POST)
	public String add_chat(@ModelAttribute(value = "p_list") List<String> plist , @RequestParam String bnum) throws Exception {
		
		int bid = Integer.parseInt(bnum);
		for(String pid : plist)
			participantService.addParticipant(bid, pid);
		
		writeService.updateStatusBoard(bid);
		
		return "chatting";
	}
}
