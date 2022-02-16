package org.kdy.service;

import java.util.ArrayList;

import org.kdy.domain.BoardDTO;

public interface BoardService {
	
	public void write(BoardDTO board);
	
	public ArrayList<BoardDTO> detail();

}
