
module Data.Hero 
  ( mockHeroes
  , Hero
  , _name
  , _organization
  )
  where

import Data.Monoid ((<>))
import Prelude (class Show)

newtype Hero = Hero
  { name :: String
  , organization :: String
  }

instance showHero :: Show Hero
  where
    show (Hero hero) = hero.name <> " from " <> hero.organization

mockHeroes ::  Array Hero
mockHeroes =
  [ Hero { name: "Izuku Midoriya", organization: "UA Students" }
  , Hero { name: "Katsuki Bakugo", organization: "UA Students" }
  , Hero { name: "Eraser Head", organization: "UA High Teachers" }
  , Hero { name: "Cementos", organization: "UA High Teachers" }
  , Hero { name: "Recovery Girl", organization: "UA High Staff" }
  , Hero { name: "No. 13", organization: "UA High Staff" }
  , Hero { name: "Mirio Togata", organization: "The Big 3" }
  ]

_name :: Hero -> String
_name (Hero hero) = hero.name

_organization :: Hero -> String
_organization (Hero hero) = hero.organization
