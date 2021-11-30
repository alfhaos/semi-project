--------------------------------------------------------------------
-- 회원
--------------------------------------------------------------------


create table kola_member (
    member_id varchar2 (15),
    password varchar2(300) not null, -- 암호화처리
    member_name varchar2(100) not null,
    member_role char(1) default'U' not null, -- 회원권한 : 일반사용자(U), 관리자(A)
    gender char(1),
    language varchar2(20) not null,      -- 관심언어
    email varchar2(100),
    phone char(11) not null,
    address varchar2(300),
    enroll_date date default sysdate,
    constraint pk_member_id primary key (member_id),
    constraint ck_member_role check(member_role in ('U','A')),
    constraint ck_member_language check(language in('c','c++','java','javaScript','Python','Spring'))
);
-- 회원이 속한 스터디 그룹 표시
commit;
select * from kola_member;
insert into kola_member values('admin','1234','관리자','A','M','c',null,'01012341234',null,null);


--------------------------------------------------------------------
-- 게시글
--------------------------------------------------------------------
create table kola_main_board(
    no number,                              -- 게시글 번호
    title varchar2(100) not null,     -- 제목
    writer varchar2(20),                -- 작성자
    content varchar2(4000) not null,    -- 내용
    read_count number default 0,        -- 조회수
    like_count number default 0,        -- 좋아요
    reg_date date default sysdate,      -- 작성일
    area varchar2(200),                      -- 지역
    language varchar2(100) not null, -- 언어 선택
    max_member number,                      -- 최대 인원
    now_member number,                      -- 현재인원
    recruitment_status char(1) default 'O',             -- 모집 상태
    constraint pk_board_no primary key (no),
    constraint fk_board_writer foreign key(writer) references member(member_id) on delete set null,
    constraint ck_offline_board_status check(recruitment_status in ('O','X'))  
);
insert into kola_main_board(no,title,writer,content,read_count,like_count,reg_date,area,language,max_member,now_member, recruitment_status) values (kola_seq_main_board_no.nextval,'안녕하세요, 게시판입니다 - 1','honggd','반갑습니다',0,0,to_date('18/02/10','RR/MM/DD'),'서울','c++',10,7,'O');

create sequence kola_seq_main_board_no;

commit;
select * from kola_main_board;

select 
    *
from (
    select 
        row_number() over(order by no desc) rnum,
        b.*,
        (select count(*) from kola_board_comment where board_no = b.no) comment_count
    from 
        kola_main_board b
)
where
    rnum between 1 and 10;

--------------------------------------------------------------------
-- 게시판 댓글
--------------------------------------------------------------------

create table kola_board_comment(
    no number,
    comment_level number default 1,
    writer varchar2(15),
    content varchar2(2000),
    board_no number,
    comment_ref number,
    reg_date date default sysdate,
    constraint pk_kola_board_comment_no primary key(no),
    constraint fk_kola_board_comment_writer foreign key(writer) references kola_member(member_id) on delete set null,
    constraint fk_kola_board_comment_board_no foreign key(board_no) references kola_main_board(no) on delete cascade,
    constraint fk_kola_board_comment_comment_ref foreign key(comment_ref) references kola_board_comment(no) on delete cascade
);

create sequence seq_free_board_comment_no;

select * from kola_board_comment;

-- 게시글 테이블마다 다 따로 생성해야 하는지 물어보기


--------------------------------------------------------------------
-- 커뮤니티
--------------------------------------------------------------------

create table community_board(
    no number,                          -- 게시글번호
    title varchar2(100) not null,   -- 제목
    writer varchar2(20),            --작성자
    content varchar2(4000) not null,    --내용
    read_count number default 0,    -- 조회수
    reg_date date default sysdate,
    ask char(1) default 'X',                            -- 질문 해결여부
    constraint pk_board_no primary key (no),
    constraint fk_board_writer foreign key(writer) references member(member_id) on delete set null,
    constraint ck_community_board_ask check(recruitment_status in ('O','X'))  
 
);

create sequence seq_community_board_no;





--------------------------------------------------------------------
-- 스터디그룹
--------------------------------------------------------------------

create table study_group(
    group_no number,          -- 그룹 번호
    group_name varchar2(100) not null,         -- 그룹 이름
    reg_date date default sysdate,          -- 생성날짜
    max_member number,                      -- 최대 인원
    now_member number,                      -- 현재인원
    language varchar2(100) not null,  -- 언어 선택
    
    constraint pk_study_group primary key (no)

);

create sequence seq_study_group_no;

create table study_group_member(
    group_member_no number,             -- 그룹번호
    group_member_id varchar2 (15),      -- 멤버아이디
    group_member_name varchar2(100) not null,   -- 멤버 이름
    group_member_study_time  time,              -- 공부시간
    group_member_role char(1) not null,
    constraint pk_group_member_id primary key (group_member_id),
    constraint fk_study_group_member_id foreign key(group_member_id) references member(member_id) on delete set null,
    constraint fk_group_member_no foreign key( group_member_no) references study_group(group_no) on delete cascade,
    constraint ck_group_member_role check( group_member_role in ('U','A'))

);
create sequence seq_study_group_member_no;


create table study_group_board(
    group_board_no number,             -- 게시글 번호
    group_no number,                    -- 그룹 번호
    title varchar2(100) not null,     -- 제목
    writer varchar2(20),                -- 작성자
    content varchar2(4000) not null,    -- 내용
    read_count number default 0,        -- 조회수
    reg_date date default sysdate,      -- 작성일
    
    constraint pk_group_board_no primary key (no),
    constraint fk_board_writer foreign key(writer) references study_group_member(group_member_id) on delete set null,
    constraint fk_group_no foreign key(group_no) references study_group(group_no) on delete set null 

);







--------------------------------------------------------------------
-- 첨부파일
--------------------------------------------------------------------
create table study_group_attachment(
    no number,
    board_no number not null,
    original_filename varchar2(255) not null,
    renamed_filename varchar2(255) not null,
    reg_date date default sysdate,
    constraint pk_attachment_no primary key(no),
    constraint fk_attachment_board_no foreign key(board_no) references study_group_board(group_board_no) on delete cascade

);

select * from KOLA_MEMBER;
select * from kola_member where member_id = 'delete';
select * from kola_member where member_id = 'delete';
commit;
SELECT * FROM tabs;










