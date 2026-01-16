CLASS zcl_07_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons RETURNING VALUE(total_weight_in_tons) TYPE i.

    METHODS to_string RETURNING VALUE(string) TYPE string.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_07_airplane IMPLEMENTATION.
  METHOD constructor.
    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'id' ).
    ENDIF.
    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'plane_type' ).
    ENDIF.
    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'empty_weight_in_tons' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.

    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 11 / 10.
  ENDMETHOD.

  METHOD to_string.
    string = |{ id }, { plane_type }, { empty_weight_in_tons }t, (Total weight: { get_total_weight_in_tons( ) }t|.
  ENDMETHOD.
ENDCLASS.
