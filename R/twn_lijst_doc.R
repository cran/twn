# TWN-lijst ---------------------------------------------------------------

#' Taxa Waterbeheer Nederland (TWN)
#' 
#' De TWN-lijst bevat de standaardlijst met namen van taxa zoals deze worden gebruikt binnen het 
#' Nederlandse waterbeheer. Deze dataset bevat de complete TWN-lijst zoals deze aangeboden wordt 
#' op [https://twnlist.aquadesk.nl/](https://twnlist.aquadesk.nl/). 
#' 
#' @format 
#' 
#' Dataframe met 12 kolommen
#' 
#'- `taxontype`  - Het type taxon bijv Macrophytes
#'- `taxonname`  - Naam van het taxon
#'- `author`     - Auteur die het taxon beschreven heeft
#'- `taxongroup` - Taxonomische groep binnen het taxon
#'- `taxonlevel` - Het taxonomische niveau van het taxon - geordende factor.
#'- `parentname` - Naam van het ouder taxon
#'- `refername`  - Voorkeursnaam - alleen voor taxa met status 20
#'- `literature` - Literatuurverwijzing naar de beschrijving van het taxon
#'- `localname`  - Nederlandse naam indien beschikbaar
#'- `date`       - Datum van toevoegen aan of wijzigen in TWN
#'- `status`     - Statuscode van het taxon. 
#'    - `10` - Voorkeursnaam
#'    - `20` - Synoniem
#'    - `30` - Dubieus taxonconcept
#'    - `80` - Niet-taxonomische soortgroep
#'    - `91` - TWN-fout - Niet gebruiken
#'    - `92` - Verandering van interpretatie - Niet gebruiken
#' 
#' @note De centrale TWN-lijst wordt regelmatig van updates voorzien. Deze TWN-lijst kan daarom enigszins 
#' verouderd zijn. De datum van de gebruikte TWN-lijst is opgeslagen in het attribuut 
#' `datum_twn_lijst` en kan worden opgevraagd met de code `attr(twn_lijst, "datum_twn_lijst")`.
#' 
#' De auteursnamen bevatten veel non-ASCII-tekens. Deze zijn geconverteerd naar het format uxxxx. 
#' De originele tekens kunnen verkregen worden met de functie `stringi::stri_unescape_unicode()`
#' 
#' De volgorde van de taxonlevels is op detailniveau (met name lager dan genus) soms enigszins arbitrair. 
#' Is een Cultivar bijv. een hoger niveau dan een Subspecies? Toch is er voor gekozen om de taxonlevels 
#' op te nemen als een geordende factor omdat dit nuttig kan zijn o.a. bij het filteren van de lijst.
#' 
#' 
#' 
#' @source 
#' [https://twnlist.aquadesk.nl/](https://twnlist.aquadesk.nl/)
#' 
#'
#' @examples 
#' 
#' head(twn_lijst)
#' 
#' # de datum van de gebruikte TWN-lijst.
#' attr(twn_lijst, "datum_twn_lijst")
"twn_lijst"


# TWN-statuscodes -------------------------------------------------------------

#' TWN statuscodes
#' 
#' De TWN-lijst heeft aan ieder taxon een statuscode toegekend. De betekenis van deze codes is opgenomen in 
#' de tabel `twn_statuscodes`
#' 
#' @format 
#' 
#' Dataframe met 2 kolommen
#' 
#'- `status`  - TWN-statuscode
#'- `omschrijving`- Omschrijving van de betekenis van de statuscode
#' 
#' @source 
#' [https://www.aquo.nl/index.php/Vraag_en_Antwoord_TWN](https://www.aquo.nl/index.php/Vraag_en_Antwoord_TWN)
#'
#' @examples 
#' 
#' twn_statuscodes
#' 
"twn_statuscodes"


# TWN-literatuurlijst -----------------------------------------------------

#' TWN literatuurlijst
#' 
#' In de TWN-lijst worden de referenties naar de literatuur gegeven in codes. In deze lijst zijn alle
#' TWN-literatuurreferenties opgenomen.
#' 
#' 
#' @format 
#' 
#' Dataframe met 3 kolommen
#' 
#'- `literature`       - Literatuurcode conform de `twn_lijst`
#'- `short_reference`  - Korte literatuurreferentie
#'- `full_reference`   - Volledige literatuurreferentie
#'
#' @note De centrale TWN-literatuurlijst wordt regelmatig van updates voorzien. Deze 
#' TWN-literatuurlijst kan daarom enigszins verouderd zijn. De datum van de gebruikte 
#' TWN-literatuurlijst is opgeslagen in het attribuut `datum_twn_literatuur` en kan 
#' worden opgevraagd met de code `attr(twn_literatuur, "datum_twn_literatuur")`.
#'
#' @source 
#' [https://twnlist.aquadesk.nl/](https://twnlist.aquadesk.nl/)
#'
#' @examples 
#' 
#' head(twn_literatuur)
#' 
#' # de datum van de gebruikte TWN-literatuurlijst.
#' attr(twn_literatuur, "datum_twn_literatuur")
#'
#'
"twn_literatuur"


# TWN-taxonlevels -------------------------------------------------------------

#' TWN taxonlevels
#' 
#' De TWN-lijst heeft aan ieder taxon een taxonlevel toegekend. `twn_taxonlevels` is een
#' geordende factor met alle beschikbare taxonlevels.
#' 
#' @format 
#' 
#' Geordende factor
#' 
#'
#' @examples 
#' 
#' twn_taxonlevels
#' 
"twn_taxonlevels"