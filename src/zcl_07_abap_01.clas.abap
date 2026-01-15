CLASS zcl_07_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



  DATA first_name type c length 40.
  DATA last_name type c length 40.
  DATA full_name type c length 40.

  first_name = 'Bruce'.
  last_name = 'Wayne'.

*  out->write( 'Hello' && | | && first_name && | | && last_name && ', how are you?' ). "ABAP verschluckt Leerzeichen, '' oder '  ' dasselbe

   out->write( |Hello { first_name } { last_name }, how are you? | ).

  ENDMETHOD.

ENDCLASS.
