CLASS zcl_07_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     data carrier_id type /dmo/carrier_id VALUE 'LH'.
     data connection_id type /dmo/connection_id VALUE '0400'.
     DATA connection TYPE /dmo/connection.
     DATA connections type TABLE of /dmo/connection.
     DATA connection3 type z07_connection.

    "SELECT [Spalten] FROM [Datenbankquelle] WHERE [Bedingung]

    "Lesen von Einzelsätzen


    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.


    out->write( connection ).

    "Lesen mehrerer Datensätze (per Array Fetch)
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections. "Zielvariable Tabelle

    out->write( connections ).

    "Lesen mehrerer Datensätze (per SELECT-Schleife)
    CLEAR connections."löschen
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection. " Zielvariable Struktur
      APPEND connection TO connections. " einzelne datensätze in tabelle rein
    ENDSELECT.

    out->write( connections ).


    " Definition der Zielvariable (Option 1: Inlinedeklaration)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    out->write( connection2 ).


    " Definition der Zielvariable (Option 2: Angabe passender Felder)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection3.

    out->write( connection3 ).

    " Definition der Zielvariable (Option 3: Kopieren namensgleicher Fekder)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).



    " Defintion von Tabellen-Joins
    SELECT FROM /dmo/connection
      inner join /dmo/carrier on /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS /dmo/connection~carrier_id, /dmo/connection~connection_id, /dmo/carrier~name
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).

  " Datenbankänderungen
  connection-connection_id = '6666'.

  insert /dmo/connection from @connection.

  connection-distance = 1.
  connection-distance_unit = 'KM'.
  update /dmo/connection from @connection.

  connection-connection_id = '0402'.
  delete /dmo/connection from @connection.


  ENDMETHOD.
ENDCLASS.
