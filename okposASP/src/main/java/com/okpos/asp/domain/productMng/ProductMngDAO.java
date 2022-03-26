package com.okpos.asp.domain.productMng;

import java.time.LocalDate;
import java.util.List;

// 제품과 관련된 DAO : 상품관리, 주문서 관리, 입출고 관리
public interface ProductMngDAO {
	// 상품조회
	public abstract List<ProductDTO> selectAllProductByCode(String code); // prod_code

	// 상품등록
	public abstract int insertProduct(ProductDTO prodDt);
	
	// 상품수정
	public abstract int updateProduct(String memId, String code);
	
	// 상품삭제 : 상품코드 기반
	public abstract int deleteProduct(String memId, String code);
	
	// posOrder(주문서) select
	public abstract List<OrderDTO> selectAllPosorderByMemId(String memId); // mem_id
	public abstract List<OrderDTO> selectAllPosorderById(int id); // posOrder_id
	
	// posOrder(주문서) 반품수량 수정
	public abstract int updatePosorderForReturnNum(int id, int returnNum);  // posOrder_id
	
	// 입고조회
	public abstract List<GetproductDTO> selectGetprodById(int id); // get_id
	
	// 입고등록
	public abstract int insertGetprod(GetproductDTO getDto);
	
	// 입고수정
	public abstract int updateGetprod(int id, LocalDate date, int num, String vendor); // get_id
	
	// 입고삭제
	public abstract int deleteGetprod(int id); // get_id
	
	// 출고조회
	public abstract List<OutproductDTO> selectOutprodById(int id); // out_id
	
	// 출고등록
	public abstract int insertOutprod(OutproductDTO outDto);
	
	// 출고수정
	public abstract int updateOutprod(int id, LocalDate date, int num, String client);
	
	// 출고삭제
	public abstract int deleteOutprod(int id); // out_id
	
	// 매출분석 : 특정 사용자의 매출일별 매출액
	public abstract List<SaleAnalysisDTO> selectSaleAnalysisRegdateBymemId(String memId); // mem_id

	// 특정 사용자의 보유 상품 조회
	public abstract List<SaleAnalysisDTO> selectCodeNameBymemId(String memId); // mem_id
	
	// 매출분석 : 특정 사용자의 상품코드별 매출액
	public abstract List<SaleAnalysisDTO> selectSaleAnalysisCodeBymemId(String memId); // mem_id
	
	// 매출분석 : 특정 사용자의 요일별 매출액
	public abstract List<SaleAnalysisDTO> selectSaleAnalysisWeekBymemId(String memId); // mem_id	
	
	// 매출분석 : 특정 사용자의 월별 매출액
	public abstract List<SaleAnalysisDTO> selectSaleAnalysisMonthBymemId(String memId); // mem_id	
}
