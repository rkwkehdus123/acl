package org.kdy.controller;

import org.kdy.domain.BoardDTO;
import org.kdy.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    @Autowired
    private BoardService service;
    
    @GetMapping("write")
    public void write() {
    	
    }
    
    public String writePost(BoardDTO board) {
		service.write(board);
		return "redirect:/main";
	}
}
