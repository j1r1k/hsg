import Test.Hspec (hspec)

import EitherSpec (eitherSpec)
import ModelSpec (modelSpec)
import ValidationSpec (validationSpec)

main :: IO ()
main = hspec $ do
  modelSpec
  eitherSpec
  validationSpec
