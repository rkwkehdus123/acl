package org.kdy.service;

import java.util.ArrayList;

import org.kdy.domain.ReplyDTO;
import org.kdy.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceimpl implements ReplyService{
    
    @Autowired
    private ReplyMapper rMapper;


    public int write(ReplyDTO rDto) {
        return rMapper.write(rDto);
    }
//    // 댓글 목록 리스트 설계한 것을 구현
    public ArrayList<ReplyDTO> list(int bno) {
       return rMapper.list(bno);
    }
    // 댓글 수정 설계한 것을 구현
    public ReplyDTO modify(int rno) {
       return rMapper.modify(rno);
    }
    // 댓글 update 설계한 것을 구현
    public int update(ReplyDTO rDto) {
       return rMapper.update(rDto);
    }
    // 댓글 삭제 설계한 것을 구현
    public int remove(ReplyDTO rDto) {
       return rMapper.remove(rDto);
    }

}
