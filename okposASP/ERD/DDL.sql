-- error code 3730 : drop을 자식부터 하지 않을 때 생기는 오류
-- 자식
DROP TABLE IF EXISTS `sysBoard` CASCADE;
DROP TABLE IF EXISTS `bookBoard` CASCADE;
DROP TABLE IF EXISTS `docBoard` CASCADE;
DROP TABLE IF EXISTS `store` CASCADE;
DROP TABLE IF EXISTS `posOrder` CASCADE;
DROP TABLE IF EXISTS `producMng` CASCADE;
DROP TABLE IF EXISTS `getProduct` CASCADE;
DROP TABLE IF EXISTS `outProduct` CASCADE;
-- 부모
DROP TABLE IF EXISTS `storeMember` CASCADE; -- posMember 자식
DROP TABLE IF EXISTS `posMember` CASCADE;
DROP TABLE IF EXISTS `product` CASCADE;

-- 회원 테이블
-- mem_auth : 0(총관리자), 1(가맹점 관리자), 2(단일 매장 관리자)
CREATE TABLE posMember(
	mem_id varchar(100) PRIMARY KEY COMMENT '아이디',
	mem_pw varchar(100) NOT NULL COMMENT '비밀번호',
	mem_auth int NOT NULL CHECK(mem_auth IN (0, 1, 2)) COMMENT '권한',
	mem_storeNum char(12) NOT NULL UNIQUE CHECK(mem_storeNum REGEXP('^[0-9]{3}-[0-9]{2}-[0-9]{5}$')) COMMENT '사업자번호',
	mem_regdate datetime NOT NULL DEFAULT now() COMMENT '가입일'
);

-- 매장별회원 테이블
CREATE TABLE storeMember(
	storeMem_uid varchar(100) PRIMARY KEY COMMENT '회원 아이디',
	mem_id varchar(100) NOT NULL COMMENT '매장주인',
	storeMem_regdate datetime NOT NULL DEFAULT now() COMMENT '가입일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 보유상품 테이블
CREATE TABLE product(
	prod_code varchar(10) PRIMARY KEY COMMENT '상품코드',
	prod_name varchar(30) NOT NULL COMMENT '상품명',
	prod_money int NOT NULL COMMENT '금액',
	prod_num int NOT NULL COMMENT '재고'
);

-- 시스템 전용 게시판 테이블
CREATE TABLE sysBoard(
	sysb_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '아이디',
	sysb_title varchar(100) NOT NULL COMMENT '제목',
	sysb_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 1층 회의실 예약 게시판 테이블
CREATE TABLE bookBoard(
	bkb_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '아이디',
	bkb_title varchar(100) NOT NULL COMMENT '제목',
	bkb_startDate datetime NOT NULL COMMENT '시작일',
	bkb_endDate datetime NOT NULL COMMENT '종료일',
	bkb_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 문서자료실 테이블
CREATE TABLE docBoard(
	docb_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '아이디',
	docb_title varchar(100) NOT NULL COMMENT '제목',
	docb_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 매장정보 테이블
-- store_type : 0(일반), 1(외식), 2(유통), 3(의류), 4(기타)
CREATE TABLE store(
	mem_id varchar(100) NOT NULL COMMENT '매장주인',
	store_name varchar(30) NOT NULL COMMENT '매장이름',
	store_type int NOT NULL DEFAULT '4' CHECK(store_type IN (0, 4)) COMMENT '매장구분',
	store_openTime time COMMENT '개점',
	store_closeTime time COMMENT '폐점',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 주문서 테이블
CREATE TABLE posOrder(
	posOrder_id int AUTO_INCREMENT PRIMARY KEY COMMENT '주문번호',
	mem_id varchar(100) NOT NULL COMMENT '판매자 아이디',
	storeMem_uid varchar(100) NOT NULL COMMENT '주문자 아이디',
	prod_code varchar(10) NOT NULL COMMENT '상품코드',
	posOrder_num int NOT NULL DEFAULT '1' COMMENT '주문수량',
	posOrder_regdate datetime NOT NULL COMMENT '주문일',
	posOrder_returnNum int DEFAULT '0' COMMENT '반품수량',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE,
	FOREIGN KEY(storeMem_uid) REFERENCES storeMember(storeMem_uid) ON DELETE CASCADE,
	FOREIGN KEY(prod_code) REFERENCES product(prod_code) ON DELETE CASCADE
);

-- 상품관리 테이블
-- pmng_checkOut : true(출고확정), false(출고보류)
-- pmng_checkGet : true(입고확정), false(입고미확정)
CREATE TABLE producMng (
	pmng_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '판매자 아이디',
	prod_code varchar(10) NOT NULL COMMENT '상품코드',
	pmng_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	pmng_checkOut boolean DEFAULT false COMMENT '출고결정',
	pmng_checkGet boolean DEFAULT false COMMENT '입고결정',
	pmng_mngCom varchar(30) COMMENT '관리업체명',
	pmng_mngComTel varchar(15) CHECK(pmng_mngComTel REGEXP('^[0-9]{2,3}-[0-9]{3,5}-[0-9]{3,5}$')) COMMENT '관리업체전화번호',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE,
	FOREIGN KEY(prod_code) REFERENCES product(prod_code) ON DELETE CASCADE
);

-- 입고 테이블
CREATE TABLE getProduct (
	get_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '입고 신청자',
	get_date date NOT NULL COMMENT '입고일',
	get_num int NOT NULL COMMENT '입고수량',
	get_vendor varchar(10) NOT NULL COMMENT '입고거래처',
	get_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- 출고 테이블
CREATE TABLE outProduct (
	out_id int AUTO_INCREMENT PRIMARY KEY COMMENT '일련번호',
	mem_id varchar(100) NOT NULL COMMENT '출고 신청자',
	out_date date NOT NULL COMMENT '출고일',
	out_num int NOT NULL COMMENT '출고수량',
	out_client varchar(10) NOT NULL COMMENT '출고거래처',
	out_regdate datetime NOT NULL DEFAULT now() COMMENT '등록일',
	FOREIGN KEY(mem_id) REFERENCES posMember(mem_id) ON DELETE CASCADE
);

-- sysdate() vs now() : 함수 실행시간 vs 쿼리 실행시간
-- (MySQL에서 —sysdate-is-now 옵션(default false)을 true로 바꿔주면 두 함수가 동일하게 작동)
-- 회원 생성
insert into posmember values('root', '{noop}1234', 0, '123-45-67890', sysdate());
insert into posmember values('manager', '{noop}1234', 1, '111-22-33333', sysdate());
insert into posmember values('user', '{noop}1234', 2, '333-22-55555', sysdate());

-- 매장별회원 생성
insert into storeMember values('customer1', 'user', sysdate());
insert into storeMember values('customer2', 'user', sysdate());

-- 시스템 전용 게시판 : 게시물 생성
insert into sysBoard values(1, 'root', '[OKPos Classic (NetPOS) - 구형MSR,단말기연동버전] 2015-03-12 설치파일 입니다.(NOCVM 적용)', now());
insert into sysBoard values(2, 'root', '[OKPos – KTC 인증버전] 2015-03-12 설치 버전 입니다. (NoCVM 적용)', now());
insert into sysBoard values(3, 'root', '[OKPos Classic (NetPOS) - 구형MSR,단말기연동버전] 2019-07-24 설치파일 입니다.(NOCVM 적용)', now());
insert into sysBoard values(4, 'root', '[OKPos – KTC 인증버전] 2016-06-26 설치 버전 입니다. (NoCVM 적용)', now());
insert into sysBoard values(5, 'root', '[OKPos Classic (NetPOS) - 구형MSR,단말기연동버전] 2019-07-24 설치파일 입니다.(NOCVM 적용)', now());
insert into sysBoard values(6, 'root', '[OKPos – KTC 인증버전] 2019-07-24 설치 버전 입니다. (NoCVM 적용)', now());

-- 1층 회의실 예약 게시판 : 게시물 생성
insert into bookBoard values(1, 'manager', '보안테스트3', DATE_SUB(sysdate(), INTERVAL 1 year), DATE_SUB(sysdate(), INTERVAL 1 YEAR), now());
insert into bookBoard values(2, 'manager', '마케팅기획실', DATE_SUB(sysdate(), INTERVAL 10 month), DATE_SUB(sysdate(), INTERVAL 10 month), now());
insert into bookBoard values(3, 'manager', '보안테스트2', DATE_ADD(sysdate(), INTERVAL -9 month), DATE_ADD(sysdate(), INTERVAL -9 month), now());
insert into bookBoard values(4, 'manager', '보안테스트1', DATE_ADD(sysdate(), INTERVAL -2 hour), DATE_ADD(sysdate(), INTERVAL -1 YEAR), now());
insert into bookBoard values(5, 'manager', '영업관리실', DATE_ADD(sysdate(), INTERVAL -30 minute), DATE_ADD(sysdate(), INTERVAL -20 MINUTE), now());
insert into bookBoard values(6, 'manager', '서비스개발실', sysdate(), DATE_ADD(sysdate(), INTERVAL 1 HOUR), now());

-- 문서자료실 게시판 : 게시물 생성
insert into docBoard values(1, 'root', '오케이포스(OKPOS), 사용자 편의에 최적화된 무인주문기(KIOSK) 서비스 제공', sysdate());
insert into docBoard values(2, 'root', '[메뉴얼] NF-2100S 사용자 매뉴얼', sysdate());
insert into docBoard values(3, 'manager', '[기타] [발주서] POS, KIOSK, 부가장비, S/W 발주서 양식', sysdate());
insert into docBoard values(4, 'root', '[드라이버] I,Z,ZED-POS(J1900)TXE DRIVER_WINDOWS 10 32Bit', sysdate());
insert into docBoard values(5, 'root', 'Optimus 사용자 매뉴얼', sysdate());
insert into docBoard values(6, 'root', 'KIS-BTPR 제품안내서', sysdate());

SELECT * FROM posmember ORDER BY mem_regdate DESC;