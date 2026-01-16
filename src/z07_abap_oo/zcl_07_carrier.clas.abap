CLASS zcl_07_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA name TYPE string READ-ONLY.
  DATA airplanes TYPE z07_airplanes READ-ONLY .

  METHODS constructor IMPORTING name  TYPE string.

  METHODS add_airplane IMPORTING airplane TYPE REF TO zcl_07_airplane.

  METHODS get_biggest_cargo_plane RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_07_cargo_plane.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
     APPEND airplane to airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons type i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_07_cargo_plane
      AND airplane->get_total_weight_in_tons(  ) > max_cargo_in_tons. "nur für cargo_planes
          biggest_cargo_plane = cast #( airplane ).
          max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).
        ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
