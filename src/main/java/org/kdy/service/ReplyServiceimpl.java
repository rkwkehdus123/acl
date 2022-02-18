package org.kdy.service;

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

}
