package org.kdy.service;

import org.kdy.domain.BoardDTO;
import org.kdy.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceimpl implements BoardService{
    @Autowired
    private BoardMapper bMapper;

    public void write(BoardDTO board) {
        bMapper.write(board);
    }
}
