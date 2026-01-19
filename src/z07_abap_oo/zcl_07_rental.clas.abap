CLASS zcl_07_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    interfaces zif_07_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_07_vehicle. " tabellentyp anlegen

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_07_vehicle.
ENDCLASS.



CLASS zcl_07_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_07_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.
