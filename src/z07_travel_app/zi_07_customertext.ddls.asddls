@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Textelement for Customer'

define view entity ZI_07_CustomerText
  as select from /dmo/customer
  

{
  key customer_id           as CustomerId,

      first_name            as FirstName,
      last_name             as LastName,
      title                 as Title,
      
      
      @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      case when title is initial then concat_with_space(first_name, last_name, 1)
           else concat_with_space(concat_with_space(title, first_name, 1), last_name, 1)
           end as CustomerName
}
