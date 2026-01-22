@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Search.searchable: true

@Metadata.allowExtensions: true

define root view entity ZC_07_MovieTP
  as projection on ZR_07_MovieTP
 
{
  key MovieUuid,
  
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      
      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Transcient Data */
      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality, 
      _GenreText.GenreText,
      
      /* Associations */
      _Ratings : redirected to composition child ZC_07_RatingTP
}
