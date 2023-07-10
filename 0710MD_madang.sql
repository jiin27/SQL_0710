/* 마당 서점 예제 3번째 */
select * from customer;

/*Q1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름 */

select b.publisher from customer c, orders o, book b where c.custid=o.custid and o.bookid=b.bookid and c.name = '박지성';

select c.name from customer c, orders o, book b 
        where c.custid=o.custid 
        and o.bookid=b.bookid 
        and c.name not like '박지성'
        and publisher in 
        (select b.publisher from customer c, orders o, book b 
                where c.custid=o.custid and o.bookid=b.bookid 
                and name like '박지성');
                
                
/*Q2. 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름 */
select distinct c.name from customer c, orders o, book b
    where c.custid=o.custid
    and o.bookid=b.bookid
    and publisher in (select distinct b.publisher from customer c, orders o, book b where  c.custid=o.custid
    and o.bookid=b.bookid); /* --> 오류. 박지성, 김연아, 장미란 이 나와야 함.*/
    
    