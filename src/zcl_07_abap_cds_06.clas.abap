CLASS zcl_07_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_abap_cds_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  SELECT FROM Z07_CustomerKPIs( P_City = 'Schifferstadt' )
      FIELDS *
      INTO TABLE @DATA(customers).

      SORT customers by totalrevenue DESCENDING.

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
