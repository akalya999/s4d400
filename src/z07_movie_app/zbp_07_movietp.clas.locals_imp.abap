CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineRatingDate.

    METHODS DetermineUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserName.

ENDCLASS.


CLASS lhc_rating IMPLEMENTATION.
  METHOD DetermineRatingDate.
    DATA ratings TYPE TABLE FOR UPDATE zr_07_ratingTp.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky       = key-%tky
                      RatingDate = sy-datlo ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF zr_07_movieTp IN LOCAL MODE
           ENTITY rating
           UPDATE
           FIELDS ( RatingDate )
           WITH ratings.
  ENDMETHOD.

  METHOD DetermineUserName.
    DATA ratings TYPE TABLE FOR UPDATE zr_07_ratingTp.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky     = key-%tky
                      UserName = sy-uname ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF zr_07_movieTp IN LOCAL MODE
           ENTITY rating
           UPDATE
           FIELDS ( UserName )
           WITH ratings.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.

ENDCLASS.


CLASS lhc_Movie IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.
    DATA movies TYPE TABLE FOR READ RESULT ZR_07_MovieTP.

    " Read Movies

    READ ENTITIES OF ZR_07_MovieTP IN LOCAL MODE
         ENTITY Movie
         FIELDS ( Genre ) " das was wir validieren wollen, hier rein
         WITH CORRESPONDING #( keys )
         RESULT movies. " ODER RESULT DATA(movies) // hier wird interne tabelle movies gefüllt

    " Process Movies
    LOOP AT movies INTO DATA(movie).

      " Validate Genre and Create Error Message
      SELECT SINGLE
        FROM ddcds_customer_domain_value( p_domain_name = 'ZABAP_GENRE' )
        FIELDS @abap_true
        WHERE value_low = @movie-Genre
        INTO @DATA(exists).

      IF exists = abap_false. " IF exists IS INITIAL " IF exists = ''.
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>no_genre_found " welche nachricht soll angezeigt werden
                                            genre    = movie-Genre " platzhalter füllen
                                            severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
