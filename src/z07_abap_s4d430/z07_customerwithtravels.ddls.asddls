@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercise 7'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z07_CustomerWithTravels as select from Z07_Customer

association [0..*] to Z07_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
key CustomerId,
  FirstName,
  LastName,
  Title,
  Street,
  PostalCode,
  City,
  CountryCode,
  
  /* Associations */
      _Travels

  
}

where CountryCode = 'DE'
