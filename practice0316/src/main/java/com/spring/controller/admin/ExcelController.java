package com.spring.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.memberDTO;
import com.spring.service.ExcelServiceImpl;

@Controller
public class ExcelController {
	
	@Autowired
	ExcelServiceImpl service;

	@RequestMapping("/free/excelDown")
	public void excelDownload(HttpServletResponse response, memberDTO dto) throws IOException {
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("freeBoard");
		
		List<memberDTO> list = service.getmemberList(dto);
		
		// 첫 행에 열 이름 표기
		Row row = sheet.createRow(0);
		String[] headers = {
			"번호", "아이디", "이름", "비밀번호", "주민번호1", "주민번호2", 
			"우편번호", "주소1", "주소2", "이메일","이메일2", "휴대폰번호", 
			"회원유무", "등록일", "수정일"
		};
		
		int cellCount = 0;
		for (String header : headers) {
			Cell cell = row.createCell(cellCount++);
			cell.setCellValue(header);
		}
		
		// 데이터 추가
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			memberDTO member = list.get(i);
			cellCount = 0;
			
			Cell cell = row.createCell(cellCount++);
			cell.setCellValue(member.getIdx());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getId());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getName());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getPassword());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getJumin1());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getJumin2());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getPostcode());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getAddr1());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getAddr2());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getEmail1());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getEmail2());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getPhone());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getUseYN());
			cell = row.createCell(cellCount++);
			cell.setCellValue(member.getRegdate());
			cell = row.createCell(cellCount);
			cell.setCellValue(member.getUpdatedate());
		}
		
		// 컨텐츠 타입 및 파일 이름 설정
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=member.xlsx");
		
		// Excel 파일을 response의 OutputStream으로 작성
		wb.write(response.getOutputStream());
	}
}
