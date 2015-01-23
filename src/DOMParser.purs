module DOMParser where

import Control.Monad.Eff
import Data.Foreign.OOFFI
import Network.MIME
import DOM

foreign import data DOMParser :: *
foreign import data DOMParse  :: !

newDOMParser :: forall e. Eff (domParse :: DOMParse | e) DOMParser
newDOMParser = instantiate0 "DOMParser"

parseFromString :: DOMParser -> String -> MIME -> Node
parseFromString = method2 "parseFromString"
