package org.kdy.mapper;

import java.util.ArrayList;

import org.kdy.domain.BoardDTO;

public interface BoardMapper {

    public void write(BoardDTO board);

	public ArrayList<BoardDTO> detail();

}
