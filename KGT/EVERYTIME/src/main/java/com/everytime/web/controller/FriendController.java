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

   @GetMapping("/frd")
    public  String mainGET(HttpServletRequest request, Model model ) {
        log.info("mainGET");
        HttpSession session = request.getSession();
        String requestId = (String) session.getAttribute("memberId");
        if(requestId != null) {
        log.info("requestId = " + requestId);
        
        // 친구 요청 리스트 가져오기
        List<FriendVO> requestList = friendService.checkRequest(requestId);

        // 내가 수락한 친구 목록 조회
        List<String> acceptlist = friendService.UserAccept(requestId);

        log.info("friendlist = " + acceptlist);
        
        List<FriendVO> friendlist = new ArrayList<FriendVO>();
        
        for(int i = 0; i < acceptlist.size(); i++) {
           // 내가 수락한 친구가, 나를 수락한 경우
            friendlist.add(friendService.FriendAccept(acceptlist.get(i), requestId));
            log.info(requestId);
        }
        log.info(friendlist);
        
        model.addAttribute("friendlist", friendlist);
        model.addAttribute("requestList", requestList);
        return "/frd";
        }   else {
           log.info("로그인 후 이용하세요");
           return "redirect:/login";
        }
    }

   // 친구 추가 메서드 (POST)
   @PostMapping("/frd/friend")
   public String mainFriendPOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
      log.info("mainFriendPOST()");

      HttpSession session = request.getSession();
      String requestId = (String) session.getAttribute("memberId");
   if(requestId != null) {
      log.info("requestId = " + requestId + ", responseId = " + responseId);

      RegisterVO registerVO = friendService.getRegisterById(responseId);

      List<FriendVO> friendVO = friendService.checkFriend(requestId, responseId);

      log.info("gg " + friendVO);
      if (registerVO != null && !requestId.equals(responseId)) { // 등록된 ID가 아니거나 , 자신에게 친구 추가 불가
         if (friendVO == null) {
            int result = friendService.createFriend(requestId, responseId);
            log.info(result + " 건 추가됨");
         } else {
            log.info("이미 친구로 추가된 상태입니다 혹은 친구 수락버튼을 눌러주세요");
         }
      } else {
         log.info("아이디가 존재하지 않거나 자기 자신은 친구추가가 안됩니다");
      }

      return "redirect:/main";
      } else {
         log.info("로그인 후 이용하세요");
         return "redirect:/login";
      }
   }

   @PostMapping("/frd/accept")
   public String mainAcceptPOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
      log.info("mainAcceptPOST()");
      HttpSession session = request.getSession();
      String requestId = (String) session.getAttribute("memberId");

      int result = friendService.acceptFriend(requestId, responseId);
      log.info(result + " 건 수락됨");

      return "redirect:/main";
   }

   @PostMapping("/frd/delete")
   public String mainRefusePOST(String responseId, HttpServletRequest request, RedirectAttributes reAttr) {
      log.info("mainRefusePOST()");

      HttpSession session = request.getSession();
      String requestId = (String) session.getAttribute("memberId");

      log.info("requestId = " + requestId + ", responseId = " + responseId);

      int result = friendService.deleteFriend(requestId, responseId);
      log.info(result + " 건 삭제됨");

      return "redirect:/frd";
   }

}