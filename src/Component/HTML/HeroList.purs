
module Component.HTML.HeroList 
  ( heroList )
  where

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Elements as HE

import Prelude (($), map)
import Data.Hero (_name, Hero, _organization)
import Component.HTML.Utils

heroList 
  :: forall props actions
   . Array Hero 
  -> HH.HTML props actions
heroList heroes = 
  HH.div_ (renderHero `map` heroes)

renderHero :: forall props actions. Hero -> HH.HTML props actions
renderHero hero = 
  HH.div [ css "box" ]
    [ HH.h6 [ css "subtitle is-6" ]
        [ HH.text $ _organization hero ]
    , HH.hr_
    , HH.h5 [ css "title is-5" ]
        [ HH.text $ _name hero ]
    ]
