package org.kdy.mapper;

import java.util.ArrayList;

import org.kdy.domain.BoardDTO;
import org.kdy.domain.Criteria;

public interface BoardMapper {

    public ArrayList<BoardDTO> maindetail();

    public ArrayList<BoardDTO> list(Criteria cri);

    public void write(BoardDTO board);

	public BoardDTO detail(BoardDTO board);
	
	public void modify(BoardDTO board);

    public void remove(BoardDTO board);

    public int total();
}
