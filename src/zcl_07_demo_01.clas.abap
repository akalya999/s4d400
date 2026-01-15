CLASS zcl_07_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main. " Start/Endschlüsselwörter, statt { }

**********************************************************************
* Hello World
**********************************************************************

    DATA text TYPE string. " Deklaration

    text = 'Hello World'.  " Wertzuweisung, Groß/Kleinschreibung egal

* Ausgabe
    out->write( text ). " Anweisungsende mit ., nach ( und vor ) MUSS Leerzeichen sein


**********************************************************************
*Datentypen und Datenobjekte
**********************************************************************

  DATA age TYPE i. "Ganze Zahlen
  DATA salary_in_euro TYPE p length 16 decimals 2. "p = Kommazahlen
  DATA first_name type c length 40. "c = Zeichenketten fester Länge
  DATA matriculation_number TYPE n length 7. " n = Ziffernfolge
  DATA xmas TYPE d. " Datumsangaben
  DATA noon type t. " Zeitangaben
  DATA flag. " Kennzeichen, character length 1, entweder wert x oder nichts

  DATA carrier_id type c length 3. " ABAP Standardtyp
  data carrier_id2 TYPE /dmo/carrier_id. " Datenelement; BESSER, da META-daten dabei, techn. gesehen beide char length 3


**********************************************************************
*Wertzuweisungen
**********************************************************************

    " Zuweisungsoperator (=)
    age = 44.
    salary_in_euro = '6000.52'. "Kommazahl in Zeichenkette konvertieren
    first_name = 'Daniel'.
    matriculation_number = '9182643'.
    xmas = '20261225'. " jahr, monat, tag
    noon = '120000'. " stunde, minute, sekunde
    flag = 'X'.

    "Initialisierung
    age = 0.
    flag = ' '.
    flag = ''.
    clear flag. "löscht aktuellen inhalt und setzt den zurück auf initialwert. bei zahlen = 0, bei zeichen= leerzeichen

    "Statische Vorbelegung
    DATA last_name TYPE c LENGTH 40 VALUE 'Appenmaier'.

    "Inlinedeklaration
    DATA(size_in_cm) = 179. "implizit datentyp festgelegt, hier darf KEIN Leerzeichen sein
    size_in_cm = '179'. "explizit datentyp festgelegt, hier darf Leerzeichen sein


**********************************************************************
*Zuweisungen mittels ASSIGN
**********************************************************************




  ENDMETHOD.

ENDCLASS.

* allgemein wichtige shortcuts: F1, F2
" abap cleaner als plug in?  für formatierung gut, einheitlich im team –> mit command+4

