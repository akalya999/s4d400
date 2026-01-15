CLASS zcl_07_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(d) = zcl_07_helper=>get_travels( '200' ).
      CATCH zcx_abap_no_data.
    ENDTRY.

    DELETE d WHERE begin_date < sy-datlo.

    FIELD-SYMBOLS <a> TYPE /dmo/travel.
    LOOP AT d ASSIGNING <a>.
      <a>-booking_fee = <a>-booking_fee * 110 / 100." *= '1.1'
    ENDLOOP.

    SORT d BY description DESCENDING.

    out->write( d ).
  ENDMETHOD.
ENDCLASS.
