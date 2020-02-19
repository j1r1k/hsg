{-# LANGUAGE NoImplicitPrelude #-}
module ValidationSpec where

import Prelude hiding (Either(..))

import Test.Hspec (Spec, describe, it, shouldBe)

import Either (Either(..))
import Validation (CustomerFieldError(..), validateNonEmpty)

validationSpec :: Spec
validationSpec = 
  describe "Validation" $
    do describe "validateNonEmpty" $
         do it "should fail on empty string" (
              validateNonEmpty "" `shouldBe` Left EmptyNotAllowed)
            it "should permit non-empty string" (
              let str = "some string" in
                validateNonEmpty str `shouldBe` Right str)