CLASS zcl_07_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_07_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.
    DATA is_transformed TYPE c LENGTH 1 READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS transform.

    METHODS to_string REDEFINITION. "überschreiben von methoden

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_07_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
  string = super->to_string( ).
  string &&= |, Frachtkapazität: { cargo_in_tons }t|.
  ENDMETHOD.

  METHOD transform.
    if is_transformed = 'X'. " IF is transformed = abap.true.
      is_transformed = ''. " is_transformed = abap_false.
    else.
      is_transformed = 'X'.
    endif.
  ENDMETHOD.

ENDCLASS.
