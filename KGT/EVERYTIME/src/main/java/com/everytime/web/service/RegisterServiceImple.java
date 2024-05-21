package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.RegisterVO;
import com.everytime.web.persistence.RegisterMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RegisterServiceImple implements RegisterService {
	@Autowired
	private RegisterMapper registerMapper;
	
	@Override
		public int createRegister(RegisterVO registerVO) {
			log.info("createRegister");
			return registerMapper.insert(registerVO);
	}
	
	@Override
	public RegisterVO getRegisterById(String memberId) {
		log.info("getRegisterById()");
		return registerMapper.selectByRegisterId(memberId);
	}
	
	@Override
	public List<Integer> getAllId() {
		log.info("getAllId()");
		return registerMapper.selectIdList();
	}
	
	@Override
	public int updateRegister(RegisterVO registerVO) {
		log.info("updateRegister()");
		return registerMapper.update(registerVO);
	}
	
	@Override
	public int deleteRegister(String memberId) {
		log.info("deleteRegister()");
		return registerMapper.delete(memberId);
	}
	
	@Override
	public int verifyPw(RegisterVO registerVO) {
		// log.info("verifyPw()");
		return registerMapper.verifyPw(registerVO);
	}

	@Override
	public int updatePassword(String memberId, String password) {
		log.info("updatePassword()");
		return registerMapper.updatePassword(memberId, password);
	}

	@Override
	public int updateEmail(String memberId, String email) {
		log.info("updateEmail()");
		return registerMapper.updateEmail(memberId, email);
	}

	@Override
	public int updateNickname(String memberId, String nickname) {
		log.info("updateNickname()");
		return registerMapper.updateNickname(memberId, nickname);
	}
	
}
