
module Page.Home 
  ( component )
  where


import Component.HTML.Utils

import Component.HTML.HeroList (heroList)
import Component.HTML.Search (search, Action(..))
import Data.Array (filter)
import Data.Hero (mockHeroes, _name, _organization)
import Data.String (Pattern(..), contains, toLower)
import Halogen as H
import Halogen.HTML as HH
import Prelude (($), Unit, Void, (==))

type State = { pattern :: String }

component :: forall q i m. H.Component HH.HTML q i Void m
component = 
  H.mkComponent 
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

render :: forall m. State -> HH.ComponentHTML Action () m
render state = 
  let 
    heroes = 
      if state.pattern == "" then [] 
      else filter 
            (\h -> contains 
                    (Pattern $ toLower state.pattern) 
                    $ toLower $ _name h) 
            mockHeroes
  in
    HH.div 
      [ css "container" ]
      [ HH.div 
          [ css "columns is-centered" ]
          [ HH.div 
              [ css "column is-7" ]
              [ HH.br_
              , HH.br_
              , search
              , HH.hr_
              , heroList heroes
              ]
          ]
      ]

handleAction :: forall m. Action -> H.HalogenM State Action () Void m Unit
handleAction = case _ of 
  Search value -> H.modify_ _ { pattern = value }

initialState :: forall i. i -> State
initialState _ = { pattern: "" }
