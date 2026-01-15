CLASS zcl_07_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA operand1 TYPE p LENGTH 8 DECIMALS 2 VALUE 5.
  DATA operand2 TYPE p LENGTH 8 DECIMALS 2 VALUE 3.
  DATA operator TYPE c LENGTH 1 VALUE '/'.
  DATA result TYPE p LENGTH 8 DECIMALS 2.

  CASE operator.
    WHEN '+'.
      result = operand1 + operand2.

    WHEN '-'.
    result = operand1 - operand2.


    WHEN '*'.
      result = operand1 * operand2.


    WHEN '/'.
      result = operand1 / operand2.

    WHEN OTHERS.

   ENDCASE.

   out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

   result = SWITCH #( operator
   when '+' then operand1 + operand2
   when '-' then operand1 - operand2
   when '*' then operand1 * operand2
   when '/' then operand1 / operand2
   ).
   out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

   out->write( |{ sy-datlo }|  ).

  ENDMETHOD.
ENDCLASS.
