package org.kdy.service;

import org.kdy.domain.MemberDTO;
import org.kdy.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Memberserviceimpl implements Memberservice{
    
    @Autowired
    private MemberMapper mmapper;

    public MemberDTO login(MemberDTO mDto) {
        return mmapper.login(mDto);
    }
}
