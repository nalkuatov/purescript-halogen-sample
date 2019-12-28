
module Component.HTML.Search
  ( search, Action(..) )
  where

import Prelude (($), (<<<))

import Component.HTML.Utils
import Data.Maybe

import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

data Action = Search String

search :: forall props. HH.HTML props Action
search 
  = HH.div [ css "container" ] 
      [ HH.input 
          [ css "input is-rounded is-medium is-focused"
          , HP.placeholder "Hero Academia archives ... " 
          , HE.onValueInput $ Just <<< Search
          ]
      ]
