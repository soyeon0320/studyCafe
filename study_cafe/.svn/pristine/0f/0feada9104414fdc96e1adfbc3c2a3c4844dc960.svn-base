INSERT INTO tb_store (
    store_code,
    STORE_NAME,
    STORE_SIZE, --고정값 : 300,400
    using_guide,
    STORE_STATUS,
    --addr_donm_code, addr_sigugun_code = select로 join
    ADDR_DONM_CODE,
    ADDR_SIGUGUN_CODE,
    store_total_seat, --고정값 : 60
    store_contract_status,
    store_addr,
    STORE_MAP_X,
	STORE_MAP_Y,
	STORE_SEAT_MAP
) VALUES (
    'testCode',
    '대흥점',
    '300*400',
    'abc',
    0,
    (SELECT *
	   FROM TB_STORE_ADDR B, TB_STORE A
	  WHERE B.ADDR_DONM_CODE = A.ADDR_DONM_CODE
	  ),
	 (SELECT *
	   from TB_STORE A, TB_STORE_ADDR B
	  WHERE A.ADDR_SIGUGUN_CODE = B.ADDR_SIGUGUN_CODE
	  ),
    60,
    0,
    '대흥동 500',
    , --지도에서 찍은 좌표 x
    , --지도에서 찍은 좌표 y
    '경상북도 고성시'
);