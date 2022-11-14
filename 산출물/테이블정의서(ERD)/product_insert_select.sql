--category insert
desc category;
insert into category values (1,'브레드');
insert into category values (2,'케이크');
insert into category values (3,'샌드위치');
insert into category values(4, 'BEST3');

--product insert
desc product;
insert into product values (product_p_no_SEQ.nextval,'추억의 소시지빵',2200,'1.jpg','짭조름한 소시지와 옥수수 마요 토핑의 거부할 수 없는 단짠 매력!',0,1);
insert into product values (product_p_no_SEQ.nextval,'슈크림빵',1600,'2.jpg','폭신한 빵 속에 달콤하고 부드러운 노란빛의 슈크림이 가득!',0,1);
insert into product values (product_p_no_SEQ.nextval,'초코소라빵',1400,'3.jpg','정성을 다하여 구워낸 왕 소라빵 속에 초코크림이 가득 든 간식빵!',0,1);
insert into product values (product_p_no_SEQ.nextval,'치츠듬뿍 어니언',3400,'4.jpg','큼지막한 빵에 양파와 치즈가 가득 들어 함께 먹기 좋은 조리빵',0,1);
insert into product values (product_p_no_SEQ.nextval,'모닝토스트',2600,'5.jpg','겹겹이 살아 숨쉬는 부드럽고 촉촉한 페스츄리 속살!',0,1);
insert into product values (product_p_no_SEQ.nextval,'구름크림빵',2100,'6.jpg','구름모양의 빵에 달콤한 초코크림과 화이트크림을 넣은 맛있는 빵',0,1);
insert into product values (product_p_no_SEQ.nextval,'클래식 시나몬롤',3300,'7.jpg','심플하고 기본에 충실한 깊은 맛의 시나몬롤!',0,1);
insert into product values (product_p_no_SEQ.nextval,'치즈파니니',1800,'8.jpg','베사멜 소스와 짭쪼름한 햄이 중독성 있는 치즈파니니',0,1);
insert into product values (product_p_no_SEQ.nextval,'핵불닭소시지빵',3800,'9.jpg','소시지, 닭고기, 치즈와 함께 불닭 본연의 매운 맛을 담은 화끈한 불닭빵',0,1);
insert into product values (product_p_no_SEQ.nextval,'고구마가달구마',2300,'10.jpg','콕콕 박혀있는 달콤한 고구마와 쫄깃한 빵의 최적의 조화, 남녀노소 좋아하는 우리 가족 간식빵',0,1);

insert into product values (product_p_no_SEQ.nextval,'해피스마일',21000,'11.jpg','보고만 있어도 미소가 지어지는 사랑스러운 디자인',0,2);
insert into product values (product_p_no_SEQ.nextval,'클래식 모카케이크',19000,'12.jpg','따뜻한 모카라떼를 닮은 디자인의 촉촉한 모카스폰지에 향긋한 모카크림을 샌드한 클래식 모카케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'러브러브초코',18000,'13.jpg','초코스폰지에 초코크림이 어우러진 달콤한 초코케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'클래식 벨지안 화이트 초코',22000,'14.jpg','화이트스폰지에 화이트크림이 어우러진 달콤한 케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'고구마반생크림반케이크',25000,'15.jpg','달콤한 고구마케이크와 상큼한 딸기생크림케이크가 어우러진 반반케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'마카롱초코링 케이크',23000,'16.jpg','‘미니마카롱이 초코케이크 속으로 퐁당!',0,2);
insert into product values (product_p_no_SEQ.nextval,'카카오앤딸기 레이어 케이크',25000,'17.jpg','딸기 다이스가 씹히는 딸기크림으로 상큼함을 더한 딸기케이크!',0,2);
insert into product values (product_p_no_SEQ.nextval,'러블리 스윗하트',21000,'18.jpg','초코스폰지에 초코크림이 어우러진 달콤한 하트초코케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'마스카포네 티라미수',18000,'19.jpg','이탈리아의 커피향 디저트 중 하나로 부드러운 케이크',0,2);
insert into product values (product_p_no_SEQ.nextval,'블레싱 레드베리',22000,'20.jpg','딸기 스폰지와 콤포트, 생딸기가 어우러진 풍성하고 화려한 딸기 생크림 케이크',0,2);

insert into product values (product_p_no_SEQ.nextval,'스윗모닝 콘스프토스트',3800,'21.jpg','진하고 고소한 콘스프를 촉촉한 식빵 위에 한가득 담아내어 부드러운 빵',0,3);
insert into product values (product_p_no_SEQ.nextval,'치킨롤샌드위치',5600,'22.jpg','다 먹어도 325kcal, 다이어터들의 한 끼 식사 대용으로 딱!',0,3);
insert into product values (product_p_no_SEQ.nextval,'톡톡콘치즈 핫도그',4800,'23.jpg','한 입 베어 물면 소시지의 육즙이 팡팡, 달콤한 옥수수가 톡톡!',0,3);
insert into product values (product_p_no_SEQ.nextval,'연유듬뿍 프렌치토스트',3500,'24.jpg','부드러운 식빵 사이에 고소한 땅콩잼과 상큼한 딸기잼을 바르고, 연유를 듬뿍 뿌려 달달한 프렌치 토스트',0,3);
insert into product values (product_p_no_SEQ.nextval,'미니버거 샌드위치',4300,'25.jpg','간편하게 즐기는 미니 사이즈 버거',0,3);

insert into product values (product_p_no_SEQ.nextval,'추억의 소시지빵',2200,'1.jpg','짭조름한 소시지와 옥수수 마요 토핑의 거부할 수 없는 단짠 매력!',0,4);
insert into product values (product_p_no_SEQ.nextval,'핵불닭소시지빵',3800,'9.jpg','소시지, 닭고기, 치즈와 함께 불닭 본연의 매운 맛을 담은 화끈한 불닭빵',0,4);
insert into product values (product_p_no_SEQ.nextval,'톡톡콘치즈 핫도그',4800,'23.jpg','한 입 베어 물면 소시지의 육즙이 팡팡, 달콤한 옥수수가 톡톡!',0,4);

--카테고리별 리스트 select
select * from product where category_no=1;

--전체리스트 select
select * from product;

desc product;
--product update    
update product set p_name='톡톡 콘치즈 핫도그',p_price=4300, p_desc='한 입 베어 물면 소시지의 육즙이 팡팡, 달콤한 옥수수가 톡톡!' where p_no=23;

--product delete
delete from product where p_no=25;
