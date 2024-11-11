## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----create-data, include = FALSE---------------------------------------------
opname <- tibble::tribble(
                                                     ~taxa, ~bedekkingspercentage,
                         "Caltha palustris ssp. palustris",                    2,
                                  "Ceratophyllum demersum",                   10,
                                            "Chara aspera",                    3,
                                         "Chara connivens",                    5,
                                        "Cirsium palustre",                    1,
                                         "Glyceria maxima",                   15,
                                "Hydrocharis morsus ranae",                    3,
                                             "Lemna minor",                   10,
                                          "Lemna trisulca",                    1,
                    "Myosotis scorpioides ssp scorpioides",                    1,
                        "Scirpus lacustris ssp. lacustris",                    2,
                                      "Stratiotes aloides",                   10,
                                    "Symphytum officinale",                    1,
                                           "Urtica dioica",                    2,
                                    "Utricularia vulgaris",                    2,
                                         "Wolffia arrhiza",                    2,
                                      "Wolffia columbiana",                    5,
                                  "Zannichellia palustris",                    1,
                    )


maatlat_taxa <- tibble::tribble(
                         ~Groep,                          ~Biotaxon.naam,              ~Biotaxon.naam_bron, ~KRWwatertype.code, ~Categorie,
                 "Waterplanten",                      "Alisma gramineum",               "Alisma gramineum",               "M8",         2L,
                 "Waterplanten",                   "Azolla filiculoides",            "Azolla filiculoides",               "M8",         5L,
                 "Waterplanten",               "Baldellia ranunculoides",        "Baldellia ranunculoides",               "M8",         1L,
                 "Waterplanten",                           "Callitriche",                    "Callitriche",               "M8",         3L,
                 "Waterplanten",                    "Callitriche brutia",             "Callitriche brutia",               "M8",         3L,
                 "Waterplanten",           "Callitriche hermaphroditica",    "Callitriche hermaphroditica",               "M8",         3L,
                 "Waterplanten",               "Callitriche obtusangula",        "Callitriche obtusangula",               "M8",         2L,
                 "Waterplanten",                "Callitriche platycarpa",         "Callitriche platycarpa",               "M8",         2L,
                 "Waterplanten",                "Ceratophyllum demersum",         "Ceratophyllum demersum",               "M8",         4L,
                 "Waterplanten",               "Ceratophyllum submersum",        "Ceratophyllum submersum",               "M8",         3L,
                 "Waterplanten",                                 "Chara",                          "Chara",               "M8",         2L,
                 "Waterplanten",                          "Chara aspera",                   "Chara aspera",               "M8",         1L,
                 "Waterplanten",                      "Chara globularis",               "Chara globularis",               "M8",         2L,
                 "Waterplanten",                         "Chara hispida",                  "Chara hispida",               "M8",         1L,
                 "Waterplanten",                        "Chara vulgaris",                 "Chara vulgaris",               "M8",         2L,
                 "Waterplanten",                 "Eleocharis acicularis",          "Eleocharis acicularis",               "M8",         3L,
                 "Waterplanten",                    "Eleogiton fluitans",             "Eleogiton fluitans",               "M8",         1L,
                 "Waterplanten",                     "Elodea canadensis",              "Elodea canadensis",               "M8",         3L,
                 "Waterplanten",                      "Elodea nuttallii",               "Elodea nuttallii",               "M8",         4L,
                 "Waterplanten",                  "Equisetum fluviatile",           "Equisetum fluviatile",               "M8",         2L,
                 "Waterplanten",               "Fontinalis antipyretica",        "Fontinalis antipyretica",               "M8",         2L,
                 "Waterplanten",                     "Groenlandia densa",              "Groenlandia densa",               "M8",         2L,
                 "Waterplanten",                    "Hottonia palustris",             "Hottonia palustris",               "M8",         2L,
                 "Waterplanten",              "Hydrocharis morsus-ranae",       "Hydrocharis morsus-ranae",               "M8",         5L,
                 "Waterplanten",                           "Lemna gibba",                    "Lemna gibba",               "M8",         5L,
                 "Waterplanten",                           "Lemna minor",                    "Lemna minor",               "M8",         5L,
                 "Waterplanten",                          "Lemna minuta",                   "Lemna minuta",               "M8",         5L,
                 "Waterplanten",                        "Lemna trisulca",                 "Lemna trisulca",               "M8",         4L,
                 "Waterplanten",                     "Lemna turionifera",              "Lemna turionifera",               "M8",         5L,
                 "Waterplanten",                 "Myriophyllum spicatum",          "Myriophyllum spicatum",               "M8",         4L,
                 "Waterplanten",            "Myriophyllum verticillatum",     "Myriophyllum verticillatum",               "M8",         1L,
                 "Waterplanten",                          "Najas marina",                   "Najas marina",               "M8",         1L,
                 "Waterplanten",                               "Nitella",                        "Nitella",               "M8",         1L,
                 "Waterplanten",                      "Nitella flexilis",               "Nitella flexilis",               "M8",         2L,
                 "Waterplanten",                       "Nitella hyalina",                "Nitella hyalina",               "M8",         1L,
                 "Waterplanten",                     "Nitella mucronata",              "Nitella mucronata",               "M8",         1L,
                 "Waterplanten",                         "Nitella opaca",                  "Nitella opaca",               "M8",         1L,
                 "Waterplanten",                    "Nitellopsis obtusa",             "Nitellopsis obtusa",               "M8",         1L,
                 "Waterplanten",                          "Nuphar lutea",                   "Nuphar lutea",               "M8",         3L,
                 "Waterplanten",                         "Nymphaea alba",                  "Nymphaea alba",               "M8",         3L,
                 "Waterplanten",                    "Nymphoides peltata",             "Nymphoides peltata",               "M8",         2L,
                 "Waterplanten",                   "Persicaria amphibia",            "Persicaria amphibia",               "M8",         4L,
                 "Waterplanten",               "Potamogeton acutifolius",        "Potamogeton acutifolius",               "M8",         2L,
                 "Waterplanten",                "Potamogeton compressus",         "Potamogeton compressus",               "M8",         2L,
                 "Waterplanten",                   "Potamogeton crispus",            "Potamogeton crispus",               "M8",         3L,
                 "Waterplanten",                    "Potamogeton lucens",             "Potamogeton lucens",               "M8",         1L,
                 "Waterplanten",                "Potamogeton mucronatus",         "Potamogeton mucronatus",               "M8",         2L,
                 "Waterplanten",                    "Potamogeton natans",             "Potamogeton natans",               "M8",         1L,
                 "Waterplanten",                   "Potamogeton nodosus",            "Potamogeton nodosus",               "M8",         3L,
                 "Waterplanten",              "Potamogeton obtusifolius",       "Potamogeton obtusifolius",               "M8",         1L,
                 "Waterplanten",                "Potamogeton pectinatus",         "Potamogeton pectinatus",               "M8",         4L,
                 "Waterplanten",               "Potamogeton perfoliatus",        "Potamogeton perfoliatus",               "M8",         1L,
                 "Waterplanten",            "Potamogeton polygonifolius",     "Potamogeton polygonifolius",               "M8",         1L,
                 "Waterplanten",                "Potamogeton praelongus",         "Potamogeton praelongus",               "M8",         1L,
                 "Waterplanten",                  "Potamogeton pusillus",           "Potamogeton pusillus",               "M8",         4L,
                 "Waterplanten",                "Potamogeton trichoides",         "Potamogeton trichoides",               "M8",         3L,
                 "Waterplanten",                 "Ranunculus circinatus",          "Ranunculus circinatus",               "M8",         2L,
                 "Waterplanten",                       "Riccia fluitans",                "Riccia fluitans",               "M8",         4L,
                 "Waterplanten",                   "Ricciocarpos natans",            "Ricciocarpos natans",               "M8",         2L,
                 "Waterplanten",                   "Spirodela polyrhiza",            "Spirodela polyrhiza",               "M8",         5L,
                 "Waterplanten",                    "Stratiotes aloides",             "Stratiotes aloides",               "M8",         3L,
                 "Waterplanten",                   "Tolypella intricata",            "Tolypella intricata",               "M8",         1L,
                 "Waterplanten",                   "Tolypella prolifera",            "Tolypella prolifera",               "M8",         1L,
                 "Waterplanten",                  "Utricularia vulgaris",           "Utricularia vulgaris",               "M8",         2L,
                 "Waterplanten",                             "Vaucheria",                      "Vaucheria",               "M8",         2L,
                 "Waterplanten",                               "Wolffia",                        "Wolffia",               "M8",         5L,
                 "Waterplanten",            "Zannichellia palustris [1]",     "Zannichellia palustris [1]",               "M8",         4L,
                 "Oeverplanten",                        "Acorus calamus",                 "Acorus calamus",               "M8",         5L,
                 "Oeverplanten",                  "Agrostis stolonifera",           "Agrostis stolonifera",               "M8",         4L,
                 "Oeverplanten",                    "Alisma lanceolatum",             "Alisma lanceolatum",               "M8",         3L,
                 "Oeverplanten",              "Alisma plantago-aquatica",       "Alisma plantago-aquatica",               "M8",         4L,
                 "Oeverplanten",                "Alopecurus geniculatus",         "Alopecurus geniculatus",               "M8",         2L,
                 "Oeverplanten",                      "Apium nodiflorum",               "Apium nodiflorum",               "M8",         2L,
                 "Oeverplanten",                         "Berula erecta",                  "Berula erecta",               "M8",         3L,
                 "Oeverplanten",                         "Bidens cernua",                  "Bidens cernua",               "M8",         2L,
                 "Oeverplanten",                        "Bidens connata",                 "Bidens connata",               "M8",         3L,
                 "Oeverplanten",                       "Bidens frondosa",                "Bidens frondosa",               "M8",         4L,
                 "Oeverplanten",                     "Bidens tripartita",              "Bidens tripartita",               "M8",         3L,
                 "Oeverplanten",               "Bolboschoenus maritimus",        "Bolboschoenus maritimus",               "M8",         3L,
                 "Oeverplanten",                    "Butomus umbellatus",             "Butomus umbellatus",               "M8",         2L,
                 "Oeverplanten",                       "Calla palustris",                "Calla palustris",               "M8",         1L,
                 "Oeverplanten",                      "Caltha palustris",               "Caltha palustris",               "M8",         2L,
                 "Oeverplanten",                           "Carex acuta",                    "Carex acuta",               "M8",         3L,
                 "Oeverplanten",                     "Carex acutiformis",              "Carex acutiformis",               "M8",         3L,
                 "Oeverplanten",                       "Carex aquatilis",                "Carex aquatilis",               "M8",         3L,
                 "Oeverplanten",                        "Carex disticha",                 "Carex disticha",               "M8",         2L,
                 "Oeverplanten",                           "Carex elata",                    "Carex elata",               "M8",         2L,
                 "Oeverplanten",                           "Carex hirta",                    "Carex hirta",               "M8",         3L,
                 "Oeverplanten",                      "Carex lasiocarpa",               "Carex lasiocarpa",               "M8",         1L,
                 "Oeverplanten",                         "Carex otrubae",                  "Carex otrubae",               "M8",         3L,
                 "Oeverplanten",                      "Carex paniculata",               "Carex paniculata",               "M8",         3L,
                 "Oeverplanten",                   "Carex pseudocyperus",            "Carex pseudocyperus",               "M8",         3L,
                 "Oeverplanten",                         "Carex riparia",                  "Carex riparia",               "M8",         3L,
                 "Oeverplanten",                        "Carex rostrata",                 "Carex rostrata",               "M8",         2L,
                 "Oeverplanten",                    "Catabrosa aquatica",             "Catabrosa aquatica",               "M8",         5L,
                 "Oeverplanten",                         "Cicuta virosa",                  "Cicuta virosa",               "M8",         4L,
                 "Oeverplanten",                      "Cladium mariscus",               "Cladium mariscus",               "M8",         2L,
                 "Oeverplanten",                      "Comarum palustre",               "Comarum palustre",               "M8",         2L,
                 "Oeverplanten",              "Eleocharis palustris [1]",       "Eleocharis palustris [1]",               "M8",         3L,
                 "Oeverplanten",                    "Epilobium hirsutum",             "Epilobium hirsutum",               "M8",         5L,
                 "Oeverplanten",                 "Epilobium parviflorum",          "Epilobium parviflorum",               "M8",         3L,
                 "Oeverplanten",                    "Equisetum palustre",             "Equisetum palustre",               "M8",         4L,
                 "Oeverplanten",                 "Eupatorium cannabinum",          "Eupatorium cannabinum",               "M8",         4L,
                 "Oeverplanten",                   "Filipendula ulmaria",            "Filipendula ulmaria",               "M8",         4L,
                 "Oeverplanten",                   "Galium palustre [1]",            "Galium palustre [1]",               "M8",         3L,
                 "Oeverplanten",                     "Glyceria fluitans",              "Glyceria fluitans",               "M8",         3L,
                 "Oeverplanten",                       "Glyceria maxima",                "Glyceria maxima",               "M8",         4L,
                 "Oeverplanten",                     "Hippuris vulgaris",              "Hippuris vulgaris",               "M8",         2L,
                 "Oeverplanten",                  "Hydrocotyle vulgaris",           "Hydrocotyle vulgaris",               "M8",         3L,
                 "Oeverplanten",                      "Iris pseudacorus",               "Iris pseudacorus",               "M8",         3L,
                 "Oeverplanten",                    "Juncus articulatus",             "Juncus articulatus",               "M8",         3L,
                 "Oeverplanten",                       "Juncus bufonius",                "Juncus bufonius",               "M8",         4L,
                 "Oeverplanten",                  "Juncus conglomeratus",           "Juncus conglomeratus",               "M8",         1L,
                 "Oeverplanten",                        "Juncus effusus",                 "Juncus effusus",               "M8",         4L,
                 "Oeverplanten",                   "Juncus subnodulosus",            "Juncus subnodulosus",               "M8",         2L,
                 "Oeverplanten",                     "Lycopus europaeus",              "Lycopus europaeus",               "M8",         4L,
                 "Oeverplanten",                 "Lysimachia nummularia",          "Lysimachia nummularia",               "M8",         2L,
                 "Oeverplanten",                "Lysimachia thyrsiflora",         "Lysimachia thyrsiflora",               "M8",         3L,
                 "Oeverplanten",                   "Lysimachia vulgaris",            "Lysimachia vulgaris",               "M8",         4L,
                 "Oeverplanten",                     "Lythrum salicaria",              "Lythrum salicaria",               "M8",         4L,
                 "Oeverplanten",                       "Mentha aquatica",                "Mentha aquatica",               "M8",         3L,
                 "Oeverplanten",                 "Menyanthes trifoliata",          "Menyanthes trifoliata",               "M8",         1L,
                 "Oeverplanten",                  "Myosotis scorpioides",           "Myosotis scorpioides",               "M8",         3L,
                 "Oeverplanten", "Myosotis scorpioides ssp. scorpioides",           "Myosotis scorpioides",               "M8",         3L,
                 "Oeverplanten",               "Nasturtium microphyllum",        "Nasturtium microphyllum",               "M8",         3L,
                 "Oeverplanten",                 "Nasturtium officinale",          "Nasturtium officinale",               "M8",         3L,
                 "Oeverplanten",                     "Oenanthe aquatica",              "Oenanthe aquatica",               "M8",         3L,
                 "Oeverplanten",                    "Oenanthe fistulosa",             "Oenanthe fistulosa",               "M8",         3L,
                 "Oeverplanten",                 "Persicaria hydropiper",          "Persicaria hydropiper",               "M8",         5L,
                 "Oeverplanten",                      "Persicaria mitis",               "Persicaria mitis",               "M8",         5L,
                 "Oeverplanten",                   "Peucedanum palustre",            "Peucedanum palustre",               "M8",         4L,
                 "Oeverplanten",                  "Phalaris arundinacea",           "Phalaris arundinacea",               "M8",         4L,
                 "Oeverplanten",                  "Phragmites australis",           "Phragmites australis",               "M8",         4L,
                 "Oeverplanten",                         "Poa trivialis",                  "Poa trivialis",               "M8",         2L,
                 "Oeverplanten",                   "Ranunculus flammula",            "Ranunculus flammula",               "M8",         2L,
                 "Oeverplanten",                     "Ranunculus lingua",              "Ranunculus lingua",               "M8",         2L,
                 "Oeverplanten",                 "Ranunculus sceleratus",          "Ranunculus sceleratus",               "M8",         4L,
                 "Oeverplanten",                      "Rorippa amphibia",               "Rorippa amphibia",               "M8",         4L,
                 "Oeverplanten",                   "Rumex hydrolapathum",            "Rumex hydrolapathum",               "M8",         3L,
                 "Oeverplanten",               "Sagittaria sagittifolia",        "Sagittaria sagittifolia",               "M8",         2L,
                 "Oeverplanten",              "Schoenoplectus lacustris",       "Schoenoplectus lacustris",               "M8",         2L,
                 "Oeverplanten",        "Schoenoplectus tabernaemontani", "Schoenoplectus tabernaemontani",               "M8",         1L,
                 "Oeverplanten",                    "Scirpus sylvaticus",             "Scirpus sylvaticus",               "M8",         2L,
                 "Oeverplanten",              "Scutellaria galericulata",       "Scutellaria galericulata",               "M8",         3L,
                 "Oeverplanten",                       "Sium latifolium",                "Sium latifolium",               "M8",         4L,
                 "Oeverplanten",                     "Solanum dulcamara",              "Solanum dulcamara",               "M8",         4L,
                 "Oeverplanten",                     "Sonchus palustris",              "Sonchus palustris",               "M8",         3L,
                 "Oeverplanten",                    "Sparganium emersum",             "Sparganium emersum",               "M8",         2L,
                 "Oeverplanten",                    "Sparganium erectum",             "Sparganium erectum",               "M8",         3L,
                 "Oeverplanten",                     "Stachys palustris",              "Stachys palustris",               "M8",         4L,
                 "Oeverplanten",                  "Symphytum officinale",           "Symphytum officinale",               "M8",         4L,
                 "Oeverplanten",                 "Tephroseris palustris",          "Tephroseris palustris",               "M8",         2L,
                 "Oeverplanten",                  "Triglochin palustris",           "Triglochin palustris",               "M8",         3L,
                 "Oeverplanten",                    "Typha angustifolia",             "Typha angustifolia",               "M8",         3L,
                 "Oeverplanten",                       "Typha latifolia",                "Typha latifolia",               "M8",         5L,
                 "Oeverplanten",                 "Valeriana officinalis",          "Valeriana officinalis",               "M8",         4L,
                 "Oeverplanten",                   "Veronica beccabunga",            "Veronica beccabunga",               "M8",         3L,
                 "Oeverplanten",                     "Veronica catenata",              "Veronica catenata",               "M8",         4L,
                 "Oeverplanten",                   "Veronica scutellata",            "Veronica scutellata",               "M8",         3L
                 )

scores <- tibble::tribble(
                    ~Groep, ~KRWwatertype.code, ~Abundantieklasse, ~Categorie, ~Score,
            "Waterplanten",               "M8",               1L,         1L,     3L,
            "Waterplanten",               "M8",               1L,         2L,     3L,
            "Waterplanten",               "M8",               1L,         3L,     2L,
            "Waterplanten",               "M8",               1L,         4L,     1L,
            "Waterplanten",               "M8",               1L,         5L,     0L,
            "Waterplanten",               "M8",               2L,         1L,     5L,
            "Waterplanten",               "M8",               2L,         2L,     4L,
            "Waterplanten",               "M8",               2L,         3L,     2L,
            "Waterplanten",               "M8",               2L,         4L,     0L,
            "Waterplanten",               "M8",               2L,         5L,    -1L,
            "Waterplanten",               "M8",               3L,         1L,     6L,
            "Waterplanten",               "M8",               3L,         2L,     4L,
            "Waterplanten",               "M8",               3L,         3L,     0L,
            "Waterplanten",               "M8",               3L,         4L,    -1L,
            "Waterplanten",               "M8",               3L,         5L,    -3L,
            "Oeverplanten",               "M8",               1L,         1L,     9L,
            "Oeverplanten",               "M8",               1L,         2L,     5L,
            "Oeverplanten",               "M8",               1L,         3L,     2L,
            "Oeverplanten",               "M8",               1L,         4L,     1L,
            "Oeverplanten",               "M8",               1L,         5L,     0L,
            "Oeverplanten",               "M8",               2L,         1L,     8L,
            "Oeverplanten",               "M8",               2L,         2L,     4L,
            "Oeverplanten",               "M8",               2L,         3L,     1L,
            "Oeverplanten",               "M8",               2L,         4L,     0L,
            "Oeverplanten",               "M8",               2L,         5L,    -2L,
            "Oeverplanten",               "M8",               3L,         1L,     6L,
            "Oeverplanten",               "M8",               3L,         2L,     3L,
            "Oeverplanten",               "M8",               3L,         3L,     0L,
            "Oeverplanten",               "M8",               3L,         4L,    -3L,
            "Oeverplanten",               "M8",               3L,         5L,    -9L
            )

constanten <- tibble::tribble(
                        ~Groep, ~KRWwatertype.code, ~Constante_a, ~Constante_b,
                "Waterplanten",               "M8",           5L,           1L,
                "Oeverplanten",               "M8",           8L,          -2L
                )




## ----opname-------------------------------------------------------------------
library(twn)

print(opname)


## ----message = FALSE----------------------------------------------------------
library(dplyr)

# Filter alle taxa die niet in de TWN-lijst voorkomen.
opname %>% 
  filter(!is_twn(taxa))


## -----------------------------------------------------------------------------

# Correctie van fouten in de taxonnaam
# De originele namen worden gekopieerd naar taxa_orig
opname <- opname %>% 
  # mutate(taxa_orig = taxa, .before = taxa) %>% 
  mutate(taxa = case_when(
    taxa == "Hydrocharis morsus ranae" ~ "Hydrocharis morsus-ranae",
    taxa == "Myosotis scorpioides ssp scorpioides" ~ "Myosotis scorpioides ssp. scorpioides",
    TRUE ~ taxa
  ))

# Zijn er nu nog taxa die niet in de TWN-lijst voorkomen?
opname %>% 
  filter(!is_twn(taxa)) %>% 
  nrow()


## -----------------------------------------------------------------------------

# Alle taxa die niet status 10, 20 of 80 hebben
opname %>% filter(!is_valid_twn(taxa))

# Alle taxa die status 30, 91 of 92 hebben
opname %>% filter(twn_status(taxa) %in% c("30", "91", "92"))

# Alle taxa die niet status 10 hebben
opname %>% filter(!is_status(taxa, c("10"))) %>% 
  mutate(status = twn_status(taxa))

# Er is ook een taxon met de de status 20


## -----------------------------------------------------------------------------
opname <- opname %>% 
  mutate(taxa = case_when(
    taxa == "Zannichellia palustris" ~ "Zannichellia palustris [1]",
    TRUE ~ taxa
  ))

## -----------------------------------------------------------------------------

# Wat is de voorkeurnaam
twn_voorkeurnaam("Scirpus lacustris ssp. lacustris")

# Vervang alle namen voor hun voorkeurnaam
opname <- opname %>% mutate(taxa = twn_voorkeurnaam(taxa))

# Hebben alle taxa status 10? 
# NB De status mag ook als getal worden opgegeven.
opname %>% 
  filter(!is_status(taxa, 10)) %>% 
  nrow()


## -----------------------------------------------------------------------------
head(maatlat_taxa)

# Zitten alle taxa van de maatlat wel in de TWN-lijst?
all(is_valid_twn(maatlat_taxa$Biotaxon.naam))

## -----------------------------------------------------------------------------
# Welke taxa uit de opname ontbreken in de maatlatlijst?
opname %>% filter(!taxa %in% maatlat_taxa$Biotaxon.naam)

## -----------------------------------------------------------------------------

# Voeg een kolom toe met namen die gematchd zijn met de namen in de maatlat
opname <- opname %>% 
  mutate(taxa_maatlat = match_parent(taxa, ref_taxa = maatlat_taxa$Biotaxon.naam)) %>% 
  print()

## ----krw-beoordeling----------------------------------------------------------
# functie zet bedekking om in abundantieklassen
f_abundantieklasse <- approxfun(c(0, 0.0001, 5, 50), c(0,1,2,3), method = "constant")

# koppelen van maatlattabellen aan de opname
opname_gekoppeld <- 
  opname %>% 
  # wegfilteren van taxa die niet in de maatlat zijn gevonden
  filter(!is.na(taxa_maatlat)) %>% 
  # samenvoegen van taxa  die in de maatlat onder dezelfde naam vallen
  # Wolffia arrhiza en Wolffia columbiana vallen allebei onder Wolffia
  group_by(taxa_maatlat) %>%
  summarise(bedekkingspercentage = sum(bedekkingspercentage)) %>%
  ungroup() %>%
  # bedekkingen omzetten in abundantieklassen
  mutate(Abundantieklasse = f_abundantieklasse(bedekkingspercentage)) %>% 
  # toevoegen van maatlatcategorieen en scores
  left_join(maatlat_taxa, by = c("taxa_maatlat" = "Biotaxon.naam")) %>% 
  left_join(scores, by = c("Groep", "Abundantieklasse", "Categorie", "KRWwatertype.code")) %>% 
  select(Groep, taxa_maatlat, Abundantieklasse, Categorie, Score, KRWwatertype.code) %>% 
  arrange(Groep, taxa_maatlat) %>% 
  print()

# functie voor de ekr formule soortensamenstelling
ekr_formule <- function(som_score, aantal, constante_a, constante_b){
  ekr <- ((som_score / sqrt(aantal)) - (3 / aantal) + constante_b) / constante_a
  
  # EKR dient tussen 0 en 1 te liggen
  ekr <- case_when(ekr < 0 ~ 0, ekr > 1 ~ 1, TRUE ~ ekr)
  ekr
}

# Bereken de ekr voor waterplanten en oeverplanten
deel_ekrs <- 
opname_gekoppeld %>%   
  group_by(Groep) %>% 
  # berekenen van som score en aantal scorende soorten
  summarise(n = n(),
            som_score = sum(Score)) %>% 
  # toevoegen constanten
  left_join(constanten, by = "Groep") %>% 
  # berekenen deel EKR's
  mutate(ekr = ekr_formule(som_score, n, Constante_a, Constante_b)) %>% 
  print()

# berekenen van de ekr macrofyten soortensamenstelling
deel_ekrs %>% 
  select(Groep, ekr) %>% 
  tidyr::pivot_wider(names_from = Groep, values_from = ekr) %>% 
  mutate(ekr_soortensamenstelling = (2 * Waterplanten + Oeverplanten) / 3, .before = Oeverplanten) %>% 
  rename(deel_ekr_oeverplanten = Oeverplanten, deel_ekr_waterplanten = Waterplanten) %>% 
  print()


## ----data-kopie, eval = FALSE-------------------------------------------------
#  opname <- tibble::tribble(
#                                                       ~taxa, ~bedekkingspercentage,
#                           "Caltha palustris ssp. palustris",                    2,
#                                    "Ceratophyllum demersum",                   10,
#                                              "Chara aspera",                    3,
#                                           "Chara connivens",                    5,
#                                          "Cirsium palustre",                    1,
#                                           "Glyceria maxima",                   15,
#                                  "Hydrocharis morsus ranae",                    3,
#                                               "Lemna minor",                   10,
#                                            "Lemna trisulca",                    1,
#                      "Myosotis scorpioides ssp scorpioides",                    1,
#                          "Scirpus lacustris ssp. lacustris",                    2,
#                                        "Stratiotes aloides",                   10,
#                                      "Symphytum officinale",                    1,
#                                             "Urtica dioica",                    2,
#                                      "Utricularia vulgaris",                    2,
#                                           "Wolffia arrhiza",                    2,
#                                        "Wolffia columbiana",                    5,
#                                    "Zannichellia palustris",                    1,
#                      )
#  
#  
#  maatlat_taxa <- tibble::tribble(
#                           ~Groep,                          ~Biotaxon.naam,              ~Biotaxon.naam_bron, ~KRWwatertype.code, ~Categorie,
#                   "Waterplanten",                      "Alisma gramineum",               "Alisma gramineum",               "M8",         2L,
#                   "Waterplanten",                   "Azolla filiculoides",            "Azolla filiculoides",               "M8",         5L,
#                   "Waterplanten",               "Baldellia ranunculoides",        "Baldellia ranunculoides",               "M8",         1L,
#                   "Waterplanten",                           "Callitriche",                    "Callitriche",               "M8",         3L,
#                   "Waterplanten",                    "Callitriche brutia",             "Callitriche brutia",               "M8",         3L,
#                   "Waterplanten",           "Callitriche hermaphroditica",    "Callitriche hermaphroditica",               "M8",         3L,
#                   "Waterplanten",               "Callitriche obtusangula",        "Callitriche obtusangula",               "M8",         2L,
#                   "Waterplanten",                "Callitriche platycarpa",         "Callitriche platycarpa",               "M8",         2L,
#                   "Waterplanten",                "Ceratophyllum demersum",         "Ceratophyllum demersum",               "M8",         4L,
#                   "Waterplanten",               "Ceratophyllum submersum",        "Ceratophyllum submersum",               "M8",         3L,
#                   "Waterplanten",                                 "Chara",                          "Chara",               "M8",         2L,
#                   "Waterplanten",                          "Chara aspera",                   "Chara aspera",               "M8",         1L,
#                   "Waterplanten",                      "Chara globularis",               "Chara globularis",               "M8",         2L,
#                   "Waterplanten",                         "Chara hispida",                  "Chara hispida",               "M8",         1L,
#                   "Waterplanten",                        "Chara vulgaris",                 "Chara vulgaris",               "M8",         2L,
#                   "Waterplanten",                 "Eleocharis acicularis",          "Eleocharis acicularis",               "M8",         3L,
#                   "Waterplanten",                    "Eleogiton fluitans",             "Eleogiton fluitans",               "M8",         1L,
#                   "Waterplanten",                     "Elodea canadensis",              "Elodea canadensis",               "M8",         3L,
#                   "Waterplanten",                      "Elodea nuttallii",               "Elodea nuttallii",               "M8",         4L,
#                   "Waterplanten",                  "Equisetum fluviatile",           "Equisetum fluviatile",               "M8",         2L,
#                   "Waterplanten",               "Fontinalis antipyretica",        "Fontinalis antipyretica",               "M8",         2L,
#                   "Waterplanten",                     "Groenlandia densa",              "Groenlandia densa",               "M8",         2L,
#                   "Waterplanten",                    "Hottonia palustris",             "Hottonia palustris",               "M8",         2L,
#                   "Waterplanten",              "Hydrocharis morsus-ranae",       "Hydrocharis morsus-ranae",               "M8",         5L,
#                   "Waterplanten",                           "Lemna gibba",                    "Lemna gibba",               "M8",         5L,
#                   "Waterplanten",                           "Lemna minor",                    "Lemna minor",               "M8",         5L,
#                   "Waterplanten",                          "Lemna minuta",                   "Lemna minuta",               "M8",         5L,
#                   "Waterplanten",                        "Lemna trisulca",                 "Lemna trisulca",               "M8",         4L,
#                   "Waterplanten",                     "Lemna turionifera",              "Lemna turionifera",               "M8",         5L,
#                   "Waterplanten",                 "Myriophyllum spicatum",          "Myriophyllum spicatum",               "M8",         4L,
#                   "Waterplanten",            "Myriophyllum verticillatum",     "Myriophyllum verticillatum",               "M8",         1L,
#                   "Waterplanten",                          "Najas marina",                   "Najas marina",               "M8",         1L,
#                   "Waterplanten",                               "Nitella",                        "Nitella",               "M8",         1L,
#                   "Waterplanten",                      "Nitella flexilis",               "Nitella flexilis",               "M8",         2L,
#                   "Waterplanten",                       "Nitella hyalina",                "Nitella hyalina",               "M8",         1L,
#                   "Waterplanten",                     "Nitella mucronata",              "Nitella mucronata",               "M8",         1L,
#                   "Waterplanten",                         "Nitella opaca",                  "Nitella opaca",               "M8",         1L,
#                   "Waterplanten",                    "Nitellopsis obtusa",             "Nitellopsis obtusa",               "M8",         1L,
#                   "Waterplanten",                          "Nuphar lutea",                   "Nuphar lutea",               "M8",         3L,
#                   "Waterplanten",                         "Nymphaea alba",                  "Nymphaea alba",               "M8",         3L,
#                   "Waterplanten",                    "Nymphoides peltata",             "Nymphoides peltata",               "M8",         2L,
#                   "Waterplanten",                   "Persicaria amphibia",            "Persicaria amphibia",               "M8",         4L,
#                   "Waterplanten",               "Potamogeton acutifolius",        "Potamogeton acutifolius",               "M8",         2L,
#                   "Waterplanten",                "Potamogeton compressus",         "Potamogeton compressus",               "M8",         2L,
#                   "Waterplanten",                   "Potamogeton crispus",            "Potamogeton crispus",               "M8",         3L,
#                   "Waterplanten",                    "Potamogeton lucens",             "Potamogeton lucens",               "M8",         1L,
#                   "Waterplanten",                "Potamogeton mucronatus",         "Potamogeton mucronatus",               "M8",         2L,
#                   "Waterplanten",                    "Potamogeton natans",             "Potamogeton natans",               "M8",         1L,
#                   "Waterplanten",                   "Potamogeton nodosus",            "Potamogeton nodosus",               "M8",         3L,
#                   "Waterplanten",              "Potamogeton obtusifolius",       "Potamogeton obtusifolius",               "M8",         1L,
#                   "Waterplanten",                "Potamogeton pectinatus",         "Potamogeton pectinatus",               "M8",         4L,
#                   "Waterplanten",               "Potamogeton perfoliatus",        "Potamogeton perfoliatus",               "M8",         1L,
#                   "Waterplanten",            "Potamogeton polygonifolius",     "Potamogeton polygonifolius",               "M8",         1L,
#                   "Waterplanten",                "Potamogeton praelongus",         "Potamogeton praelongus",               "M8",         1L,
#                   "Waterplanten",                  "Potamogeton pusillus",           "Potamogeton pusillus",               "M8",         4L,
#                   "Waterplanten",                "Potamogeton trichoides",         "Potamogeton trichoides",               "M8",         3L,
#                   "Waterplanten",                 "Ranunculus circinatus",          "Ranunculus circinatus",               "M8",         2L,
#                   "Waterplanten",                       "Riccia fluitans",                "Riccia fluitans",               "M8",         4L,
#                   "Waterplanten",                   "Ricciocarpos natans",            "Ricciocarpos natans",               "M8",         2L,
#                   "Waterplanten",                   "Spirodela polyrhiza",            "Spirodela polyrhiza",               "M8",         5L,
#                   "Waterplanten",                    "Stratiotes aloides",             "Stratiotes aloides",               "M8",         3L,
#                   "Waterplanten",                   "Tolypella intricata",            "Tolypella intricata",               "M8",         1L,
#                   "Waterplanten",                   "Tolypella prolifera",            "Tolypella prolifera",               "M8",         1L,
#                   "Waterplanten",                  "Utricularia vulgaris",           "Utricularia vulgaris",               "M8",         2L,
#                   "Waterplanten",                             "Vaucheria",                      "Vaucheria",               "M8",         2L,
#                   "Waterplanten",                               "Wolffia",                        "Wolffia",               "M8",         5L,
#                   "Waterplanten",            "Zannichellia palustris [1]",     "Zannichellia palustris [1]",               "M8",         4L,
#                   "Oeverplanten",                        "Acorus calamus",                 "Acorus calamus",               "M8",         5L,
#                   "Oeverplanten",                  "Agrostis stolonifera",           "Agrostis stolonifera",               "M8",         4L,
#                   "Oeverplanten",                    "Alisma lanceolatum",             "Alisma lanceolatum",               "M8",         3L,
#                   "Oeverplanten",              "Alisma plantago-aquatica",       "Alisma plantago-aquatica",               "M8",         4L,
#                   "Oeverplanten",                "Alopecurus geniculatus",         "Alopecurus geniculatus",               "M8",         2L,
#                   "Oeverplanten",                      "Apium nodiflorum",               "Apium nodiflorum",               "M8",         2L,
#                   "Oeverplanten",                         "Berula erecta",                  "Berula erecta",               "M8",         3L,
#                   "Oeverplanten",                         "Bidens cernua",                  "Bidens cernua",               "M8",         2L,
#                   "Oeverplanten",                        "Bidens connata",                 "Bidens connata",               "M8",         3L,
#                   "Oeverplanten",                       "Bidens frondosa",                "Bidens frondosa",               "M8",         4L,
#                   "Oeverplanten",                     "Bidens tripartita",              "Bidens tripartita",               "M8",         3L,
#                   "Oeverplanten",               "Bolboschoenus maritimus",        "Bolboschoenus maritimus",               "M8",         3L,
#                   "Oeverplanten",                    "Butomus umbellatus",             "Butomus umbellatus",               "M8",         2L,
#                   "Oeverplanten",                       "Calla palustris",                "Calla palustris",               "M8",         1L,
#                   "Oeverplanten",                      "Caltha palustris",               "Caltha palustris",               "M8",         2L,
#                   "Oeverplanten",                           "Carex acuta",                    "Carex acuta",               "M8",         3L,
#                   "Oeverplanten",                     "Carex acutiformis",              "Carex acutiformis",               "M8",         3L,
#                   "Oeverplanten",                       "Carex aquatilis",                "Carex aquatilis",               "M8",         3L,
#                   "Oeverplanten",                        "Carex disticha",                 "Carex disticha",               "M8",         2L,
#                   "Oeverplanten",                           "Carex elata",                    "Carex elata",               "M8",         2L,
#                   "Oeverplanten",                           "Carex hirta",                    "Carex hirta",               "M8",         3L,
#                   "Oeverplanten",                      "Carex lasiocarpa",               "Carex lasiocarpa",               "M8",         1L,
#                   "Oeverplanten",                         "Carex otrubae",                  "Carex otrubae",               "M8",         3L,
#                   "Oeverplanten",                      "Carex paniculata",               "Carex paniculata",               "M8",         3L,
#                   "Oeverplanten",                   "Carex pseudocyperus",            "Carex pseudocyperus",               "M8",         3L,
#                   "Oeverplanten",                         "Carex riparia",                  "Carex riparia",               "M8",         3L,
#                   "Oeverplanten",                        "Carex rostrata",                 "Carex rostrata",               "M8",         2L,
#                   "Oeverplanten",                    "Catabrosa aquatica",             "Catabrosa aquatica",               "M8",         5L,
#                   "Oeverplanten",                         "Cicuta virosa",                  "Cicuta virosa",               "M8",         4L,
#                   "Oeverplanten",                      "Cladium mariscus",               "Cladium mariscus",               "M8",         2L,
#                   "Oeverplanten",                      "Comarum palustre",               "Comarum palustre",               "M8",         2L,
#                   "Oeverplanten",              "Eleocharis palustris [1]",       "Eleocharis palustris [1]",               "M8",         3L,
#                   "Oeverplanten",                    "Epilobium hirsutum",             "Epilobium hirsutum",               "M8",         5L,
#                   "Oeverplanten",                 "Epilobium parviflorum",          "Epilobium parviflorum",               "M8",         3L,
#                   "Oeverplanten",                    "Equisetum palustre",             "Equisetum palustre",               "M8",         4L,
#                   "Oeverplanten",                 "Eupatorium cannabinum",          "Eupatorium cannabinum",               "M8",         4L,
#                   "Oeverplanten",                   "Filipendula ulmaria",            "Filipendula ulmaria",               "M8",         4L,
#                   "Oeverplanten",                   "Galium palustre [1]",            "Galium palustre [1]",               "M8",         3L,
#                   "Oeverplanten",                     "Glyceria fluitans",              "Glyceria fluitans",               "M8",         3L,
#                   "Oeverplanten",                       "Glyceria maxima",                "Glyceria maxima",               "M8",         4L,
#                   "Oeverplanten",                     "Hippuris vulgaris",              "Hippuris vulgaris",               "M8",         2L,
#                   "Oeverplanten",                  "Hydrocotyle vulgaris",           "Hydrocotyle vulgaris",               "M8",         3L,
#                   "Oeverplanten",                      "Iris pseudacorus",               "Iris pseudacorus",               "M8",         3L,
#                   "Oeverplanten",                    "Juncus articulatus",             "Juncus articulatus",               "M8",         3L,
#                   "Oeverplanten",                       "Juncus bufonius",                "Juncus bufonius",               "M8",         4L,
#                   "Oeverplanten",                  "Juncus conglomeratus",           "Juncus conglomeratus",               "M8",         1L,
#                   "Oeverplanten",                        "Juncus effusus",                 "Juncus effusus",               "M8",         4L,
#                   "Oeverplanten",                   "Juncus subnodulosus",            "Juncus subnodulosus",               "M8",         2L,
#                   "Oeverplanten",                     "Lycopus europaeus",              "Lycopus europaeus",               "M8",         4L,
#                   "Oeverplanten",                 "Lysimachia nummularia",          "Lysimachia nummularia",               "M8",         2L,
#                   "Oeverplanten",                "Lysimachia thyrsiflora",         "Lysimachia thyrsiflora",               "M8",         3L,
#                   "Oeverplanten",                   "Lysimachia vulgaris",            "Lysimachia vulgaris",               "M8",         4L,
#                   "Oeverplanten",                     "Lythrum salicaria",              "Lythrum salicaria",               "M8",         4L,
#                   "Oeverplanten",                       "Mentha aquatica",                "Mentha aquatica",               "M8",         3L,
#                   "Oeverplanten",                 "Menyanthes trifoliata",          "Menyanthes trifoliata",               "M8",         1L,
#                   "Oeverplanten",                  "Myosotis scorpioides",           "Myosotis scorpioides",               "M8",         3L,
#                   "Oeverplanten", "Myosotis scorpioides ssp. scorpioides",           "Myosotis scorpioides",               "M8",         3L,
#                   "Oeverplanten",               "Nasturtium microphyllum",        "Nasturtium microphyllum",               "M8",         3L,
#                   "Oeverplanten",                 "Nasturtium officinale",          "Nasturtium officinale",               "M8",         3L,
#                   "Oeverplanten",                     "Oenanthe aquatica",              "Oenanthe aquatica",               "M8",         3L,
#                   "Oeverplanten",                    "Oenanthe fistulosa",             "Oenanthe fistulosa",               "M8",         3L,
#                   "Oeverplanten",                 "Persicaria hydropiper",          "Persicaria hydropiper",               "M8",         5L,
#                   "Oeverplanten",                      "Persicaria mitis",               "Persicaria mitis",               "M8",         5L,
#                   "Oeverplanten",                   "Peucedanum palustre",            "Peucedanum palustre",               "M8",         4L,
#                   "Oeverplanten",                  "Phalaris arundinacea",           "Phalaris arundinacea",               "M8",         4L,
#                   "Oeverplanten",                  "Phragmites australis",           "Phragmites australis",               "M8",         4L,
#                   "Oeverplanten",                         "Poa trivialis",                  "Poa trivialis",               "M8",         2L,
#                   "Oeverplanten",                   "Ranunculus flammula",            "Ranunculus flammula",               "M8",         2L,
#                   "Oeverplanten",                     "Ranunculus lingua",              "Ranunculus lingua",               "M8",         2L,
#                   "Oeverplanten",                 "Ranunculus sceleratus",          "Ranunculus sceleratus",               "M8",         4L,
#                   "Oeverplanten",                      "Rorippa amphibia",               "Rorippa amphibia",               "M8",         4L,
#                   "Oeverplanten",                   "Rumex hydrolapathum",            "Rumex hydrolapathum",               "M8",         3L,
#                   "Oeverplanten",               "Sagittaria sagittifolia",        "Sagittaria sagittifolia",               "M8",         2L,
#                   "Oeverplanten",              "Schoenoplectus lacustris",       "Schoenoplectus lacustris",               "M8",         2L,
#                   "Oeverplanten",        "Schoenoplectus tabernaemontani", "Schoenoplectus tabernaemontani",               "M8",         1L,
#                   "Oeverplanten",                    "Scirpus sylvaticus",             "Scirpus sylvaticus",               "M8",         2L,
#                   "Oeverplanten",              "Scutellaria galericulata",       "Scutellaria galericulata",               "M8",         3L,
#                   "Oeverplanten",                       "Sium latifolium",                "Sium latifolium",               "M8",         4L,
#                   "Oeverplanten",                     "Solanum dulcamara",              "Solanum dulcamara",               "M8",         4L,
#                   "Oeverplanten",                     "Sonchus palustris",              "Sonchus palustris",               "M8",         3L,
#                   "Oeverplanten",                    "Sparganium emersum",             "Sparganium emersum",               "M8",         2L,
#                   "Oeverplanten",                    "Sparganium erectum",             "Sparganium erectum",               "M8",         3L,
#                   "Oeverplanten",                     "Stachys palustris",              "Stachys palustris",               "M8",         4L,
#                   "Oeverplanten",                  "Symphytum officinale",           "Symphytum officinale",               "M8",         4L,
#                   "Oeverplanten",                 "Tephroseris palustris",          "Tephroseris palustris",               "M8",         2L,
#                   "Oeverplanten",                  "Triglochin palustris",           "Triglochin palustris",               "M8",         3L,
#                   "Oeverplanten",                    "Typha angustifolia",             "Typha angustifolia",               "M8",         3L,
#                   "Oeverplanten",                       "Typha latifolia",                "Typha latifolia",               "M8",         5L,
#                   "Oeverplanten",                 "Valeriana officinalis",          "Valeriana officinalis",               "M8",         4L,
#                   "Oeverplanten",                   "Veronica beccabunga",            "Veronica beccabunga",               "M8",         3L,
#                   "Oeverplanten",                     "Veronica catenata",              "Veronica catenata",               "M8",         4L,
#                   "Oeverplanten",                   "Veronica scutellata",            "Veronica scutellata",               "M8",         3L
#                   )
#  
#  scores <- tibble::tribble(
#                      ~Groep, ~KRWwatertype.code, ~Abundantieklasse, ~Categorie, ~Score,
#              "Waterplanten",               "M8",               1L,         1L,     3L,
#              "Waterplanten",               "M8",               1L,         2L,     3L,
#              "Waterplanten",               "M8",               1L,         3L,     2L,
#              "Waterplanten",               "M8",               1L,         4L,     1L,
#              "Waterplanten",               "M8",               1L,         5L,     0L,
#              "Waterplanten",               "M8",               2L,         1L,     5L,
#              "Waterplanten",               "M8",               2L,         2L,     4L,
#              "Waterplanten",               "M8",               2L,         3L,     2L,
#              "Waterplanten",               "M8",               2L,         4L,     0L,
#              "Waterplanten",               "M8",               2L,         5L,    -1L,
#              "Waterplanten",               "M8",               3L,         1L,     6L,
#              "Waterplanten",               "M8",               3L,         2L,     4L,
#              "Waterplanten",               "M8",               3L,         3L,     0L,
#              "Waterplanten",               "M8",               3L,         4L,    -1L,
#              "Waterplanten",               "M8",               3L,         5L,    -3L,
#              "Oeverplanten",               "M8",               1L,         1L,     9L,
#              "Oeverplanten",               "M8",               1L,         2L,     5L,
#              "Oeverplanten",               "M8",               1L,         3L,     2L,
#              "Oeverplanten",               "M8",               1L,         4L,     1L,
#              "Oeverplanten",               "M8",               1L,         5L,     0L,
#              "Oeverplanten",               "M8",               2L,         1L,     8L,
#              "Oeverplanten",               "M8",               2L,         2L,     4L,
#              "Oeverplanten",               "M8",               2L,         3L,     1L,
#              "Oeverplanten",               "M8",               2L,         4L,     0L,
#              "Oeverplanten",               "M8",               2L,         5L,    -2L,
#              "Oeverplanten",               "M8",               3L,         1L,     6L,
#              "Oeverplanten",               "M8",               3L,         2L,     3L,
#              "Oeverplanten",               "M8",               3L,         3L,     0L,
#              "Oeverplanten",               "M8",               3L,         4L,    -3L,
#              "Oeverplanten",               "M8",               3L,         5L,    -9L
#              )
#  
#  constanten <- tibble::tribble(
#                          ~Groep, ~KRWwatertype.code, ~Constante_a, ~Constante_b,
#                  "Waterplanten",               "M8",           5L,           1L,
#                  "Oeverplanten",               "M8",           8L,          -2L
#                  )
#  

