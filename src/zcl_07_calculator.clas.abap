CLASS zcl_07_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING operand1      TYPE  z07_decimal
                operand2      TYPE  z07_decimal
      RETURNING VALUE(result) TYPE  z07_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING percentage       TYPE z07_decimal
                base             TYPE z07_decimal
      RETURNING VALUE(percentage_value) TYPE  z07_decimal.

  protected SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_calculator IMPLEMENTATION.
  METHOD divide.
  "Eingabeprüfung durch 0 teilen
    IF operand2 IS INITIAL. " IF operand2 = 0.
      RAISE EXCEPTION NEW cx_sy_zerodivide( ).
    ENDIF.

    result = operand1 / operand2.
*   RETURN operand1 / operand2. "geht auch so, aber kein großer unterschied
  ENDMETHOD.


  METHOD calculate_percentage.
    percentage_value = percentage * ( base / 100 ).


  ENDMETHOD.

ENDCLASS.
