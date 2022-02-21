package org.kdy.controller;

import java.util.ArrayList;

import org.kdy.domain.ReplyDTO;
import org.kdy.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("replies")
public class ReplyController {
    
    @Autowired
    private ReplyService rService;

    @PostMapping(value="new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyDTO rDto) {
       int result = rService.write(rDto);
       return result==1?new ResponseEntity<>("success",HttpStatus.OK)
                   :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @GetMapping(value="main/{bno}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<ArrayList<ReplyDTO>> getList(@PathVariable int bno) {
       return new ResponseEntity<>(rService.list(bno),HttpStatus.OK);
    }
    
    @GetMapping(value="{rno}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<ReplyDTO> getReply(@PathVariable int rno){
       return new ResponseEntity<>(rService.modify(rno), HttpStatus.OK);
    }
    
    @PutMapping(value="update", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> update(@RequestBody ReplyDTO rDto) {
       int result = rService.update(rDto);
       return result==1?new ResponseEntity<>("success", HttpStatus.OK)
                   :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @DeleteMapping(value="remove", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@RequestBody ReplyDTO rDto) {
       int result = rService.remove(rDto);
       return result==1?new ResponseEntity<>("success", HttpStatus.OK)
                   :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
