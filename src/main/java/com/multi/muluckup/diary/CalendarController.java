package com.multi.muluckup.diary;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RestController//data만 반환할때 주로사용? 
@RequestMapping("/diary")
public class CalendarController {
	
	@Autowired
	CalendarDAO dao; 
	
	@PostMapping("/insert")
	@ResponseBody
	public void insert(@RequestBody calendarVO bag) {
		System.out.println(bag);
		dao.insert(bag);
		calendarVO calendarVO = new calendarVO();
		System.out.println("새로 생성된 calendar_id: " + bag.getCalendar_id());
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody calendarVO bag) {
		System.out.println(bag);
		int calendar_id = bag.getCalendar_id();
		dao.delete(bag);
	}

	@PostMapping("/update")
	@ResponseBody
	public void update(@RequestBody calendarVO bag) {
		System.out.println(bag);
		int calendar_id = bag.getCalendar_id();
		dao.update(bag);
	}
	
	@PostMapping("/list")
	@ResponseBody
	public List<calendarVO> list() {
	    List<calendarVO> list = dao.list();
	    return list;
	}
}
