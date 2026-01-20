@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 5: Aggregation Functions'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z07_Demo05
  as select from /dmo/flight

{
  key carrier_id                                          as CarrierId,

      count(*)                                            as NumberOfFLight, // nur Anzahl der Flüge wiedergegeben
      count(distinct plane_type_id)                       as NumberOfDifferentPlaneTypeIds, // alle Duplikate weg, zählt nur die unt. Flugzeugtypen
      max(seats_occupied)                                 as MaxOccupiedSeats,
      min(seats_occupied)                                 as MinOccupiedSeats,
      sum(seats_occupied)                                 as TotalOccupiedSeats,

      sum(case when seats_occupied / seats_max > 0.85 then 1
           else 0 end)                                    as NumberOfMostlyBookedUpFlights,

      sum(case when seats_occupied = 0 then 1 else 0 end) as NumberOfEmptyFlights,

      avg(seats_occupied as abap.dec(16,1))               as AverageOccupiedSeats,

      @Semantics.amount.currencyCode: 'CurrencyCode' //wenn annotation dann, hinzufügen currencycode
      avg(price as abap.curr(16,2))                       as AverageFlightPrice,

      currency_code                                       as CurrencyCode
}

/*Alle die neu hinzugefügt werden, dann hier, sonst ERROR */

group by carrier_id,
         currency_code
having avg(price as abap.curr(16,2)) < 5000 //statt where, weil where sich auf die Datenbanktabelle bezieht, nicht auf das ergebnis dieser aggr. fkt
