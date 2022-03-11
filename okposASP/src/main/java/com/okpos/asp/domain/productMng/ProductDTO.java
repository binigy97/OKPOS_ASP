package com.okpos.asp.domain.productMng;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private String code; // prod_code
	private String memId; // mem_id
	private String name; // prod_name
	private int money; // prod_moeny
	private int num; // prod_num
}
