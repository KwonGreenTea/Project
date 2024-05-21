package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.RegisterVO;

@Mapper
public interface RegisterMapper {
   int insert(RegisterVO registerVO);
   RegisterVO selectByRegisterId(String memberId);
   List<Integer> selectIdList();
   int update(RegisterVO registerVO);
   int delete(String memberId);
   
   int verifyPw(RegisterVO registerVO);
   int updatePassword(@Param("memberId") String memberId, @Param("password") String password);
   int updateEmail(@Param("memberId") String memberId, @Param("email") String email);
   int updateNickname(@Param("memberId") String memberId, @Param("nickname") String nickname);

}