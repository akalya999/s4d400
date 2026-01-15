CLASS zcl_07_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z07_travels
      RAISING   zcx_abap_no_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.

    DATA(travel) = zcl_abap_helper=>get_travel( travel_id ).
    DATA(customer) = zcl_abap_helper=>get_customer( travel-customer_id ).


    travel_with_customer = CORRESPONDING #( travel ).
    travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

  ENDMETHOD.

  METHOD get_travels.
*    travels = zcl_abap_helper=>get_travels( customer_id ).
    SELECT FROM /dmo/travel
    FIELDS *
    WHERE customer_id = @customer_id
    INTO TABLE @travels.

    IF sy-subrc <> 0. " IF lines( travels ) = 0. ODER IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( customer_id ) ).
    ENDIF.



  ENDMETHOD.

ENDCLASS.
