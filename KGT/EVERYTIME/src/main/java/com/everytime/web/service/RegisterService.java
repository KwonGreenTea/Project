package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.RegisterVO;

public interface RegisterService {
	int createRegister(RegisterVO registerVO);
	RegisterVO getRegisterById(String memberId);
	List<Integer> getAllId();
	int updateRegister(RegisterVO registerVO);
	int deleteRegister(String memberId);
	
	int updatePassword(String memberId, String password);
	int updateEmail(String memberId, String email);
	int updateNickname(String memberId, String nickname);
	int verifyPw(RegisterVO registerVO);
	
}
