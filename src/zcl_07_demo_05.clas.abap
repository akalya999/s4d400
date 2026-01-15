CLASS zcl_07_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(result) = zcl_07_calculator=>divide( operand1 = 5
                                                  operand2 = 3 ). " statische methoden =>, normale methoden ->

        out->write( result ).
      CATCH cx_sy_zerodivide INTO DATA(x).
        out->write( x->get_text( ) ). " LEERZEICHEN bei ( )

    ENDTRY.

    DATA(percentage_value) = zcl_07_calculator=>calculate_percentage( percentage = 20
                                                                      base       = 100 ).
    out->write( percentage_value ).

  ENDMETHOD.
ENDCLASS.
