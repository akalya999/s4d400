@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIs'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z07_CustomerKPIs
  as select from Z07_TravelWithCustomer

{
  key CustomerId,

      CustomerName,
      Street,
      PostalCode,
      City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice) + sum(BookingFee) as TotalRevenue,

      CurrencyCode,

      avg(Duration as abap.dec(16,0))   as AverageDuration,

      count(distinct AgencyId)          as NumberOfDifferentAgencys
}

group by CustomerId,
         CurrencyCode,
         CustomerName,
         Street,
         PostalCode,
         City

having sum(TotalPrice + BookingFee) >= 5000
