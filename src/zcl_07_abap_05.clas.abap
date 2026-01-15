CLASS zcl_07_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA customer TYPE z07_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( '701' ).
        " out->write( customer ).

        out->write( |Customer ID: { customer-customer_id }| ).
        out->write( |Name: { customer-first_name } { customer-last_name }| ).
        out->write( |City: { customer-city }| ).
        out->write( |Country: { customer-country_code }| ).

      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).

    ENDTRY.
  ENDMETHOD.

ENDCLASS.
