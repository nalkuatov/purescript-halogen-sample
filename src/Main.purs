
module Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Halogen.Aff (awaitBody)
import Halogen.VDom.Driver (runUI)
import Page.Home (component)

main :: Effect Unit
main = launchAff_ do
  body <- awaitBody
  runUI component unit body
