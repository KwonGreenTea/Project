package com.everytime.web.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ChatListVO;
import com.everytime.web.persistence.ChatListMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatListServiceImple implements ChatListService {
	@Autowired
	private ChatListMapper chatListMapper;

	@Override
	public int createRoom(String chat_title) {
		log.info("createRoom");
		return chatListMapper.insert(chat_title);
	}

	@Override
	public int roomCount(String chat_title) {
		return chatListMapper.selectByName(chat_title);
	}

	@Override
	public List<ChatListVO> allRoom() {
		return chatListMapper.allRoom();
	}
	
}
