CLASS zcl_07_vehicle DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate IMPORTING !value TYPE i raising zcx_07_value_too_high.
    METHODS brake      IMPORTING !value TYPE i raising zcx_07_value_too_high.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles type i READ-ONLY.
  PRIVATE SECTION.


ENDCLASS.


CLASS zcl_07_vehicle IMPLEMENTATION.

  METHOD accelerate.
    if speed_in_kmh + value > 300.
    raise exception new zcx_07_value_too_high( value = value ).
    endif.

    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    if value > speed_in_kmh.
      raise exception new zcx_07_value_too_high( value = value ).
    endif.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

ENDCLASS.
