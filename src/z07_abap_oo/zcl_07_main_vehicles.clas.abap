CLASS zcl_07_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_07_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Deklarationen
    DATA vehicle  TYPE REF TO zcl_07_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_07_vehicle. " liste mit nur eine spalte (bas. liste)


    " Instanziierungen
    out->write( zcl_07_vehicle=>number_of_vehicles ).

    vehicle = NEW #( make = 'Porsche' model = '911' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make = 'MAN' model = 'TGX' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make =  'Skoda' model = 'Superb Combi' ).
    APPEND vehicle TO vehicles.

    out->write( zcl_07_vehicle=>number_of_vehicles ).

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 10 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_07_value_too_high into data(x).
          out->write( x->get_text( ) ).

      ENDTRY.
      out->write( |{ vehicle->make } { vehicle->model } ({ vehicle->speed_in_kmh }km/h)| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
