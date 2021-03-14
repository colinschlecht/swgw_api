require 'rest-client'
require 'pry'
require 'json'

#To seed the database, ucomment each method and method call. NOTE -- localhost url below will need to be activated.
# Each JSON file can be located in public folder. In the terminal, run: json-server --watch db.json
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#Be sure to seed home_world and species before characters.

species = {
  "species": [ 
  
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.136Z",
      "classification": "mammal",
      "name": "Human",
      "designation": "sentient",
      "created": "2014-12-10T13:52:11.567Z",
      "eye_colors":
        "brown, blue, green, hazel, grey, amber",
      "people": [66, 67, 68, 74],
      "skin_colors":
        "caucasian, black, asian, hispanic",
      "language": "Galactic Basic",
      "hair_colors": "blonde, brown, black, red",
      "homeworld": 9,
      "average_lifespan": "120",
      "average_height": "180",
      "pk": 1
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.139Z",
      "classification": "artificial",
      "name": "Droid",
      "designation": "sentient",
      "created": "2014-12-10T15:16:16.259Z",
      "eye_colors": "n/a",
      "people": [2, 3, 8, 23],
      "skin_colors": "n/a",
      "language": "n/a",
      "hair_colors": "n/a",
      "homeworld": null,
      "average_lifespan": "indefinite",
      "average_height": "n/a",
      "pk": 2
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.142Z",
      "classification": "mammal",
      "name": "Wookie",
      "designation": "sentient",
      "created": "2014-12-10T16:44:31.486Z",
      "eye_colors":
        "blue, green, yellow, brown, golden, red",
      "people": [13, 80],
      "skin_colors": "gray",
      "language": "Shyriiwook",
      "hair_colors": "black, brown",
      "homeworld": 14,
      "average_lifespan": "400",
      "average_height": "210",
      "pk": 3
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.144Z",
      "classification": "sentient",
      "name": "Rodian",
      "designation": "reptilian",
      "created": "2014-12-10T17:05:26.471Z",
      "eye_colors": "black",
      "people": [15],
      "skin_colors": "green, blue",
      "language": "Galatic Basic",
      "hair_colors": "n/a",
      "homeworld": 23,
      "average_lifespan": "unknown",
      "average_height": "170",
      "pk": 4
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.146Z",
      "classification": "gastropod",
      "name": "Hutt",
      "designation": "sentient",
      "created": "2014-12-10T17:12:50.410Z",
      "eye_colors": "yellow, red",
      "people": [16],
      "skin_colors": "green, brown, tan",
      "language": "Huttese",
      "hair_colors": "n/a",
      "homeworld": 24,
      "average_lifespan": "1000",
      "average_height": "300",
      "pk": 5
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.148Z",
      "classification": "mammal",
      "name": "unknown",
      "designation": "sentient",
      "created": "2014-12-15T12:27:22.877Z",
      "eye_colors": "brown, green, yellow",
      "people": [0],
      "skin_colors": "green, yellow",
      "language": "Galactic basic",
      "hair_colors": "brown, white",
      "homeworld": 28,
      "average_lifespan": "900",
      "average_height": "66",
      "pk": 6
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.151Z",
      "classification": "reptile",
      "name": "Trandoshan",
      "designation": "sentient",
      "created": "2014-12-15T13:07:47.704Z",
      "eye_colors": "yellow, orange",
      "people": [24],
      "skin_colors": "brown, green",
      "language": "Dosh",
      "hair_colors": "none",
      "homeworld": 29,
      "average_lifespan": "unknown",
      "average_height": "200",
      "pk": 7
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.153Z",
      "classification": "amphibian",
      "name": "Mon Calamari",
      "designation": "sentient",
      "created": "2014-12-18T11:09:52.263Z",
      "eye_colors": "yellow",
      "people": [27],
      "skin_colors": "red, blue, brown, magenta",
      "language": "Mon Calamarian",
      "hair_colors": "none",
      "homeworld": 31,
      "average_lifespan": "unknown",
      "average_height": "160",
      "pk": 8
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.155Z",
      "classification": "mammal",
      "name": "Ewok",
      "designation": "sentient",
      "created": "2014-12-18T11:22:00.285Z",
      "eye_colors": "orange, brown",
      "people": [30],
      "skin_colors": "brown",
      "language": "Ewokese",
      "hair_colors": "white, brown, black",
      "homeworld": 7,
      "average_lifespan": "unknown",
      "average_height": "100",
      "pk": 9
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.157Z",
      "classification": "mammal",
      "name": "Sullustan",
      "designation": "sentient",
      "created": "2014-12-18T11:26:20.103Z",
      "eye_colors": "black",
      "people": [31],
      "skin_colors": "pale",
      "language": "Sullutese",
      "hair_colors": "none",
      "homeworld": 33,
      "average_lifespan": "unknown",
      "average_height": "180",
      "pk": 10
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.160Z",
      "classification": "unknown",
      "name": "Neimodian",
      "designation": "sentient",
      "created": "2014-12-19T17:07:31.319Z",
      "eye_colors": "red, pink",
      "people": [33],
      "skin_colors": "grey, green",
      "language": "Neimoidia",
      "hair_colors": "none",
      "homeworld": 18,
      "average_lifespan": "unknown",
      "average_height": "180",
      "pk": 11
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.163Z",
      "classification": "amphibian",
      "name": "Gungan",
      "designation": "sentient",
      "created": "2014-12-19T17:30:37.341Z",
      "eye_colors": "orange",
      "people": [36, 37, 38],
      "skin_colors": "brown, green",
      "language": "Gungan basic",
      "hair_colors": "none",
      "homeworld": 8,
      "average_lifespan": "unknown",
      "average_height": "190",
      "pk": 12
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.165Z",
      "classification": "mammal",
      "name": "Toydarian",
      "designation": "sentient",
      "created": "2014-12-19T17:48:56.893Z",
      "eye_colors": "yellow",
      "people": [40],
      "skin_colors": "blue, green, grey",
      "language": "Toydarian",
      "hair_colors": "none",
      "homeworld": 34,
      "average_lifespan": "91",
      "average_height": "120",
      "pk": 13
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.167Z",
      "classification": "mammal",
      "name": "Dug",
      "designation": "sentient",
      "created": "2014-12-19T17:53:11.214Z",
      "eye_colors": "yellow, blue",
      "people": [41],
      "skin_colors": "brown, purple, grey, red",
      "language": "Dugese",
      "hair_colors": "none",
      "homeworld": 35,
      "average_lifespan": "unknown",
      "average_height": "100",
      "pk": 14
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.169Z",
      "classification": "mammals",
      "name": "Twi'lek",
      "designation": "sentient",
      "created": "2014-12-20T09:48:02.406Z",
      "eye_colors": "blue, brown, orange, pink",
      "people": [45, 46],
      "skin_colors":
        "orange, yellow, blue, green, pink, purple, tan",
      "language": "Twi'leki",
      "hair_colors": "none",
      "homeworld": 37,
      "average_lifespan": "unknown",
      "average_height": "200",
      "pk": 15
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.171Z",
      "classification": "reptile",
      "name": "Aleena",
      "designation": "sentient",
      "created": "2014-12-20T09:53:16.481Z",
      "eye_colors": "unknown",
      "people": [47],
      "skin_colors": "blue, gray",
      "language": "Aleena",
      "hair_colors": "none",
      "homeworld": 38,
      "average_lifespan": "79",
      "average_height": "80",
      "pk": 16
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.173Z",
      "classification": "unknown",
      "name": "Vulptereen",
      "designation": "sentient",
      "created": "2014-12-20T09:57:33.128Z",
      "eye_colors": "yellow",
      "people": [48],
      "skin_colors": "grey",
      "language": "vulpterish",
      "hair_colors": "none",
      "homeworld": 39,
      "average_lifespan": "unknown",
      "average_height": "100",
      "pk": 17
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.175Z",
      "classification": "unknown",
      "name": "Xexto",
      "designation": "sentient",
      "created": "2014-12-20T10:02:13.915Z",
      "eye_colors": "black",
      "people": [49],
      "skin_colors": "grey, yellow, purple",
      "language": "Xextese",
      "hair_colors": "none",
      "homeworld": 40,
      "average_lifespan": "unknown",
      "average_height": "125",
      "pk": 18
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.177Z",
      "classification": "unknown",
      "name": "Toong",
      "designation": "sentient",
      "created": "2014-12-20T10:08:36.795Z",
      "eye_colors": "orange",
      "people": [50],
      "skin_colors": "grey, green, yellow",
      "language": "Tundan",
      "hair_colors": "none",
      "homeworld": 41,
      "average_lifespan": "unknown",
      "average_height": "200",
      "pk": 19
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.179Z",
      "classification": "mammal",
      "name": "Cerean",
      "designation": "sentient",
      "created": "2014-12-20T10:15:33.765Z",
      "eye_colors": "hazel",
      "people": [52],
      "skin_colors": "pale pink",
      "language": "Cerean",
      "hair_colors": "red, blond, black, white",
      "homeworld": 43,
      "average_lifespan": "unknown",
      "average_height": "200",
      "pk": 20
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.181Z",
      "classification": "amphibian",
      "name": "Nautolan",
      "designation": "sentient",
      "created": "2014-12-20T10:18:58.610Z",
      "eye_colors": "black",
      "people": [53],
      "skin_colors": "green, blue, brown, red",
      "language": "Nautila",
      "hair_colors": "none",
      "homeworld": 44,
      "average_lifespan": "70",
      "average_height": "180",
      "pk": 21
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.183Z",
      "classification": "mammal",
      "name": "Zabrak",
      "designation": "sentient",
      "created": "2014-12-20T10:26:59.894Z",
      "eye_colors": "brown, orange",
      "people": [44, 54],
      "skin_colors":
        "pale, brown, red, orange, yellow",
      "language": "Zabraki",
      "hair_colors": "black",
      "homeworld": 45,
      "average_lifespan": "unknown",
      "average_height": "180",
      "pk": 22
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.186Z",
      "classification": "mammal",
      "name": "Tholothian",
      "designation": "sentient",
      "created": "2014-12-20T10:29:13.798Z",
      "eye_colors": "blue, indigo",
      "people": [55],
      "skin_colors": "dark",
      "language": "unknown",
      "hair_colors": "unknown",
      "homeworld": 46,
      "average_lifespan": "unknown",
      "average_height": "unknown",
      "pk": 23
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.188Z",
      "classification": "unknown",
      "name": "Iktotchi",
      "designation": "sentient",
      "created": "2014-12-20T10:32:13.046Z",
      "eye_colors": "orange",
      "people": [56],
      "skin_colors": "pink",
      "language": "Iktotchese",
      "hair_colors": "none",
      "homeworld": 47,
      "average_lifespan": "unknown",
      "average_height": "180",
      "pk": 24
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.189Z",
      "classification": "mammal",
      "name": "Quermian",
      "designation": "sentient",
      "created": "2014-12-20T10:34:50.827Z",
      "eye_colors": "yellow",
      "people": [57],
      "skin_colors": "white",
      "language": "Quermian",
      "hair_colors": "none",
      "homeworld": 48,
      "average_lifespan": "86",
      "average_height": "240",
      "pk": 25
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.191Z",
      "classification": "unknown",
      "name": "Kel Dor",
      "designation": "sentient",
      "created": "2014-12-20T10:49:21.692Z",
      "eye_colors": "black, silver",
      "people": [58],
      "skin_colors": "peach, orange, red",
      "language": "Kel Dor",
      "hair_colors": "none",
      "homeworld": 49,
      "average_lifespan": "70",
      "average_height": "180",
      "pk": 26
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.193Z",
      "classification": "amphibian",
      "name": "Chagrian",
      "designation": "sentient",
      "created": "2014-12-20T10:53:28.795Z",
      "eye_colors": "blue",
      "people": [59],
      "skin_colors": "blue",
      "language": "Chagria",
      "hair_colors": "none",
      "homeworld": 50,
      "average_lifespan": "unknown",
      "average_height": "190",
      "pk": 27
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.195Z",
      "classification": "insectoid",
      "name": "Geonosian",
      "designation": "sentient",
      "created": "2014-12-20T16:40:45.618Z",
      "eye_colors": "green, hazel",
      "people": [63],
      "skin_colors": "green, brown",
      "language": "Geonosian",
      "hair_colors": "none",
      "homeworld": 11,
      "average_lifespan": "unknown",
      "average_height": "178",
      "pk": 28
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.197Z",
      "classification": "mammal",
      "name": "Mirialan",
      "designation": "sentient",
      "created": "2014-12-20T16:46:48.290Z",
      "eye_colors":
        "blue, green, red, yellow, brown, orange",
      "people": [64, 65],
      "skin_colors": "yellow, green",
      "language": "Mirialan",
      "hair_colors": "black, brown",
      "homeworld": 51,
      "average_lifespan": "unknown",
      "average_height": "180",
      "pk": 29
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.199Z",
      "classification": "reptilian",
      "name": "Clawdite",
      "designation": "sentient",
      "created": "2014-12-20T16:57:46.171Z",
      "eye_colors": "yellow",
      "people": [70],
      "skin_colors": "green, yellow",
      "language": "Clawdite",
      "hair_colors": "none",
      "homeworld": 54,
      "average_lifespan": "70",
      "average_height": "180",
      "pk": 30
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.200Z",
      "classification": "amphibian",
      "name": "Besalisk",
      "designation": "sentient",
      "created": "2014-12-20T17:28:28.821Z",
      "eye_colors": "yellow",
      "people": [71],
      "skin_colors": "brown",
      "language": "besalisk",
      "hair_colors": "none",
      "homeworld": 55,
      "average_lifespan": "75",
      "average_height": "178",
      "pk": 31
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.202Z",
      "classification": "amphibian",
      "name": "Kaminoan",
      "designation": "sentient",
      "created": "2014-12-20T17:31:24.838Z",
      "eye_colors": "black",
      "people": [72, 73],
      "skin_colors": "grey, blue",
      "language": "Kaminoan",
      "hair_colors": "none",
      "homeworld": 10,
      "average_lifespan": "80",
      "average_height": "220",
      "pk": 32
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.204Z",
      "classification": "mammal",
      "name": "Skakoan",
      "designation": "sentient",
      "created": "2014-12-20T17:53:54.515Z",
      "eye_colors": "unknown",
      "people": [76],
      "skin_colors": "grey, green",
      "language": "Skakoan",
      "hair_colors": "none",
      "homeworld": 56,
      "average_lifespan": "unknown",
      "average_height": "unknown",
      "pk": 33
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.207Z",
      "classification": "mammal",
      "name": "Muun",
      "designation": "sentient",
      "created": "2014-12-20T17:58:19.088Z",
      "eye_colors": "black",
      "people": [77],
      "skin_colors": "grey, white",
      "language": "Muun",
      "hair_colors": "none",
      "homeworld": 57,
      "average_lifespan": "100",
      "average_height": "190",
      "pk": 34
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.209Z",
      "classification": "mammal",
      "name": "Togruta",
      "designation": "sentient",
      "created": "2014-12-20T18:44:03.246Z",
      "eye_colors":
        "red, orange, yellow, green, blue, black",
      "people": [78],
      "skin_colors":
        "red, white, orange, yellow, green, blue",
      "language": "Togruti",
      "hair_colors": "none",
      "homeworld": 58,
      "average_lifespan": "94",
      "average_height": "180",
      "pk": 35
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.210Z",
      "classification": "reptile",
      "name": "Kaleesh",
      "designation": "sentient",
      "created": "2014-12-20T19:45:42.537Z",
      "eye_colors": "yellow",
      "people": [79],
      "skin_colors": "brown, orange, tan",
      "language": "Kaleesh",
      "hair_colors": "none",
      "homeworld": 59,
      "average_lifespan": "80",
      "average_height": "170",
      "pk": 36
    }
  },
  {
    "fields": {
      "edited": "2014-12-20T21:36:42.212Z",
      "classification": "mammal",
      "name": "Pau'an",
      "designation": "sentient",
      "created": "2014-12-20T20:35:06.777Z",
      "eye_colors": "black",
      "people": [83],
      "skin_colors": "grey",
      "language": "Utapese",
      "hair_colors": "none",
      "homeworld": 12,
      "average_lifespan": "700",
      "average_height": "190",
      "pk": 37
    }
  },
  {
    "fields": {
      
      "name": "umbaran",
   
      "pk": 38
    }
  }
]

}

characters = {"characters": [
    {
    "id": 2,
    "name": "C-3PO",
    "image": "c-3po.jpg",
    "gender": "non-binary",
    "skin_tone": "gold",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 75,
    "birth_year": 30,
    "height": 167
    },
    {
    "id": 4,
    "name": "Darth Vader",
    "image": "darth_vader.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 136,
    "birth_year": 41,
    "height": 202
    },
    {
    "id": 5,
    "name": "Leia Organa",
    "image": "leia_organa.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 49,
    "birth_year": 19,
    "height": 150
    },
    {
    "id": 6,
    "name": "Owen Lars",
    "image": "owen_lars.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 120,
    "birth_year": 52,
    "height": 178
    },
    {
    "id": 7,
    "name": "Beru Whitesun lars",
    "image": "beru_whitesun_lars.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 75,
    "birth_year": 47,
    "height": 165
    },
    {
    "id": 9,
    "name": "Biggs Darklighter",
    "image": "biggs_darklighter.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 84,
    "birth_year": 24,
    "height": 183
    },
    {
    "id": 10,
    "name": "Obi-Wan Kenobi",
    "image": "obi-wan_kenobi.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "white",
    "mass": 77,
    "birth_year": 57,
    "height": 182
    },
    {
    "id": 11,
    "name": "Anakin Skywalker",
    "image": "anakin_skywalker.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 84,
    "birth_year": 41,
    "height": 188
    },
    {
    "id": 12,
    "name": "Wilhuff Tarkin",
    "image": "wilhuff_tarkin.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "grey",
    "mass": 0,
    "birth_year": 64,
    "height": 180
    },
    {
    "id": 13,
    "name": "Chewbacca",
    "image": "chewbacca.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 112,
    "birth_year": 200,
    "height": 228
    },
    {
    "id": 14,
    "name": "Han Solo",
    "image": "han_solo.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 80,
    "birth_year": 29,
    "height": 180
    },
    {
    "id": 15,
    "name": "Greedo",
    "image": "greedo.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 74,
    "birth_year": 44,
    "height": 173
    },
    {
    "id": 16,
    "name": "Jabba Desilijic Tiure",
    "image": "jabba_desilijic_tiure.jpg",
    "gender": "non-binary",
    "skin_tone": "green-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 1,
    "birth_year": 600,
    "height": 175
    },
    {
    "id": 17,
    "name": "Wedge Antilles",
    "image": "wedge_antilles.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "hazel",
    "hair_color": "brown",
    "mass": 77,
    "birth_year": 21,
    "height": 170
    },
    {
    "id": 18,
    "name": "Jek Tono Porkins",
    "image": "jek_tono_porkins.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 110,
    "birth_year": 0,
    "height": 180
    },
    {
    "id": 19,
    "name": "Yoda",
    "image": "yoda.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "brown",
    "hair_color": "white",
    "mass": 17,
    "birth_year": 896,
    "height": 66
    },
    {
    "id": 20,
    "name": "Palpatine",
    "image": "palpatine.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "yellow",
    "hair_color": "grey",
    "mass": 75,
    "birth_year": 82,
    "height": 170
    },
    {
    "id": 21,
    "name": "Boba Fett",
    "image": "boba_fett.jpg",
    "gender": "male",
    "skin_tone": "tan",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 78,
    "birth_year": 31,
    "height": 183
    },
    {
    "id": 23,
    "name": "Bossk",
    "image": "bossk.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "red",
    "hair_color": "none",
    "mass": 113,
    "birth_year": 53,
    "height": 190
    },
    {
    "id": 24,
    "name": "Lando Calrissian",
    "image": "lando_calrissian.jpg",
    "gender": "male",
    "skin_tone": "dark",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 79,
    "birth_year": 31,
    "height": 177
    },
    {
    "id": 25,
    "name": "Lobot",
    "image": "lobot.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "none",
    "mass": 79,
    "birth_year": 37,
    "height": 175
    },
    {
    "id": 26,
    "name": "Ackbar",
    "image": "ackbar.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 83,
    "birth_year": 41,
    "height": 180
    },
    {
    "id": 28,
    "name": "Arvel Crynyd",
    "image": "arvel_crynyd.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 0,
    "height": 0
    },
    {
    "id": 29,
    "name": "Wicket Systri Warrick",
    "image": "wicket_systri_warrick.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 20,
    "birth_year": 8,
    "height": 88
    },
    {
    "id": 30,
    "name": "Nien Nunb",
    "image": "nien_nunb.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 68,
    "birth_year": 0,
    "height": 160
    },
    {
    "id": 31,
    "name": "Qui-Gon Jinn",
    "image": "qui-gon_jinn.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 89,
    "birth_year": 92,
    "height": 193
    },
    {
    "id": 32,
    "name": "Nute Gunray",
    "image": "nute_gunray.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "red",
    "hair_color": "none",
    "mass": 90,
    "birth_year": 0,
    "height": 191
    },
    {
    "id": 34,
    "name": "Padmé Amidala",
    "image": "padme_amidala.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 45,
    "birth_year": 46,
    "height": 185
    },
    {
    "id": 35,
    "name": "Jar Jar Binks",
    "image": "jar_jar_binks.jpg",
    "gender": "male",
    "skin_tone": "orange-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 66,
    "birth_year": 52,
    "height": 196
    },
    {
    "id": 36,
    "name": "Roos Tarpals",
    "image": "roos_tarpals.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 82,
    "birth_year": 0,
    "height": 224
    },
    {
    "id": 37,
    "name": "Rugor Nass",
    "image": "rugor_nass.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 206
    },
    {
    "id": 38,
    "name": "Ric Olié",
    "image": "ric_olie.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 0,
    "height": 183
    },
    {
    "id": 39,
    "name": "Watto",
    "image": "watto.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "yellow",
    "hair_color": "black",
    "mass": 0,
    "birth_year": 0,
    "height": 137
    },
    {
    "id": 40,
    "name": "Sebulba",
    "image": "sebulba.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 40,
    "birth_year": 0,
    "height": 112
    },
    {
    "id": 41,
    "name": "Quarsh Panaka",
    "image": "quarsh_panaka.jpg",
    "gender": "male",
    "skin_tone": "dark",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 0,
    "birth_year": 62,
    "height": 183
    },
    {
    "id": 42,
    "name": "Shmi Skywalker",
    "image": "shmi_skywalker.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 0,
    "birth_year": 72,
    "height": 163
    },
    {
    "id": 43,
    "name": "Darth Maul",
    "image": "darth_maul.jpg",
    "gender": "male",
    "skin_tone": "red-ish",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 80,
    "birth_year": 54,
    "height": 175
    },
    {
    "id": 44,
    "name": "Bib Fortuna",
    "image": "bib_fortuna.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "pink",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 180
    },
    {
    "id": 45,
    "name": "Ayla Secura",
    "image": "ayla_secura.jpg",
    "gender": "female",
    "skin_tone": "blue",
    "eye_color": "hazel",
    "hair_color": "none",
    "mass": 55,
    "birth_year": 48,
    "height": 178
    },
    {
    "id": 47,
    "name": "Dud Bolt",
    "image": "dud_bolt.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 45,
    "birth_year": 0,
    "height": 94
    },
    {
    "id": 48,
    "name": "Gasgano",
    "image": "gasgano.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 122
    },
    {
    "id": 49,
    "name": "Ben Quadinaros",
    "image": "ben_quadinaros.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 65,
    "birth_year": 0,
    "height": 163
    },
    {
    "id": 50,
    "name": "Mace Windu",
    "image": "mace_windu.jpg",
    "gender": "male",
    "skin_tone": "dark",
    "eye_color": "brown",
    "hair_color": "none",
    "mass": 84,
    "birth_year": 72,
    "height": 188
    },
    {
    "id": 51,
    "name": "Ki-Adi-Mundi",
    "image": "ki-adi-mundi.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "yellow",
    "hair_color": "white",
    "mass": 82,
    "birth_year": 92,
    "height": 198
    },
    {
    "id": 52,
    "name": "Eeth Koth",
    "image": "eeth_koth.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 0,
    "birth_year": 0,
    "height": 171
    },
    {
    "id": 53,
    "name": "Adi Gallia",
    "image": "adi_gallia.jpg",
    "gender": "female",
    "skin_tone": "dark",
    "eye_color": "blue",
    "hair_color": "none",
    "mass": 50,
    "birth_year": 0,
    "height": 184
    },
    {
    "id": 54,
    "name": "Saesee Tiin",
    "image": "saesee_tiin.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "orange",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 188
    },
    {
    "id": 27,
    "name": "Mon Mothma",
    "image": "mon_mothma.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 48,
    "height": 150
    },
    {
    "id": 1,
    "name": "Luke Skywalker",
    "image": "luke_skywalker.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "blond",
    "mass": 77,
    "birth_year": 19,
    "height": 172
    },
    {
    "id": 33,
    "name": "Finis Valorum",
    "image": "finis_valorum.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "blond",
    "mass": 0,
    "birth_year": 91,
    "height": 170
    },
    {
    "id": 55,
    "name": "Yarael Poof",
    "image": "yarael_poof.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 264
    },
    {
    "id": 56,
    "name": "Plo Koon",
    "image": "plo_koon.jpg",
    "gender": "male",
    "skin_tone": "orange-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 80,
    "birth_year": 385,
    "height": 188
    },
    {
    "id": 57,
    "name": "Mas Amedda",
    "image": "mas_amedda.jpg",
    "gender": "male",
    "skin_tone": "blue",
    "eye_color": "blue",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 196
    },
    {
    "id": 58,
    "name": "Gregar Typho",
    "image": "gregar_typho.jpg",
    "gender": "male",
    "skin_tone": "dark",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 85,
    "birth_year": 0,
    "height": 185
    },
    {
    "id": 59,
    "name": "Cordé",
    "image": "corde.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 0,
    "height": 157
    },
    {
    "id": 60,
    "name": "Cliegg Lars",
    "image": "cliegg_lars.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 82,
    "height": 183
    },
    {
    "id": 61,
    "name": "Poggle the Lesser",
    "image": "poggle_the_lesser.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 80,
    "birth_year": 0,
    "height": 183
    },
    {
    "id": 62,
    "name": "Luminara Unduli",
    "image": "luminara_unduli.jpg",
    "gender": "female",
    "skin_tone": "yellow-ish",
    "eye_color": "blue",
    "hair_color": "black",
    "mass": 56,
    "birth_year": 58,
    "height": 170
    },
    {
    "id": 63,
    "name": "Barriss Offee",
    "image": "barriss_offee.jpg",
    "gender": "female",
    "skin_tone": "yellow-ish",
    "eye_color": "blue",
    "hair_color": "black",
    "mass": 50,
    "birth_year": 40,
    "height": 166
    },
    {
    "id": 64,
    "name": "Dormé",
    "image": "dorme.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 0,
    "birth_year": 0,
    "height": 165
    },
    {
    "id": 65,
    "name": "Dooku",
    "image": "dooku.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "white",
    "mass": 80,
    "birth_year": 102,
    "height": 193
    },
    {
    "id": 66,
    "name": "Bail Prestor Organa",
    "image": "bail_prestor_organa.jpg",
    "gender": "male",
    "skin_tone": "tan",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 0,
    "birth_year": 67,
    "height": 191
    },
    {
    "id": 67,
    "name": "Jango Fett",
    "image": "jango_fett.jpg",
    "gender": "male",
    "skin_tone": "tan",
    "eye_color": "brown",
    "hair_color": "black",
    "mass": 79,
    "birth_year": 66,
    "height": 183
    },
    {
    "id": 68,
    "name": "Zam Wesell",
    "image": "zam_wesell.jpg",
    "gender": "non-binary",
    "skin_tone": "fair",
    "eye_color": "yellow",
    "hair_color": "blond",
    "mass": 55,
    "birth_year": 0,
    "height": 168
    },
    {
    "id": 69,
    "name": "Dexter Jettster",
    "image": "dexter_jettster.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "yellow",
    "hair_color": "none",
    "mass": 102,
    "birth_year": 0,
    "height": 198
    },
    {
    "id": 70,
    "name": "Lama Su",
    "image": "lama_su.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 88,
    "birth_year": 0,
    "height": 229
    },
    {
    "id": 71,
    "name": "Taun We",
    "image": "taun_we.jpg",
    "gender": "female",
    "skin_tone": "grey-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 213
    },
    {
    "id": 72,
    "name": "Jocasta Nu",
    "image": "jocasta_nu.jpg",
    "gender": "female",
    "skin_tone": "fair",
    "eye_color": "blue",
    "hair_color": "white",
    "mass": 0,
    "birth_year": 0,
    "height": 167
    },
    {
    "id": 75,
    "name": "San Hill",
    "image": "san_hill.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "gold",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 191
    },
    {
    "id": 76,
    "name": "Shaak Ti",
    "image": "shaak_ti.jpg",
    "gender": "female",
    "skin_tone": "red-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 57,
    "birth_year": 0,
    "height": 178
    },
    {
    "id": 78,
    "name": "Tarfful",
    "image": "tarfful.jpg",
    "gender": "male",
    "skin_tone": "brown-ish",
    "eye_color": "blue",
    "hair_color": "brown",
    "mass": 136,
    "birth_year": 0,
    "height": 234
    },
    {
    "id": 79,
    "name": "Raymus Antilles",
    "image": "raymus_antilles.jpg",
    "gender": "male",
    "skin_tone": "fair",
    "eye_color": "brown",
    "hair_color": "brown",
    "mass": 79,
    "birth_year": 0,
    "height": 188
    },
    {
    "id": 80,
    "name": "Sly Moore",
    "image": "sly_moore.jpg",
    "gender": "female",
    "skin_tone": "pale-white",
    "eye_color": "white",
    "hair_color": "none",
    "mass": 48,
    "birth_year": 0,
    "height": 178
    },
    {
    "id": 81,
    "name": "Tion Medon",
    "image": "tion_medon.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "black",
    "hair_color": "none",
    "mass": 80,
    "birth_year": 0,
    "height": 206
    },
    {
    "id": 77,
    "name": "Grievous",
    "image": "grievous.jpg",
    "gender": "male",
    "skin_tone": "pale-white",
    "eye_color": "green",
    "hair_color": "none",
    "mass": 159,
    "birth_year": 0,
    "height": 216
    },
    {
    "id": 73,
    "name": "R4-P17",
    "image": "r4-p17.jpg",
    "gender": "non-binary",
    "skin_tone": "red-ish",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 0,
    "birth_year": 0,
    "height": 96
    },
    {
    "id": 74,
    "name": "Wat Tambor",
    "image": "wat_tambor.jpg",
    "gender": "male",
    "skin_tone": "green-ish",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 48,
    "birth_year": 0,
    "height": 193
    },
    {
    "id": 46,
    "name": "Ratts Tyerel",
    "image": "ratts_tyerel.jpg",
    "gender": "male",
    "skin_tone": "grey-ish",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 15,
    "birth_year": 0,
    "height": 79
    },
    {
    "id": 8,
    "name": "R5-D4",
    "image": "r5-d4.jpg",
    "gender": "non-binary",
    "skin_tone": "pale-white",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 32,
    "birth_year": 0,
    "height": 97
    },
    {
    "id": 3,
    "name": "R2-D2",
    "image": "r2-d2.jpg",
    "gender": "non-binary",
    "skin_tone": "pale-white",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 32,
    "birth_year": 33,
    "height": 96
    },
    {
    "id": 22,
    "name": "IG-88",
    "image": "ig-88.jpg",
    "gender": "non-binary",
    "skin_tone": "grey-ish",
    "eye_color": "unknown",
    "hair_color": "none",
    "mass": 140,
    "birth_year": 15,
    "height": 200
    }
    ]}

    homeworlds = {"planets": [
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.411Z",
                "climate": "arid",
                "surface_water": "1",
                "name": "Tatooine",
                "diameter": "10465",
                "rotation_period": "23",
                "created": "2014-12-09T13:50:49.641Z",
                "terrain": "desert",
                "gravity": "1 standard",
                "orbital_period": "304",
                "population": "200000",
                "pk": 1
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.420Z",
                "climate": "temperate",
                "surface_water": "40",
                "name": "Alderaan",
                "diameter": "12500",
                "rotation_period": "24",
                "created": "2014-12-10T11:35:48.479Z",
                "terrain": "grasslands, mountains",
                "gravity": "1 standard",
                "orbital_period": "364",
                "population": "2000000000",
                "pk": 2
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.421Z",
                "climate": "temperate, tropical",
                "surface_water": "8",
                "name": "Yavin IV",
                "diameter": "10200",
                "rotation_period": "24",
                "created": "2014-12-10T11:37:19.144Z",
                "terrain": "jungle, rainforests",
                "gravity": "1 standard",
                "orbital_period": "4818",
                "population": "1000",
                "pk": 3
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.423Z",
                "climate": "frozen",
                "surface_water": "100",
                "name": "Hoth",
                "diameter": "7200",
                "rotation_period": "23",
                "created": "2014-12-10T11:39:13.934Z",
                "terrain": "tundra, ice caves, mountain ranges",
                "gravity": "1.1 standard",
                "orbital_period": "549",
                "population": "unknown",
                "pk": 4
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.425Z",
                "climate": "murky",
                "surface_water": "8",
                "name": "Dagobah",
                "diameter": "8900",
                "rotation_period": "23",
                "created": "2014-12-10T11:42:22.590Z",
                "terrain": "swamp, jungles",
                "gravity": "N/A",
                "orbital_period": "341",
                "population": "unknown",
                "pk": 5
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.427Z",
                "climate": "temperate",
                "surface_water": "0",
                "name": "Bespin",
                "diameter": "118000",
                "rotation_period": "12",
                "created": "2014-12-10T11:43:55.240Z",
                "terrain": "gas giant",
                "gravity": "1.5 (surface), 1 standard (Cloud City)",
                "orbital_period": "5110",
                "population": "6000000",
                "pk": 6
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.429Z",
                "climate": "temperate",
                "surface_water": "8",
                "name": "Endor",
                "diameter": "4900",
                "rotation_period": "18",
                "created": "2014-12-10T11:50:29.349Z",
                "terrain": "forests, mountains, lakes",
                "gravity": "0.85 standard",
                "orbital_period": "402",
                "population": "30000000",
                "pk": 7
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.430Z",
                "climate": "temperate",
                "surface_water": "12",
                "name": "Naboo",
                "diameter": "12120",
                "rotation_period": "26",
                "created": "2014-12-10T11:52:31.066Z",
                "terrain": "grassy hills, swamps, forests, mountains",
                "gravity": "1 standard",
                "orbital_period": "312",
                "population": "4500000000",
                "pk": 8
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.432Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Coruscant",
                "diameter": "12240",
                "rotation_period": "24",
                "created": "2014-12-10T11:54:13.921Z",
                "terrain": "cityscape, mountains",
                "gravity": "1 standard",
                "orbital_period": "368",
                "population": "1000000000000",
                "pk": 9
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.434Z",
                "climate": "temperate",
                "surface_water": "100",
                "name": "Kamino",
                "diameter": "19720",
                "rotation_period": "27",
                "created": "2014-12-10T12:45:06.577Z",
                "terrain": "ocean",
                "gravity": "1 standard",
                "orbital_period": "463",
                "population": "1000000000",
                "pk": 10
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.437Z",
                "climate": "temperate, arid",
                "surface_water": "5",
                "name": "Geonosis",
                "diameter": "11370",
                "rotation_period": "30",
                "created": "2014-12-10T12:47:22.350Z",
                "terrain": "rock, desert, mountain, barren",
                "gravity": "0.9 standard",
                "orbital_period": "256",
                "population": "100000000000",
                "pk": 11
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.439Z",
                "climate": "temperate, arid, windy",
                "surface_water": "0.9",
                "name": "Utapau",
                "diameter": "12900",
                "rotation_period": "27",
                "created": "2014-12-10T12:49:01.491Z",
                "terrain": "scrublands, savanna, canyons, sinkholes",
                "gravity": "1 standard",
                "orbital_period": "351",
                "population": "95000000",
                "pk": 12
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.440Z",
                "climate": "hot",
                "surface_water": "0",
                "name": "Mustafar",
                "diameter": "4200",
                "rotation_period": "36",
                "created": "2014-12-10T12:50:16.526Z",
                "terrain": "volcanoes, lava rivers, mountains, caves",
                "gravity": "1 standard",
                "orbital_period": "412",
                "population": "20000",        
                "pk": 13
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.442Z",
                "climate": "tropical",
                "surface_water": "60",
                "name": "Kashyyyk",
                "diameter": "12765",
                "rotation_period": "26",
                "created": "2014-12-10T13:32:00.124Z",
                "terrain": "jungle, forests, lakes, rivers",
                "gravity": "1 standard",
                "orbital_period": "381",
                "population": "45000000",        
                "pk": 14
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.444Z",
                "climate": "artificial temperate ",
                "surface_water": "0",
                "name": "Polis Massa",
                "diameter": "0",
                "rotation_period": "24",
                "created": "2014-12-10T13:33:46.405Z",
                "terrain": "airless asteroid",
                "gravity": "0.56 standard",
                "orbital_period": "590",
                "population": "1000000",        
                "pk": 15
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.446Z",
                "climate": "frigid",
                "surface_water": "unknown",
                "name": "Mygeeto",
                "diameter": "10088",
                "rotation_period": "12",
                "created": "2014-12-10T13:43:39.139Z",
                "terrain": "glaciers, mountains, ice canyons",
                "gravity": "1 standard",
                "orbital_period": "167",
                "population": "19000000",        
                "pk": 16
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.447Z",
                "climate": "hot, humid",
                "surface_water": "unknown",
                "name": "Felucia",
                "diameter": "9100",
                "rotation_period": "34",
                "created": "2014-12-10T13:44:50.397Z",
                "terrain": "fungus forests",
                "gravity": "0.75 standard",
                "orbital_period": "231",
                "population": "8500000",       
                "pk": 17
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.449Z",
                "climate": "temperate, moist",
                "surface_water": "unknown",
                "name": "Cato Neimoidia",
                "diameter": "0",
                "rotation_period": "25",
                "created": "2014-12-10T13:46:28.704Z",
                "terrain": "mountains, fields, forests, rock arches",
                "gravity": "1 standard",
                "orbital_period": "278",
                "population": "10000000",        
                "pk": 18
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.450Z",
                "climate": "hot",
                "surface_water": "unknown",
                "name": "Saleucami",
                "diameter": "14920",
                "rotation_period": "26",
                "created": "2014-12-10T13:47:46.874Z",
                "terrain": "caves, desert, mountains, volcanoes",
                "gravity": "unknown",
                "orbital_period": "392",
                "population": "1400000000",      
                "pk": 19
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.452Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Stewjon",
                "diameter": "0",
                "rotation_period": "unknown",
                "created": "2014-12-10T16:16:26.566Z",
                "terrain": "grass",
                "gravity": "1 standard",
                "orbital_period": "unknown",
                "population": "unknown",       
                "pk": 20
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.454Z",
                "climate": "polluted",
                "surface_water": "unknown",
                "name": "Eriadu",
                "diameter": "13490",
                "rotation_period": "24",
                "created": "2014-12-10T16:26:54.384Z",
                "terrain": "cityscape",
                "gravity": "1 standard",
                "orbital_period": "360",
                "population": "22000000000",        
                "pk": 21
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.456Z",
                "climate": "temperate",
                "surface_water": "70",
                "name": "Corellia",
                "diameter": "11000",
                "rotation_period": "25",
                "created": "2014-12-10T16:49:12.453Z",
                "terrain": "plains, urban, hills, forests",
                "gravity": "1 standard",
                "orbital_period": "329",
                "population": "3000000000",        
                "pk": 22
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.458Z",
                "climate": "hot",
                "surface_water": "60",
                "name": "Rodia",
                "diameter": "7549",
                "rotation_period": "29",
                "created": "2014-12-10T17:03:28.110Z",
                "terrain": "jungles, oceans, urban, swamps",
                "gravity": "1 standard",
                "orbital_period": "305",
                "population": "1300000000",        
                "pk": 23
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.460Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Nal Hutta",
                "diameter": "12150",
                "rotation_period": "87",
                "created": "2014-12-10T17:11:29.452Z",
                "terrain": "urban, oceans, swamps, bogs",
                "gravity": "1 standard",
                "orbital_period": "413",
                "population": "7000000000",        
                "pk": 24
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.461Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Dantooine",
                "diameter": "9830",
                "rotation_period": "25",
                "created": "2014-12-10T17:23:29.896Z",
                "terrain": "oceans, savannas, mountains, grasslands",
                "gravity": "1 standard",
                "orbital_period": "378",
                "population": "1000",        
                "pk": 25
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.463Z",
                "climate": "temperate",
                "surface_water": "98",
                "name": "Bestine IV",
                "diameter": "6400",
                "rotation_period": "26",
                "created": "2014-12-12T11:16:55.078Z",
                "terrain": "rocky islands, oceans",
                "gravity": "unknown",
                "orbital_period": "680",
                "population": "62000000",
                "pk": 26
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.464Z",
                "climate": "temperate",
                "surface_water": "10",
                "name": "Ord Mantell",
                "diameter": "14050",
                "rotation_period": "26",
                "created": "2014-12-15T12:23:41.661Z",
                "terrain": "plains, seas, mesas",
                "gravity": "1 standard",
                "orbital_period": "334",
                "population": "4000000000",        
                "pk": 27
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.466Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "unknown",
                "diameter": "0",
                "rotation_period": "0",
                "created": "2014-12-15T12:25:59.569Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "0",
                "population": "unknown",        
                "pk": 28
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.468Z",
                "climate": "arid",
                "surface_water": "unknown",
                "name": "Trandosha",
                "diameter": "0",
                "rotation_period": "25",
                "created": "2014-12-15T12:53:47.695Z",
                "terrain": "mountains, seas, grasslands, deserts",
                "gravity": "0.62 standard",
                "orbital_period": "371",
                "population": "42000000",
                "pk": 29
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.469Z",
                "climate": "arid",
                "surface_water": "unknown",
                "name": "Socorro",
                "diameter": "0",
                "rotation_period": "20",
                "created": "2014-12-15T12:56:31.121Z",
                "terrain": "deserts, mountains",
                "gravity": "1 standard",
                "orbital_period": "326",
                "population": "300000000",
                "pk": 30
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.471Z",
                "climate": "temperate",
                "surface_water": "100",
                "name": "Mon Cala",
                "diameter": "11030",
                "rotation_period": "21",
                "created": "2014-12-18T11:07:01.792Z",
                "terrain": "oceans, reefs, islands",
                "gravity": "1",
                "orbital_period": "398",
                "population": "27000000000",
                "pk": 31
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.472Z",
                "climate": "temperate",
                "surface_water": "40",
                "name": "Chandrila",
                "diameter": "13500",
                "rotation_period": "20",
                "created": "2014-12-18T11:11:51.872Z",
                "terrain": "plains, forests",
                "gravity": "1",
                "orbital_period": "368",
                "population": "1200000000",
                "pk": 32
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.474Z",
                "climate": "superheated",
                "surface_water": "5",
                "name": "Sullust",
                "diameter": "12780",
                "rotation_period": "20",
                "created": "2014-12-18T11:25:40.243Z",
                "terrain": "mountains, volcanoes, rocky deserts",
                "gravity": "1",
                "orbital_period": "263",
                "population": "18500000000",
                "pk": 33
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.476Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Toydaria",
                "diameter": "7900",
                "rotation_period": "21",
                "created": "2014-12-19T17:47:54.403Z",
                "terrain": "swamps, lakes",
                "gravity": "1",
                "orbital_period": "184",
                "population": "11000000",
                "pk": 34
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.478Z",
                "climate": "arid, temperate, tropical",
                "surface_water": "unknown",
                "name": "Malastare",
                "diameter": "18880",
                "rotation_period": "26",
                "created": "2014-12-19T17:52:13.106Z",
                "terrain": "swamps, deserts, jungles, mountains",
                "gravity": "1.56",
                "orbital_period": "201",
                "population": "2000000000",
                "pk": 35
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.480Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Dathomir",
                "diameter": "10480",
                "rotation_period": "24",
                "created": "2014-12-19T18:00:40.142Z",
                "terrain": "forests, deserts, savannas",
                "gravity": "0.9",
                "orbital_period": "491",
                "population": "5200",
                "pk": 36
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.481Z",
                "climate": "temperate, arid, subartic",
                "surface_water": "5",
                "name": "Ryloth",
                "diameter": "10600",
                "rotation_period": "30",
                "created": "2014-12-20T09:46:25.740Z",
                "terrain": "mountains, valleys, deserts, tundra",
                "gravity": "1",
                "orbital_period": "305",
                "population": "1500000000",
                "pk": 37
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.483Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Aleen Minor",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T09:52:23.452Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 38
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.485Z",
                "climate": "temperate, artic",
                "surface_water": "unknown",
                "name": "Vulpter",
                "diameter": "14900",
                "rotation_period": "22",
                "created": "2014-12-20T09:56:58.874Z",
                "terrain": "urban, barren",
                "gravity": "1",
                "orbital_period": "391",
                "population": "421000000",
                "pk": 39
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.487Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Troiken",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T10:01:37.395Z",
                "terrain": "desert, tundra, rainforests, mountains",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 40
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.489Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Tund",
                "diameter": "12190",
                "rotation_period": "48",
                "created": "2014-12-20T10:07:29.578Z",
                "terrain": "barren, ash",
                "gravity": "unknown",
                "orbital_period": "1770",
                "population": "0", 
                "pk": 41
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.491Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Haruun Kal",
                "diameter": "10120",
                "rotation_period": "25",
                "created": "2014-12-20T10:12:28.980Z",
                "terrain": "toxic cloudsea, plateaus, volcanoes",
                "gravity": "0.98",
                "orbital_period": "383",
                "population": "705300",
                "pk": 42
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.493Z",
                "climate": "temperate",
                "surface_water": "20",
                "name": "Cerea",
                "diameter": "unknown",
                "rotation_period": "27",
                "created": "2014-12-20T10:14:48.178Z",
                "terrain": "verdant",
                "gravity": "1",
                "orbital_period": "386",
                "population": "450000000",
                "pk": 43
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.495Z",
                "climate": "tropical, temperate",
                "surface_water": "80",
                "name": "Glee Anselm",
                "diameter": "15600",
                "rotation_period": "33",
                "created": "2014-12-20T10:18:26.110Z",
                "terrain": "lakes, islands, swamps, seas",
                "gravity": "1",
                "orbital_period": "206",
                "population": "500000000",
                "pk": 44
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.497Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Iridonia",
                "diameter": "unknown",
                "rotation_period": "29",
                "created": "2014-12-20T10:26:05.788Z",
                "terrain": "rocky canyons, acid pools",
                "gravity": "unknown",
                "orbital_period": "413",
                "population": "unknown",
                "pk": 45
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.498Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Tholoth",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T10:28:31.117Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 46
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.500Z",
                "climate": "arid, rocky, windy",
                "surface_water": "unknown",
                "name": "Iktotch",
                "diameter": "unknown",
                "rotation_period": "22",
                "created": "2014-12-20T10:31:32.413Z",
                "terrain": "rocky",
                "gravity": "1",
                "orbital_period": "481",
                "population": "unknown",
                "pk": 47
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.502Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Quermia",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T10:34:08.249Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 48
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.504Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Dorin",
                "diameter": "13400",
                "rotation_period": "22",
                "created": "2014-12-20T10:48:36.141Z",
                "terrain": "unknown",
                "gravity": "1",
                "orbital_period": "409",
                "population": "unknown",
                "pk": 49
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.506Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Champala",
                "diameter": "unknown",
                "rotation_period": "27",
                "created": "2014-12-20T10:52:51.524Z",
                "terrain": "oceans, rainforests, plateaus",
                "gravity": "1",
                "orbital_period": "318",
                "population": "3500000000",
                "pk": 50
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.508Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Mirial",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T16:44:46.318Z",
                "terrain": "deserts",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 51
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.510Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Serenno",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T16:52:13.357Z",
                "terrain": "rainforests, rivers, mountains",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 52
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.512Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Concord Dawn",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T16:54:39.909Z",
                "terrain": "jungles, forests, deserts",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 53
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.514Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Zolan",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T16:56:37.250Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 54
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.516Z",
                "climate": "frigid",
                "surface_water": "100",
                "name": "Ojom",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T17:27:41.286Z",
                "terrain": "oceans, glaciers",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "500000000",
                "pk": 55
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.517Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Skako",
                "diameter": "unknown",
                "rotation_period": "27",
                "created": "2014-12-20T17:50:47.864Z",
                "terrain": "urban, vines",
                "gravity": "1",
                "orbital_period": "384",
                "population": "500000000000",
                "pk": 56
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.519Z",
                "climate": "temperate",
                "surface_water": "25",
                "name": "Muunilinst",
                "diameter": "13800",
                "rotation_period": "28",
                "created": "2014-12-20T17:57:47.420Z",
                "terrain": "plains, forests, hills, mountains",
                "gravity": "1",
                "orbital_period": "412",
                "population": "5000000000",
                "pk": 57
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.521Z",
                "climate": "temperate",
                "surface_water": "unknown",
                "name": "Shili",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T18:43:14.049Z",
                "terrain": "cities, savannahs, seas, plains",
                "gravity": "1",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 58
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.523Z",
                "climate": "arid, temperate, tropical",
                "surface_water": "unknown",
                "name": "Kalee",
                "diameter": "13850",
                "rotation_period": "23",
                "created": "2014-12-20T19:43:51.278Z",
                "terrain": "rainforests, cliffs, canyons, seas",
                "gravity": "1",
                "orbital_period": "378",
                "population": "4000000000",
                "pk": 59
            }
        },
        {
            "fields": {
                "edited": "2014-12-20T20:58:18.525Z",
                "climate": "unknown",
                "surface_water": "unknown",
                "name": "Umbara",
                "diameter": "unknown",
                "rotation_period": "unknown",
                "created": "2014-12-20T20:18:36.256Z",
                "terrain": "unknown",
                "gravity": "unknown",
                "orbital_period": "unknown",
                "population": "unknown",
                "pk": 60
            }
        }
        ]
        }
            
    

def seed_character_questions

    Question.all.each do |q|   
        Character.all.each do |c|
        cq = CharacterQuestion.new
        cq.character_id = c.id
        cq.question_id = q.id
        case q.category_id
        when 1
            cq.answer = c.name == q.attribute_desc
        when 2
            cq.answer = c.gender == q.attribute_desc 
        when 3
            cq.answer = c.skin_tone == q.attribute_desc  
        when 4
            if q.attribute_desc != 0
                case q.attribute_desc
                when 100
                    cq.answer = c.height <= q.attribute_desc
                when 200
                    cq.answer = c.height >= q.attribute_desc
                end
            else
                cq.answer = c.height == q.attribute_desc
            end
        when 5
            cq.answer = c.eye_color == q.attribute_desc    
        when 6
            cq.answer = c.hair_color == q.attribute_desc
        when 7
            if q.attribute_desc != 0
                case q.attribute_desc
                when 50
                    cq.answer = c.mass <= q.attribute_desc
                when 75
                    cq.answer = c.mass >= q.attribute_desc
                end
            else
                cq.answer = c.mass == q.attribute_desc
            end
        when 8
            cq.answer = c.homeworld == q.attribute_desc
        when 9
            cq.answer = c.species == q.attribute_desc
        when 10
            if q.attribute_desc != 0
                case q.attribute_desc
                when 100
                    cq.answer = c.birth_year <= q.attribute_desc
                when 50
                    cq.answer = c.birth_year <= q.attribute_desc
                end
            else
                cq.answer = c.birth_year == q.attribute_desc
            end            
        else
            puts "update seeds to continue"
        end 
        cq.save
        end
    end



end



def seed_questions
    
    
    names = ["C-3PO", "Darth Vader", "Leia Organa", "Owen Lars", "Beru Whitesun lars", "Biggs Darklighter", "Obi-Wan Kenobi", "Anakin Skywalker", "Wilhuff Tarkin", "Chewbacca", "Han Solo", "Greedo", "Jabba Desilijic Tiure", "Wedge Antilles", "Jek Tono Porkins", "Yoda", "Palpatine", "Boba Fett", "Bossk", "Lando Calrissian", "Lobot", "Ackbar", "Arvel Crynyd", "Wicket Systri Warrick", "Nien Nunb", "Qui-Gon Jinn", "Nute Gunray", "Padmé Amidala", "Jar Jar Binks", "Roos Tarpals", "Rugor Nass", "Ric Olié", "Watto", "Sebulba", "Quarsh Panaka", "Shmi Skywalker", "Darth Maul", "Bib Fortuna", "Ayla Secura", "Dud Bolt", "Gasgano", "Ben Quadinaros", "Mace Windu", "Ki-Adi-Mundi", "Eeth Koth", "Adi Gallia", "Saesee Tiin", "Mon Mothma", "Luke Skywalker", "Finis Valorum", "Yarael Poof", "Plo Koon", "Mas Amedda", "Gregar Typho", "Cordé", "Cliegg Lars", "Poggle the Lesser", "Luminara Unduli", "Barriss Offee", "Dormé", "Dooku", "Bail Prestor Organa", "Jango Fett", "Zam Wesell", "Dexter Jettster", "Lama Su", "Taun We", "Jocasta Nu", "San Hill", "Shaak Ti", "Tarfful", "Raymus Antilles", "Sly Moore", "Tion Medon", "Grievous", "R4-P17", "Wat Tambor", "Ratts Tyerel", "R5-D4", "R2-D2", "IG-88"]
    genders = ["non-binary", "male", "female"]
    skin_tone = ["gold", "pale-white", "fair", "brown-ish", "green-ish", "tan", "dark", "grey-ish", "orange-ish", "red-ish", "blue", "yellow-ish"] 
    eye_colors = ["yellow",  "brown",  "blue", "black", "orange", "hazel",  "red", "pink", "gold", "white",  "green",  "unknown"] 
    hair_colors = [ "none", "brown", "black", "white",  "grey", "blond"]
    home_worlds = ["Tatooine", "Alderaan", "Stewjon", "Eriadu", "Kashyyyk", "Corellia", "Rodia", "Nal Hutta", "Bestine IV", "unknown", "Naboo", "Kamino", "Trandosha", "Socorro", "Bespin", "Mon Cala", "Endor", "Sullust", "Cato Neimoidia", "Toydaria", "Malastare", "Dathomir", "Ryloth", "Vulpter", "Troiken", "Tund", "Haruun Kal", "Cerea", "Iridonia", "Coruscant", "Iktotch", "Chandrila", "Quermia", "Dorin", "Champala", "Geonosis", "Mirial", "Serenno", "Concord Dawn", "Zolan", "Ojom", "Muunilinst", "Shili", "Umbara", "Utapau", "Kalee", "Skako", "Aleen Minor"] 
    species = ["Droid", "Human", "Wookie", "Rodian", "Iktotchi", "Geonosian", "Mon Calamari", "Trandoshan", "Ewok", "Sullustan", "Neimodian", "Gungan", "Toydarian", "Dug", "Zabrak", "Twi'lek", "Vulptereen", "Xexto", "Cerean", "Tholothian", "Quermian", "Kel Dor", "Chagrian", "Mirialan", "Clawdite", "Besalisk", "Muun", "Togruta", "umbaran", "Pau'an", "Kaleesh", "Skakoan", "Aleena"]
    mass = [75, 136, 49, 120, 84, 77, 0, 112, 80, 74, 1, 110, 17, 78, 113, 79, 83, 20, 68, 89, 90, 45, 66, 82, 40, 55, 65, 50, 85, 56, 102, 88, 57, 48, 159, 15, 32, 140] 
    ages = [30, 41, 19, 52, 47, 24, 57, 64, 200, 29, 44, 600, 21, 0, 896, 82, 31, 53, 37, 8, 92, 46, 62, 72, 54, 48, 91, 385, 58, 40, 102, 67, 66, 33, 15]  
    heights = [167, 202, 150, 178, 165, 183, 182, 188, 180, 228, 173, 175, 170, 66, 190, 177, 0, 88, 160, 193, 191, 185, 196, 224, 206, 137, 112, 163, 94, 122, 198, 171, 184, 172, 264, 157, 166, 168, 229, 213, 234, 216, 96, 79, 97, 200] 



    names.each do |name|
        Question.create(question: "Is this mystery character #{name}?", category_id: 1, attribute_desc: name)
    end
    genders.each do |gender|
        Question.create(question: "Is this mystery character likely to identify as #{gender}?", category_id:2, attribute_desc: gender)
    end
    skin_tone.each do |tone|
        Question.create(question: "Does this character have an exterior color (excluding armor) or skin-tone that is #{tone}?", category_id: 3, attribute_desc: tone)
    end
    eye_colors.each do |color|
        if color == "unknown"
            Question.create(question: "Does this character have a known eye color?", category_id: 5, attribute_desc: color)
        else 
            Question.create(question: "Does this character have #{color} eyes?", category_id: 5, attribute_desc: color)
        end
    end
    hair_colors.each do |color|
        if color == "none"
            Question.create(question: "Does this character have hair?", category_id: 6, attribute_desc: color)
        else
            Question.create(question: "Does this character have #{color} hair?", category_id: 6, attribute_desc: color)
        end
    end
    home_worlds.each do |world|
        if world == "unknown"
            Question.create(question: "Does this character have a known home world?", category_id: 8, attribute_desc: world)
        else
            Question.create(question: "Is this character's homeworld #{world}", category_id: 8, attribute_desc: world)
        end
    end
    species.each do |spec|
        if spec == "unknown"
            Question.create(question: "Does this character have a known species?", category_id: 9, attribute_desc: spec)
        else
            Question.create(question: "Is this character a #{spec}?", category_id: 9, attribute_desc: spec)
        end
    end

        Question.create(question: "Does this character have a known Mass?", category_id: 7, attribute_desc: 0)
        Question.create(question: "Does this character have a mass below 50?", category_id: 7, attribute_desc: 50)
        Question.create(question: "does this character have a mass above 75?", category_id: 7, attribute_desc: 75)

        Question.create(question: "Does this character have a known birth year?", category_id: 10, attribute_desc: 0)
        Question.create(question: "Was this character born within 50 years of the Battle of Yavin? (BBY)", category_id: 10, attribute_desc: 50)
        Question.create(question: "Was this character born within 100 years of the Battle of Yavin? (BBY)", category_id: 10, attribute_desc: 100)
    
        Question.create(question: "Does this character have known height?", category_id: 4, attribute_desc: 0)
        Question.create(question: "Is this character under 100cm?", category_id: 4, attribute_desc: 100)
        Question.create(question: "Is this character over 200 cm?", category_id: 4, attribute_desc: 200)
    
end

def seed_categories
    Category.create(name: "Name")
    Category.create(name: "Gender")
    Category.create(name: "Skin tone")
    Category.create(name: "Height")
    Category.create(name: "Eye color")
    Category.create(name: "Hair color")
    Category.create(name: "Mass")
    Category.create(name: "Home world")
    Category.create(name: "Species")
    Category.create(name: "Birth year")
end


def seed_home_world

    new_home_worlds = homeworlds["planets"].map{|c| c["fields"]}
    db_fill_planets = new_home_worlds.map do |planet|
        Homeworld.create(name: planet["name"])
    end
end


def seed_species

    new_species = species["species"].map{|c| c["fields"]}
    db_fill_species = new_species.map do |spec|
        Species.create(name: spec["name"])
    end
end


    
def seed_characters
    
    db_fill_characters = characters["characters"].map do |char|
        Character.create(name: char["name"], 
            image: char["image"], 
            gender: char["gender"], 
            skin_tone: char["skin_tone"], 
            height: char["height"], 
            eye_color: char["eye_color"], 
            hair_color: char["hair_color"], 
            mass: char["mass"],
            homeworld_id: char["homeworld_id"],
            species_id: char["species_id"],
            birth_year: char["birth_year"])
    end
end

# seed_categories
seed_home_world
seed_species
seed_characters
#  seed_questions
# seed_character_questions
