CLASS zcl_07_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
    data(d) = ZCL_07_HELPER=>get_travel_with_customer( '99' ).
    CATCH zcx_abap_no_data.
    ENDTRY.

    out->write( |Travel ID: { d-travel_id }| ).
    out->write( |Start: { d-begin_date DATE = USER }| ).
    out->write( |End: { d-end_date DATE = USER }| ).
    out->write( |Description: { d-description }| ).
    out->write( |Customer Id: { d-customer_id }| ).
    out->write( |Name: { d-first_name } { d-last_name }| ).
    out->write( |City: { d-city }| ).
    out->write( |Country: { d-country_code }| ).

  ENDMETHOD.
ENDCLASS.
