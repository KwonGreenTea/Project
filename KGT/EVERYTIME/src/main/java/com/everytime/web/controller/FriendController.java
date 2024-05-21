package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.FriendVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.FriendService;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FriendController {
    
    @Autowired
    private FriendService friendService;
    @Autowired
    private RegisterService registerService;

    @GetMapping("/main")
    public void mainGET(HttpServletRequest request, Model model) {
        log.info("mainGET");
        HttpSession session = request.getSession();
        String requestId = (String) session.getAttribute("memberId");

        log.info("requestId = " + requestId);
        
        // 친구 요청 리스트 가져오기
        List<FriendVO> requestList = friendService.checkRequest(requestId);

        // 내가 수락한 친구 목록 조회
        List<String> acceptlist = friendService.UserAccept(requestId);

        log.info("friendlist = " + acceptlist);
        
        List<FriendVO> friendlist = new ArrayList<FriendVO>();
        
        for(int i = 0; i < acceptlist.size(); i++) {
            friendlist.add(friendService.checkFriend(acceptlist.get(i), requestId));
            log.info(requestId);
        }
        log.info(friendlist);
        
        model.addAttribute("friendlist", friendlist);
        model.addAttribute("requestList", requestList);
    }

    // 친구 추가 메서드 (POST)
    @PostMapping("/main/friend")
    public String mainFriendPOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
        log.info("mainFriendPOST()");

        HttpSession session = request.getSession();
        String requestId = (String) session.getAttribute("memberId");

        log.info("requestId = " + requestId + ", responseId = " + responseId);

        RegisterVO registerVO = registerService.getRegisterById(responseId);

        FriendVO friendVO = friendService.checkFriend(requestId, responseId);

        log.info("gg " + friendVO);
        if (registerVO != null) {
            if (friendVO == null) {
                int result = friendService.createFriend(requestId, responseId);
                log.info(result + " 건 추가됨");
            } else {
                log.info("이미 친구로 추가된 상태입니다");
            }
        } else {
            log.info("아이디가 존재하지 않습니다");
        }

        return "redirect:/main";
    }

    @PostMapping("/main/accept")
    public String mainAcceptPOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
        log.info("mainAcceptPOST()");
        HttpSession session = request.getSession();
        String requestId = (String) session.getAttribute("memberId");

        int result = friendService.acceptFriend(requestId, responseId);
        log.info(result + " 건 수락됨");

        return "redirect:/main";
    }

    @PostMapping("/main/delete")
    public String mainRefusePOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
        log.info("mainRefusePOST()");

        HttpSession session = request.getSession();
        String requestId = (String) session.getAttribute("memberId");

        log.info("requestId = " + requestId + ", responseId = " + responseId);

        int result = friendService.deleteFriend(requestId, responseId);
        log.info(result + " 건 삭제됨");

        return "redirect:/main";
    }

}
