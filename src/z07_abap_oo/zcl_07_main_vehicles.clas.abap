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
    DATA truck    TYPE REF TO zcl_07_truck.

    DATA rental   TYPE REF TO zcl_07_rental.
    DATA carrier  TYPE REF TO zcl_07_carrier.
    DATA partners TYPE TABLE OF REF TO zif_07_partner. " interne Tabelle/Liste, objekte von unterklassen: rental, carrier

    " Instanziierungen
    out->write( zcl_07_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_07_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Upcast, Widening: im klassendiagramm von unten nach oben
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_07_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_07_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.

    out->write( zcl_07_vehicle=>number_of_vehicles ).

    rental = NEW #( ).
    carrier = NEW #( 'Lufhansa' ).

    APPEND rental TO partners. " Upcast
    APPEND carrier TO partners. " Upcast

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 20 ).
          vehicle->accelerate( 100 ).

        CATCH zcx_07_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).

      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_07_truck. " wenn vehicle gleich truck
        truck = CAST #( vehicle ). " Downcast. das was in vehicle drin in truck kopieren, aber schwer, weil vehicle zb auch auto sein könnte
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                               THEN 'Der LKW hat sich in einen Autobot transformiert       '
                               ELSE 'Der Autobot hat sich wieder in einen LKW transformiert' )  }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie, entscheidet sich zur laufzeit: jedes fahrzeug hat diese methode
    ENDLOOP.

    LOOP AT partners INTO DATA(partner).
      out->write( partner->to_string( ) ). " (Dynamische) Polymorphie, je nachdem um welche referenz es sich handelt, untersch. implementierung

      IF partner IS INSTANCE OF zcl_07_carrier.
        carrier = CAST #( partner ). " Downcast
        out->write( carrier->get_biggest_cargo_plane( ) ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
