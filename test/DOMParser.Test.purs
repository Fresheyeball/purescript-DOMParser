module DOMParser.Test where

import DOMParser

import Test.Mocha
import Test.Chai
import Control.Monad.Eff
import Network.MIME

foreign import isDOMParser "function isDOMParser(x){ return !!x.parseFromString; }"
  :: forall e. DOMParser -> Boolean

create = newDOMParser >>= \p ->
  expect (isDOMParser p) `toEqual` true

parseFromStringTest = newDOMParser >>= \p ->
  parseFromString p "<div>Hi</div>" textHtml

main = describe "DOMParser" do
  it "create"          create
  it "parseFromString" parseFromStringTest
