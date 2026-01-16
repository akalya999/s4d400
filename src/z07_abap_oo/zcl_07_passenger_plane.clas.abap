CLASS zcl_07_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_07_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                number_of_seats      TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons REDEFINITION.

    METHODS to_string                REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_07_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).

    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * ( 11 / 10 ) + number_of_seats * ( 8 / 100 ).
  ENDMETHOD.

  METHOD to_string.
    DATA(total_weight_in_tons) = get_total_weight_in_tons( ).
    string = super->to_string( ).
    string &&= : |, Sitzplätze: { number_of_seats }t)|.
  ENDMETHOD.
ENDCLASS.
