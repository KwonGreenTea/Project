package com.everytime.web.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.TimetableVO;

@Mapper
public interface TimetableMapper {
	int insert(TimetableVO timetableVO);
	TimetableVO allSelect();
}
