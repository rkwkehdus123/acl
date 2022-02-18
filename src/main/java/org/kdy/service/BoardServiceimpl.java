package org.kdy.service;


import java.util.ArrayList;

import org.kdy.domain.BoardDTO;
import org.kdy.domain.Criteria;
import org.kdy.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceimpl implements BoardService{
    @Autowired
    private BoardMapper bMapper;

    public ArrayList<BoardDTO> maindetail(Criteria cri) {
        return bMapper.maindetail(cri);
    }


    public void write(BoardDTO board) {
        bMapper.write(board);
    }
    
	public BoardDTO detail(BoardDTO board) {
		return bMapper.detail(board);
	}

    public void modify(BoardDTO board) {
        bMapper.modify(board);
    }

    public void remove(BoardDTO board) {
        bMapper.remove(board);
    }

    public int total(Criteria cri) {
        return bMapper.total(cri);
    }

    public int realtotal() {
        return bMapper.realtotal();
    }
}
