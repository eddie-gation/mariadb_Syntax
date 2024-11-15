-- mariadb 서버에 접속 u: user
mariadb -u root -p


-- mariadb의 문법
-- 스키마(database) 목록 조회
show databases;

-- 스키마(database) 생성 create ★
CREATE DATABASE board;

-- 스키마 삭제
drop databse board; 

-- 스키마 선택   ★★★★★★★★★ 어떤 스키마를 쓸거야?
use board;  --board라는 이름의 스키마를 쓸게

-- 테이블목록조회  
show tables;  -- 

-- 문자인코딩조회 utf8이 아니면, 한글 제대로 안됨.
show variables like 'character_set_server';

-- 문자인코딩 설정 변경
alter database board default character set utf8mb4;


-- ↓스키마 안에 들어와서 테이블 구조를 다루는 것. 역시 DDL

-- 테이블 생성/ 컬럼명, 타입(문자-길이, 숫자-범위 등), pk(유일한 키) ★★★★★★
create table author(id INT PRIMARY KEY, name VARCHAR(255), email varchar(255), password varchar(255));

-- 테이블 컬럼 조회 ★★★★★★★★★★★★★★★★★★★★v 테이블이 잘 만들어져 있나 컬럼들 보는거야, 컬럼들의 성격?볼수있음
describe <테이블명>;

-- 테이블 컬럼 상세조회
show full columns from author;

-- 테이블을 정해서 어떤 구조인지 한눈에 볼 수 있음★★★★★★★★★★★★★★★★★테이블 내에 필드 조작 가능
select * from <테이블명>

-- 테이블 생성명령문 조회 (테이블이 어떻게 생성되었는지 확인 가능, 어떤 컬럼들을 설정했는지, 그 컬럼의 타입은 어떠지 등등)
show create table author;


-- post 테이블 신규 생성(id, title, content, author_id)
create table post(id int primary key, title varchar(255), content varchar(255), author_id int, foreign key(author_id) references author(id));
--자 그러면 외래키 안에 null값이 올 수 있나? 그럼 ㅇ

create table post(id int primary key, title varchar(255), content varchar(255), author_id int not null, foreign key(author_id) references author(id));
-- not null이 되면 비울 수 없다.

-- 테이블 index(성능향상옵션) 조회
show index from author;

--alte문 : 테이블의 구조를 변경하는 것
-- 테이블의 이름변경
alter table post rename posts;

-- 테이블 컬럼추가 ★★★★★★★★★★★★★★★★
alter table author add column age int;

-- 테이블 컬럼삭제
alter table author drop column age;

-- 테이블 컬럼명변경: 바꾼다. 테이블 포스트, 컬럼을
alter table post change column content contents varchar(255);

-- 테이블의 컬럼 타입과 제약조건 변경(key바꾸거나, null을 not null로 바꾸거나)  ★★★★★★★★★★★★★★★★★
-- 덮어쓰기됨에 유의. 원하면 둘 다 해줘야함
alter table author modify column email varchar(100) not null; 



-- 실습 첫번째: author table에 address컬럼추가.varchar(255)
alter table author add column address varchar(255);
--실습: post table에 title은 not null로 변경, contents 3000자로 변경
alter table post modify title varchar(255) not null;
alter table post modify contents varchar(3000);

-- 테이블 삭제(ㅈㅏㄹ안씀) //
show create table post;
drop table post;
