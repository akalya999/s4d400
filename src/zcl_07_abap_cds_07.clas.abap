CLASS zcl_07_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM z07_CustomerWithTravels
    FIELDS FirstName, LastName, \_Travels-Description, \_Travels-BeginDate
    Into table @data(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
