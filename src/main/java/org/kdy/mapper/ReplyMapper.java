package org.kdy.mapper;

import java.util.ArrayList;

import org.kdy.domain.ReplyDTO;

public interface ReplyMapper {
    
    public int write(ReplyDTO rDto);

    public ArrayList<ReplyDTO> list(int bno);

    public ReplyDTO modify(int rno);

    public int update(ReplyDTO rDto);

    public int remove(ReplyDTO rDto);
}
