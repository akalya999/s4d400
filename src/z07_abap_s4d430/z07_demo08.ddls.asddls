@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 8: Associations'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z07_Demo08
  as select from /dmo/connection // alias name 

  association [1..1] to /dmo/carrier as _Carrier // beziehung, connection zu flug/carrier: 1:1; left outer join = association to
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights // beliebig viele flüge von connection aus
    on  _Flights.carrier_id    = $projection.CarrierId
    and _Flights.connection_id = $projection.ConnectionId // muss beides angegeben werden

{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      
      /* Associatoins = joins on demand */
      _Carrier,
      _Flights
}
//wenn associations definiert, nicht in derselben view benutzbar
