package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.ChatListVO;


@Mapper
public interface ChatListMapper {
	int insert(String chat_title);

	int selectByName(String chat_title);

	List<ChatListVO> allRoom();

}