package org.kdy.controller;

import org.kdy.domain.ReplyDTO;
import org.kdy.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class ReplyController {
    
    @Autowired
    private ReplyService rService;

    @PostMapping("/write")
    public void writeReplyPOST(ReplyDTO rDto) {
        rService.write(rDto);
    }
}
