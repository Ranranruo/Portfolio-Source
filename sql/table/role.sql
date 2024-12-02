-- 테이블 생성
BEGIN;
CREATE TABLE member (
	id 				 BIGSERIAL 	 PRIMARY KEY,
	username		 VARCHAR(12) NOT NULL,
	password		 VARCHAR(60) NOT NULL,
	displayname 	 VARCHAR(18) NOT NULL UNIQUE,
	join_date		 DATE		 NOT NULL DEFAULT CURRENT_DATE,
	flag			 BOOLEAN     NOT NULL DEFAULT TRUE,
	create_id		 BIGSERIAL	 NOT NULL,
	create_timestamp TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_id 		 BIGSERIAL   NOT NULL,
	update_timestamp TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 코멘트
COMMENT ON TABLE member IS '회원';
COMMENT ON COLUMN member.id IS '아이디';
COMMENT ON COLUMN member.username IS '이름';
COMMENT ON COLUMN member.password IS '비밀번호';
COMMENT ON COLUMN member.displayname IS '별명';
COMMENT ON COLUMN member.join_date IS '가입 일자';
COMMENT ON COLUMN member.flag IS '플래그';
COMMENT ON COLUMN member.create_id IS '등록 아이디';
COMMENT ON COLUMN member.create_timestamp IS '등록 일자';
COMMENT ON COLUMN member.update_id IS '수정 아이디';
COMMENT ON COLUMN member.update_timestamp IS '수정 일자';

-- 인덱스 네이밍
ALTER INDEX public.member_pkey RENAME TO member_id_primary_btree_index;
ALTER INDEX public.member_displayname_key RENAME TO member_username_unique_btree_index;

-- 클러스터 등록
CLUSTER member USING member_id_primary_btree_index;

-- 커밋
COMMIT;