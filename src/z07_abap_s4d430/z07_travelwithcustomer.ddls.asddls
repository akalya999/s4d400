@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'


define view entity Z07_TravelWithCustomer
  as select from Z07_Customer as c

    inner join   Z07_Travel   as t on c.CustomerId = t.CustomerId //anhand Primärschlüssel der Datenquellen

{
  key t.TravelId,
  
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status,
      t.CustomerId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City
      
}

where c.CountryCode = 'DE'
