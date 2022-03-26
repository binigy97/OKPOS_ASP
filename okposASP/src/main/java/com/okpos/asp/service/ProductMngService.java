
package com.okpos.asp.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okpos.asp.domain.productMng.ProductMngDAO;
import com.okpos.asp.domain.productMng.SaleAnalysisDTO;

@Service
public class ProductMngService {
	private ProductMngDAO prodDao;

	@Autowired
	public void setDao(ProductMngDAO prodDao) {
		this.prodDao = prodDao;
	}
	
	public List<SaleAnalysisDTO> selectSaleAnalysisRegdateBymemId(String memId) {
		List<SaleAnalysisDTO> dtoList = prodDao.selectSaleAnalysisRegdateBymemId(memId);
		int endIdx = dtoList.size() - 1;
		
		// 두 data 사이의 빈 날짜 채움
		for (int i = 1; i <= endIdx; i++) {
			LocalDate regdateRecent = dtoList.get(i - 1).getRegdate();
			LocalDate regdatePast = dtoList.get(i).getRegdate();
			
			long gap = ChronoUnit.DAYS.between(regdatePast, regdateRecent); // ChronoUnit 객체 : 특정 날짜의 차이를 구함 (Duration, Period 객체 생성X)
			
			if (gap > 1) {
				addRegdatePlusDays(i, gap - 1, regdatePast, dtoList);
			}
		}
		
		// 오늘과 마지막 data 사이의 빈 날짜 채움 (가져온 데이터의 마지막이 오늘이 되도록)
		// (이걸 두 data 사이 빈 날짜 채우기 앞에 두면, 해당 로직에서 검사할 게 너무 많아짐)
		LocalDate regdateIdx0 = dtoList.get(0).getRegdate();
		LocalDate today = LocalDate.now(); // ld : localDate
		
		if (!today.equals(regdateIdx0)) {
			long gap = ChronoUnit.DAYS.between(regdateIdx0, today);
			
			if (gap > 0) {
				addRegdatePlusDays(0, gap, regdateIdx0, dtoList);
			}
		}
		
		// 가져온 데이터 개수가 총 8개가 되도록 채움 (데이터의 맨 뒤에 이전날짜 삽입)
		if (dtoList.size() < 8) {
			int gap = 8 - dtoList.size();
			endIdx = dtoList.size() - 1; // 위 로직을 거치며 변경된 dtoList 크기 재반영
			LocalDate regdateLastIndex = dtoList.get(endIdx).getRegdate(); // yyyy-MM-dd
			
			for (int i = 1; i <= gap; i++) {
				LocalDate insertDate = regdateLastIndex.minusDays(i);
				int insertWeek = calWeek(insertDate);
				endIdx = dtoList.size();
				dtoList.add(endIdx, new SaleAnalysisDTO(insertDate, insertWeek, 0));
			}
		}
		
		return dtoList;
	}
	
	public List<SaleAnalysisDTO> selectSaleAnalysisCodeBymemId(String memId) {
		List<SaleAnalysisDTO> dtoList = prodDao.selectSaleAnalysisCodeBymemId(memId);
		List<SaleAnalysisDTO> prodList = prodDao.selectCodeNameBymemId(memId);
		int dtoListSize =  dtoList.size();
		int prodListSize =  prodList.size();
		
		// 누락 데이터 추가 -> 아래 로직에서 ArrayIndexOutOfBoundsException 예방
		if (dtoListSize != prodListSize) {
			int gap = prodListSize - dtoListSize;
			for (int i = 0; i < gap; i++) {
				dtoList.add(new SaleAnalysisDTO("데이터누락", "데이터누락", 0));
			}
		}
		
		// dtoList에 존재하지 않는 상품 정보를 prodList에서 가져오기
		for(int i = 0; i < prodListSize; i++) {
			String dtoCode = dtoList.get(i).getCode();
			String prodCode = prodList.get(i).getCode();
			if (dtoCode.equals(prodCode)) {
				continue;
			}
			dtoList.add(i, new SaleAnalysisDTO(prodCode, prodList.get(i).getName(), 0));
			dtoList.remove(prodListSize);
		}
		
		return dtoList;
	}
	
	public List<SaleAnalysisDTO> selectSaleAnalysisWeekBymemId(String memId) {
		List<SaleAnalysisDTO> dtoList = prodDao.selectSaleAnalysisWeekBymemId(memId);
		int endIdx = dtoList.size() - 1;
		
		// 두 data 사이의 빈 요일 채우기
		for (int i = 0; i < endIdx; i++) {
			int weekRecent = dtoList.get(i).getWeeks();
			int weekFuture = dtoList.get(i + 1).getWeeks();
			int gap = weekFuture - weekRecent;
			
			if (gap > 1) {
				for (int j = 1; j < gap; j++) {
					int insertWeeks = weekRecent + j;
					dtoList.add(i + j, new SaleAnalysisDTO(insertWeeks, 0));
				}
			}
		}
		
		// index0이 일요일이 되도록 데이터 채움 (맨 앞에 데이터 추가)
		int weekIdx0 = dtoList.get(0).getWeeks();
		if (weekIdx0 != 0) {
			for (int i = 1; i <= weekIdx0; i++) {
				int insertWeeks = weekIdx0 - i;
				dtoList.add(0, new SaleAnalysisDTO(insertWeeks, 0));
			}
		}
		
		// 맨 뒤의 빈 요일 채우기
		endIdx = dtoList.size() - 1;
		int weekLastIdx = dtoList.get(endIdx).getWeeks();
		int gap = 6 - weekLastIdx;
		
		if (gap > 1) {
			for (int i = 1; i <= gap; i++) {
				int insertWeeks = weekLastIdx + i;
				dtoList.add(new SaleAnalysisDTO(insertWeeks, 0));
			}
		}
		
		return dtoList;
	}
	
	public List<SaleAnalysisDTO> selectSaleAnalysisMonthBymemId(String memId) {
		List<SaleAnalysisDTO> dtoList = prodDao.selectSaleAnalysisMonthBymemId(memId);
		
		// 두 data 사이 빈 달 채움
		int endIdx = dtoList.size() - 1;
		for (int i = 0; i < endIdx; i++) {
			int month = Integer.parseInt(dtoList.get(i).getMonth());
			int monthNext = Integer.parseInt(dtoList.get(i + 1).getMonth());
			int gap = monthNext - month;
			
			if (gap > 1) {
				addMonthMinus(i + 1, gap, monthNext, dtoList);
			}
		}
		
		// index0을 01월이 되도록 데이터 채움
		String monthIdx0 = dtoList.get(0).getMonth();
		if (!monthIdx0.equals("01")) {
			int month = Integer.parseInt(monthIdx0);
			addMonthMinus(0, month, month, dtoList);
		}
		
		// 뒤쪽의 빈 data 채우기
		endIdx = dtoList.size() - 1;
		String monthLastIdx = dtoList.get(endIdx).getMonth();
		int month = Integer.parseInt(monthLastIdx);
		int gap = 12 - month;
		if (gap > 1) {
			for (int i = 1; i <= gap; i++) {
				int m = month + i;
				String insertMonth = parseStrMonth(m);
				dtoList.add(new SaleAnalysisDTO(insertMonth, 0));
			}
		}
		return dtoList;
	}
	
	// targetRegdate에 plusDays()한 값을 gap 개수만큼 insertIdxNum에 추가 (매출이 없어서 빈 데이터 채움)
	private void addRegdatePlusDays(int insertIdxNum, long gap, LocalDate targetRegdate, List<SaleAnalysisDTO> dtoList) {
		for (int i = 1; i <= gap; i++) {
			LocalDate insertDate = targetRegdate.plusDays(i);
			int insertWeek = calWeek(insertDate);
			dtoList.add(insertIdxNum, new SaleAnalysisDTO(insertDate, insertWeek, 0));
		}
	}
	
	// SaleAnalysisDTO의 setWeeks(int)를 이용하면 string(한글)으로 바꿀 수 있음
	private int calWeek(LocalDate targetDate) {
		DayOfWeek dayOfWeek = targetDate.getDayOfWeek();
		int week = dayOfWeek.getValue();
		
		if (week == 7) { // 일 : java.time - 7
			return 0; // 일 : mysql - 0
		}
		
		return week;
	}
	
	private String parseStrMonth(int month) {
		String insertMonth;
		if (month < 10) {
			insertMonth = "0" + month;
		} else {
			insertMonth = "" + month;
		}
		
		return insertMonth;
	}
	
	private void addMonthMinus(int insertIdx, int count, int month, List<SaleAnalysisDTO> dtoList) {
		for (int i = 1; i < count; i++) {
			int m = month - i;
			String insertMonth = parseStrMonth(m);
			dtoList.add(insertIdx, new SaleAnalysisDTO(insertMonth, 0));
		}
	}
	
}
