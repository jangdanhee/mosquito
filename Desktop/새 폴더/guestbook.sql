-- ============================================================
-- 광주광역시 홍보 사이트 - 방명록(Guestbook) 테이블
-- MySQL 기준 CREATE TABLE 문
-- ============================================================

CREATE TABLE guestbook (
    id          INT             NOT NULL    AUTO_INCREMENT          COMMENT '방명록 고유 식별자 (기본키, 자동 증가)',
    author_name VARCHAR(30)     NOT NULL    COMMENT '방문자 이름 (닉네임/실명, 최대 30자)',
    message     TEXT            NOT NULL    COMMENT '방명록 메시지 본문 (길이 제한 없음)',
    created_at  TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '작성 시간 (레코드 생성 시 자동 저장)',
    PRIMARY KEY (id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci
  COMMENT='광주광역시 홍보 사이트 방명록';

-- ============================================================
-- 컬럼 역할 요약
-- ------------------------------------------------------------
-- 1. id
--    - 기본키(PK)로 방명록 글을 고유하게 식별
--    - AUTO_INCREMENT로 새 글이 등록될 때마다 1씩 자동 증가
--    - NOT NULL 보장
--
-- 2. author_name
--    - 방문자가 입력한 작성자 이름 저장
--    - VARCHAR(30): 통상적인 닉네임/이름 길이에 적합
--    - NOT NULL: 작성자 없는 글은 허용하지 않음
--
-- 3. message
--    - 방명록 메시지 본문
--    - TEXT 타입으로 긴 메시지도 저장 가능
--    - NOT NULL: 빈 메시지 등록 방지
--
-- 4. created_at
--    - 글 작성(레코드 INSERT) 시간 자동 저장
--    - DEFAULT CURRENT_TIMESTAMP로 별도 입력 없이 자동 기록
--    - 방명록 시간순 정렬(최신순/오래된순)에 활용
-- ============================================================

-- ============================================================
-- 참고: 최신순 정렬 조회 쿼리
-- ============================================================
-- SELECT id, author_name, message, created_at
-- FROM guestbook
-- ORDER BY created_at DESC;
