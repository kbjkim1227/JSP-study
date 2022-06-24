-- ȸ������ ���̺� ����
create table member_tbl_02 (
  custno number(6),	-- ȸ�� ��ȣ
  custname varchar2(20),	-- �̸�
  phone varchar2(13),	-- ����ó
  address varchar2(60),	-- �ּ�
  joindate date,		-- �����
  grade char(1), city char(2),	-- ���, ������
  primary key(custno)	-- �⺻Ű
);

	not null -- �ݵ�� �����͸� �Է��ϼ���.
	null -- 




-- ȸ������ ���̺� ���� ������ �߰�
create sequence member_seq
start with 10001
increment by 1
minvalue 10001
cache 10;

-- ȸ�� ���� �߰�
insert into member_tbl_02 values(10001, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '20151202', 'A', '01');
insert into member_tbl_02 values(10002, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '20151206', 'B', '01');
insert into member_tbl_02 values(10003, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '20151001', 'B', '30');
insert into member_tbl_02 values(10004, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '20151113', 'A', '30');
insert into member_tbl_02 values(10005, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '20151225', 'B', '60');
insert into hyun.member_tbl_02 values(10006, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151211', 'C', '60') ;

select * from member_tbl_02;

delete from MEMBER_TBL_02 where custno = 10047;

-- ȸ�� ���� ���� ����
create table money_tbl_02 (
  custno number(6),    -- ����ȣ
  salenol number(8),   -- �ǸŹ�ȣ
  pcost number(8),     -- �ܰ�
  amount number(4),    -- ����
  price number(8),     -- ����
  pcode varchar2(4),   -- ��ǰ�ڵ�
  sdate date,          -- �Ǹ�����
  primary key(custno, salenol));  --�⺻Ű
  
  
-- ���� ���� �߰�
insert into hyun.money_tbl_02 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl_02 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl_02 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl_02 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl_02 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl_02 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl_02 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl_02 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select * from money_tbl_02;


-- ���� ������ ȸ�� ���� JOIN
SELECT mb.custno, mb.custname, mb.grade, sum(mn.price) as total 
FROM member_tbl_02 mb 
JOIN money_tbl_02 mn on mb.custno = mn.custno 
group by (mb.custno, mb.custname, mb.grade) 
order by total desc;


---- ������� ----
1.���̺�(ȸ������, ��������)����
2.ȸ�� ���� �߰�/����/��ȸ ���
3.ȸ������ ������ ����
4.���� ���� ��ȸ
5.ȸ������ + �������� ���� ���


-- ���� �ؾ� �� ���α׷� ��� --------
1.DBConnection.jsp
2.header.jsp -- ���
3.buttom.jsp -- �ϴ�
4.css
5.index.jsp -- ȸ������ ���/�߰�
6.action.jsp -- ȸ������ �߰���� �� ���� ����
7.list.jsp -- ȸ������ ��� ����
8.money.jsp --�������� ����
9.update.jsp -- ȸ�� ���� ����






  