CLASS zcl_07_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result_i TYPE i.
    DATA result_p TYPE p LENGTH 8 DECIMALS 3.

    "Mathematische Operationen
    result_i = 5 + 3.
    out->write( result_i ).


    result_i = 5 - 3.
    out->write( result_i ).


    result_i = 5 * 3.
    out->write( result_i ).


    result_i = 5 / 3.
    out->write( result_i ). "ABAP macht hier Typumwandlung, rundet auf bei Ganzzahl


*Hier mit Gleitkommazahl
    result_p = 5 / 3.
    out->write( result_p ).

    result_i = 5 DIV 3.
    out->write( result_i ). "Ganzzahl


    result_i = 5 MOD 3.
    out->write( result_i ). "Rest bei divison, modulo


    result_i = 5 ** 3.
    out->write( result_i ). "Potenzieren 5^3



*Inkrementieren/Dekrementieren
    result_i = result_i + 1.
    result_i += 1.
    ADD 1 TO result_i. "ältere Variante
    out->write( result_i ).


    " Numerische Funktionen
    result_i = sqrt( 81 ).
    out->write( result_i ).

    out->write( round( val = '47.895' dec = 2 ) ). "runden; Schlüsselwortparameter, name legt fest


  ENDMETHOD.
ENDCLASS.
