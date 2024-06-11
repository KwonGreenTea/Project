package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.PostVO;
import com.everytime.web.persistence.PostMapper;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PostServiceImple implements PostService {
    
    @Autowired
    private PostMapper postMapper;
    
    @Override
    public int createPost(PostVO postVO) {
        log.info("createPost()");
        log.info(postVO);
        int result = postMapper.insert(postVO);
        log.info(result);
        return result;
    }

    @Override
    public List<PostVO> getAllPosts(int boardId) {
        log.info("getAllPosts()");
        return postMapper.selectPostList(boardId);
    }

    @Override
    public PostVO getPostById(int postId) {
        log.info("getPostById()");
        return postMapper.selectOne(postId);
    }

    @Override
    public int updatePost(PostVO postVO) {
        log.info("updatePost()");
        return postMapper.update(postVO);
    }

    @Override
    public int deletePost(int postId) {
        log.info("deletePost()");
        return postMapper.delete(postId);
    }

    @Override
    public List<PostVO> getPagingPosts(Pagination pagination) {
        log.info("getPagingPosts()");
        return postMapper.selectListByPagination(pagination);
    }

    @Override
    public int getTotalCount() {
        log.info("getTotalCount()");
        return postMapper.selectTotalCount();
    }

}
