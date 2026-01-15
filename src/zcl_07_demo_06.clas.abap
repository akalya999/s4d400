CLASS zcl_07_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
          INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA connection type z07_connection.
  DATA flight type z07_flight.
  DATA flight_extended type z07_flight_extended.

  connection-carrier_id = 'LH'.
  connection-connection_id = '0400'.
  connection-airport_from_id = 'FRA'.
  connection-airport_to_id = 'JFK'.

  flight-carrier_id = 'LH'.
  flight-connection_id = '0400'.
  flight-flight_date = '20260113'.

  flight_extended = corresponding #( flight ).
  flight_extended = corresponding #( base ( flight_extended ) connection ). " corr: kopiert korrespondierend namensgleiche spalten in entsprechend richtige stelle ein, sonst nicht



  out->write( connection-airport_from_id ).
  out->write( connection-connection_id ).
  out->write( connection-airport_from_id ).
  out->write( connection-airport_to_id ).

  out->write( flight_extended )."alle auf einmal ausgegeben

  ENDMETHOD.

ENDCLASS.
