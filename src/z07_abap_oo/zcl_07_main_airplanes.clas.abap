CLASS zcl_07_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_07_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA airplane  TYPE REF TO zcl_07_airplane.
*    DATA airplanes TYPE TABLE OF REF TO zcl_07_airplane.
    DATA carrier    TYPE REF TO zcl_07_carrier.


    " Instanziierung
    out->write( zcl_07_airplane=>number_of_airplanes ).
    carrier = new #( 'Lufthansa' ).

    TRY.
        airplane = NEW zcl_07_passenger_plane( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weight_in_tons = 277
                          number_of_seats      = 800 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_07_cargo_plane( id                   = 'D-AIND'
                                           plane_type           = 'Airbus A320-200'
                                           empty_weight_in_tons = 42
                                           cargo_in_tons        = 40 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_07_passenger_plane( id                   = 'D-AJKF'
                                               plane_type           = 'Boeing 747-400F'
                                               empty_weight_in_tons = 166
                                               number_of_seats      = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    out->write( zcl_07_airplane=>number_of_airplanes ).

    " Ausgabe
    LOOP AT carrier->airplanes INTO airplane.
*      out->write( |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons }t, (Total weight: { airplane->get_total_weight_in_tons( ) }t)| ).
      out->write( airplane->to_string( ) ).
    ENDLOOP.

    out->write( carrier->get_biggest_cargo_plane( ) ).
  ENDMETHOD.
ENDCLASS.
