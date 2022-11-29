//
//  Plant.swift
//  Plantful
//
//  Created by Jacob Perez on 11/28/22.
//

import Foundation

struct Plant: Codable {
    let query: Query
    let bestMatch: String
    let results: [ResultsDict]
}
struct Query: Codable {
    let project: String
    let images: [String]
    let organs: [String]
    let includeRelatedImages: Bool
}
struct ResultsDict: Codable {
    let species: SpeciesDict
}
struct SpeciesDict: Codable {
    let scientificNameWithoutAuthor: String
    let genus: GenusDict
    let family: FamilyDict
    let commonNames: [String]
    let scientificName: String
}
struct GenusDict: Codable {
    let scientificNameWithoutAuthor: String
    let scientificName: String
}
struct FamilyDict: Codable {
    let scientificNameWithoutAuthor: String
    let scientificName: String
}

//{
//  "query": {
//    "project": "all",
//    "images": [
//      "284e73fb7521165a3a8667d86b377c90"
//    ],
//    "organs": [
//      "flower"
//    ],
//    "includeRelatedImages": false
//  },
//  "language": "en",
//  "preferedReferential": "the-plant-list",
//  "bestMatch": "Hibiscus rosa-sinensis L.",
//  "results": [
//    {
//      "score": 0.77602,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus rosa-sinensis",
//        "scientificNameAuthorship": "L.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Hawaiian hibiscus",
//          "Hibiscus",
//          "Chinese hibiscus"
//        ],
//        "scientificName": "Hibiscus rosa-sinensis L."
//      },
//      "gbif": {
//        "id": "3152559"
//      }
//    },
//    {
//      "score": 0.01735,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus schizopetalus",
//        "scientificNameAuthorship": "(Dyer) Hook.f.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Campanilla",
//          "Chinese lantern",
//          "Fringed rosemallow"
//        ],
//        "scientificName": "Hibiscus schizopetalus (Dyer) Hook.f."
//      },
//      "gbif": {
//        "id": "9064581"
//      }
//    },
//    {
//      "score": 0.00728,
//      "species": {
//        "scientificNameWithoutAuthor": "Malvaviscus arboreus",
//        "scientificNameAuthorship": "Cav.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Malvaviscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaviscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Turk's-cap",
//          "Wax mallow",
//          "Fire dart bush"
//        ],
//        "scientificName": "Malvaviscus arboreus Cav."
//      },
//      "gbif": {
//        "id": "3152775"
//      }
//    },
//    {
//      "score": 0.0066,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus palustris",
//        "scientificNameAuthorship": "L.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Swamp Rose Mallow",
//          "Hardy Hidiscus",
//          "Twisted Hibiscus"
//        ],
//        "scientificName": "Hibiscus palustris L."
//      },
//      "gbif": {
//        "id": "6377046"
//      }
//    },
//    {
//      "score": 0.00553,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus sabdariffa",
//        "scientificNameAuthorship": "L.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Indian-sorrel",
//          "Roselle",
//          "Jamaica-sorrel"
//        ],
//        "scientificName": "Hibiscus sabdariffa L."
//      },
//      "gbif": {
//        "id": "3152582"
//      }
//    },
//    {
//      "score": 0.0039,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus moscheutos",
//        "scientificNameAuthorship": "L.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Crimsoneyed rosemallow",
//          "Swamp rose-mallow",
//          "Mallow-rose"
//        ],
//        "scientificName": "Hibiscus moscheutos L."
//      },
//      "gbif": {
//        "id": "3152596"
//      }
//    },
//    {
//      "score": 0.00388,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus clayi",
//        "scientificNameAuthorship": "O. Deg. & I. Deg.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Clay's hibiscus",
//          "Red Kauai rosemallow"
//        ],
//        "scientificName": "Hibiscus clayi O. Deg. & I. Deg."
//      },
//      "gbif": {
//        "id": "3152563"
//      }
//    },
//    {
//      "score": 0.00381,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus phanerandrus",
//        "scientificNameAuthorship": "Baker",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [],
//        "scientificName": "Hibiscus phanerandrus Baker"
//      },
//      "gbif": {
//        "id": "3934645"
//      }
//    },
//    {
//      "score": 0.00375,
//      "species": {
//        "scientificNameWithoutAuthor": "Malvaviscus penduliflorus",
//        "scientificNameAuthorship": "Moc. & Sessé ex DC.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Malvaviscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaviscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Mazapan"
//        ],
//        "scientificName": "Malvaviscus penduliflorus Moc. & Sessé ex DC."
//      },
//      "gbif": {
//        "id": "3152776"
//      }
//    },
//    {
//      "score": 0.00361,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus acetosella",
//        "scientificNameAuthorship": "Welw. ex Hiern",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "False roselle",
//          "Red-leaf hibiscus",
//          "African rosemallow"
//        ],
//        "scientificName": "Hibiscus acetosella Welw. ex Hiern"
//      },
//      "gbif": {
//        "id": "3152551"
//      }
//    },
//    {
//      "score": 0.00328,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus martianus",
//        "scientificNameAuthorship": "Zucc.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Heartleaf rosemallow",
//          "Mountain rosemallow",
//          "Heartleaf rose-mallow"
//        ],
//        "scientificName": "Hibiscus martianus Zucc."
//      },
//      "gbif": {
//        "id": "3152578"
//      }
//    },
//    {
//      "score": 0.00287,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus grandiflorus",
//        "scientificNameAuthorship": "Michx.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Swamp rosemallow",
//          "Swamp Rose-Mallow"
//        ],
//        "scientificName": "Hibiscus grandiflorus Michx."
//      },
//      "gbif": {
//        "id": "3152592"
//      }
//    },
//    {
//      "score": 0.00207,
//      "species": {
//        "scientificNameWithoutAuthor": "Abelmoschus moschatus",
//        "scientificNameAuthorship": "Medik.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Abelmoschus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Abelmoschus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Musk okra",
//          "Musk-mallow",
//          "Tropical jewel-hibiscus"
//        ],
//        "scientificName": "Abelmoschus moschatus Medik."
//      },
//      "gbif": {
//        "id": "8312665"
//      }
//    },
//    {
//      "score": 0.00186,
//      "species": {
//        "scientificNameWithoutAuthor": "Hippeastrum reginae",
//        "scientificNameAuthorship": "(L.) Herb.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hippeastrum",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hippeastrum"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Amaryllidaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Amaryllidaceae"
//        },
//        "commonNames": [
//          "Amaryllis",
//          "Cheryl's Treasure",
//          "Easter lily"
//        ],
//        "scientificName": "Hippeastrum reginae (L.) Herb."
//      },
//      "gbif": {
//        "id": "2854474"
//      }
//    },
//    {
//      "score": 0.00181,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus poeppigii",
//        "scientificNameAuthorship": "(Spreng.) Garcke",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Poeppig's rosemallow",
//          "Poeppig's rose-mallow"
//        ],
//        "scientificName": "Hibiscus poeppigii (Spreng.) Garcke"
//      },
//      "gbif": {
//        "id": "3152593"
//      }
//    },
//    {
//      "score": 0.00153,
//      "species": {
//        "scientificNameWithoutAuthor": "Hibiscus elatus",
//        "scientificNameAuthorship": "Sw.",
//        "genus": {
//          "scientificNameWithoutAuthor": "Hibiscus",
//          "scientificNameAuthorship": "",
//          "scientificName": "Hibiscus"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Cuban bast",
//          "Blue mahoe",
//          "Mahoe"
//        ],
//        "scientificName": "Hibiscus elatus Sw."
//      },
//      "gbif": {
//        "id": "3152571"
//      }
//    },
//    {
//      "score": 0.00129,
//      "species": {
//        "scientificNameWithoutAuthor": "Abutilon megapotamicum",
//        "scientificNameAuthorship": "(A.Spreng.) A.St.-Hil. & Naudin",
//        "genus": {
//          "scientificNameWithoutAuthor": "Abutilon",
//          "scientificNameAuthorship": "",
//          "scientificName": "Abutilon"
//        },
//        "family": {
//          "scientificNameWithoutAuthor": "Malvaceae",
//          "scientificNameAuthorship": "",
//          "scientificName": "Malvaceae"
//        },
//        "commonNames": [
//          "Dragons breath",
//          "Trailing abutilon"
//        ],
//        "scientificName": "Abutilon megapotamicum (A.Spreng.) A.St.-Hil. & Naudin"
//      },
//      "gbif": {
//        "id": "3937501"
//      }
//    }
//  ],
//  "version": "2022-10-24 (6.0)"
//}
