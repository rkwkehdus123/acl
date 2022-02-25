package org.kdy.controller;


import org.kdy.domain.BoardDTO;
import org.kdy.domain.Criteria;
import org.kdy.domain.PageDTO;
import org.kdy.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {

  @Autowired
  private BoardService service;
    
    
  @GetMapping("main")
  public void maindetail(Model model, Criteria cri) {
      model.addAttribute("maindetail", service.maindetail(cri));

      int total = service.total(cri);
      PageDTO pDto = new PageDTO(cri, total);
      model.addAttribute("pager", pDto);

      int realtotal = service.realtotal();
      model.addAttribute("realtotal", realtotal);
  }
  
  @GetMapping("write")
  public void write() {
    
  }
    
  @PostMapping("write")
  public String writePost(BoardDTO board) {
	  service.write(board);
	  return "redirect:/main";
  }

  @GetMapping("detail")
  public void detail(BoardDTO board, Model model, Criteria cri) {
	  model.addAttribute("detail", service.detail(board));

	  model.addAttribute("maindetail", service.maindetail(cri));
	  
	  int realtotal = service.realtotal();
      model.addAttribute("realtotal", realtotal);
      
      int total = service.total(cri);
      PageDTO pDto = new PageDTO(cri, total);
      model.addAttribute("pager", pDto);
  }

  @GetMapping("modify")
  public void modify(BoardDTO board, Model model) {
	  model.addAttribute("detail", service.detail(board));
  }
  
  @PostMapping("modify")
  public String modifyPost(BoardDTO board, RedirectAttributes rttr) {
	  service.modify(board);
	  rttr.addAttribute("bno", board.getBno());
	  return "redirect:/main";
  }
    
  @GetMapping("remove")
  public String remove(BoardDTO board) {
	  service.remove(board);
	  return "redirect:/main";
  }
  
}
