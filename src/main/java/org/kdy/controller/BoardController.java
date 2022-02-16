package org.kdy.controller;

import org.kdy.domain.BoardDTO;
import org.kdy.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {

    @Autowired
    private BoardService service;
    
    
    @GetMapping("main")
	  public void detail(Model model) {
		model.addAttribute("detail", service.detail());
	}
    
    @GetMapping("write")
    public void write() {
    	
    }
    
    @PostMapping("write")
    public String writePost(BoardDTO board) {
		service.write(board);
		return "redirect:/main";
	}
    
    
}
