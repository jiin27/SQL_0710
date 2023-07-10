/* ���� ���� ���� 3��° */
select * from customer;

/*Q1. �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸� */

select b.publisher from customer c, orders o, book b where c.custid=o.custid and o.bookid=b.bookid and c.name = '������';

select c.name from customer c, orders o, book b 
        where c.custid=o.custid 
        and o.bookid=b.bookid 
        and c.name not like '������'
        and publisher in 
        (select b.publisher from customer c, orders o, book b 
                where c.custid=o.custid and o.bookid=b.bookid 
                and name like '������');
                
                
/*Q2. �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸� */
select distinct c.name from customer c, orders o, book b
    where c.custid=o.custid
    and o.bookid=b.bookid
    and publisher in (select distinct b.publisher from customer c, orders o, book b where  c.custid=o.custid
    and o.bookid=b.bookid); /* --> ����. ������, �迬��, ��̶� �� ���;� ��.*/
    
    