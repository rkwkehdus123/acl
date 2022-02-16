package org.kdy.controller;

import javax.servlet.http.HttpSession;

import org.kdy.domain.MemberDTO;
import org.kdy.service.Memberservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
    
    @Autowired
    private Memberservice mservice;

    @PostMapping("login")
    public String Postlogin(MemberDTO mDto, HttpSession session) {
        MemberDTO login = mservice.login(mDto);

        session.setAttribute("login", login);
        
//        return "redirect:/main";
        
        if(session.getAttribute("login")!=null) {
            return "redirect:/main";
        }else{
            return "redirect:/write";
        }
    }
    
    @GetMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/main";
    }
}
