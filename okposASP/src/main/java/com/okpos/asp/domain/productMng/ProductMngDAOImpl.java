package com.okpos.asp.domain.productMng;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductMngDAOImpl implements ProductMngDAO {
	private ProductMngDAO mapper;
	
	@Autowired
	public ProductMngDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(ProductMngDAO.class);
	}

	@Override
	public List<ProductDTO> selectAllProductByCode(String code) {
		return mapper.selectAllProductByCode(code);
	}

	@Override
	public int insertProduct(ProductDTO prodDt) {
		return mapper.insertProduct(prodDt);
	}

	@Override
	public int updateProduct(String memId, String code) {
		return mapper.updateProduct(memId, code);
	}

	@Override
	public int deleteProduct(String memId, String code) {
		return mapper.deleteProduct(memId, code);
	}

	@Override
	public List<OrderDTO> selectAllPosorderByMemId(String memId) {
		return mapper.selectAllPosorderByMemId(memId);
	}

	@Override
	public List<OrderDTO> selectAllPosorderById(int id) {
		return mapper.selectAllPosorderById(id);
	}

	@Override
	public int updatePosorderForReturnNum(int id, int returnNum) {
		return mapper.updatePosorderForReturnNum(id, returnNum); // posOrder_id
	}

	@Override
	public List<GetproductDTO> selectGetprodById(int id) {
		return mapper.selectGetprodById(id);
	}

	@Override
	public int insertGetprod(GetproductDTO getDto) {
		return mapper.insertGetprod(getDto);
	}

	@Override
	public int updateGetprod(int id, LocalDate date, int num, String vendor) {
		return mapper.updateGetprod(id,date, num, vendor);
	}

	@Override
	public int deleteGetprod(int id) {
		return mapper.deleteGetprod(id);
	}

	@Override
	public List<OutproductDTO> selectOutprodById(int id) {
		return mapper.selectOutprodById(id);
	}

	@Override
	public int insertOutprod(OutproductDTO outDto) {
		return mapper.insertOutprod(outDto);
	}

	@Override
	public int updateOutprod(int id, LocalDate date, int num, String client) {
		return mapper.updateOutprod(id, date, num, client);
	}

	@Override
	public int deleteOutprod(int id) {
		return mapper.deleteOutprod(id);
	}

}
