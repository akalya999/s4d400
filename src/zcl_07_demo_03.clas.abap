CLASS zcl_07_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Einfache Verzweigungen
    DATA age        TYPE i           VALUE 18.
    DATA gender     TYPE c LENGTH 1  VALUE 'm'. " DATA gender
    DATA first_name TYPE c LENGTH 40 VALUE 'Hans'.
    DATA last_name  TYPE c LENGTH 40 VALUE 'Maier'.

    " Vergleichsoperatoren: >, >=, <, <=, =, <>
    " Logische Operatoren: AND, OR, NOT
    " variable + IS (NOT) INITIAL: ob da initiale wert variable steht; numerisch: 0 & zeichenkette: leerzeichen
    IF age < 18.
      out->write( |Hallo { first_name }| ).

    ELSEIF gender = 'm' OR gender = 'M'.
      out->write( |Hallo Herr { last_name }| ).

    ELSEIF gender = 'w' OR gender = 'W'.
      out->write( |Hallo Frau { last_name }| ).
    ELSE.
      out->write( |Hallo { last_name }| ).
    ENDIF.

    out->write( |Hallo { COND #( WHEN age < 18                     THEN first_name
                                 WHEN gender = 'm' OR gender = 'M' THEN |Herr { last_name }|
                                 WHEN gender = 'w' OR gender = 'W' THEN |Frau { last_name }|
                                 ELSE                                   last_name ) }| ).

    IF age IS INITIAL. " IF age = 0.
      out->write( |kein Alter angeben| ).
    ENDIF.

    " Fallunterscheidungen
    CASE gender.
      WHEN 'm' OR 'M'.
        out->write( |Hallo Herr { last_name }| ).

      WHEN 'w' OR 'W'.
        out->write( |Hallo Frau { last_name }| ).

      WHEN OTHERS.
        out->write( |Hallo { last_name }| ).
    ENDCASE.

    out->write( |Hallo { SWITCH #( gender
                                   WHEN 'm' OR 'M' THEN |Herr  { last_name  } |
                                   WHEN 'w' OR 'W' THEN |Frau  { last_name } |
                                   ELSE                 last_name ) }| ).
  ENDMETHOD.

ENDCLASS.
