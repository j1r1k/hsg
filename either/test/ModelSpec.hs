module ModelSpec where

import Test.Hspec (Spec, describe, it, shouldBe)

import Model (
    getCustomerId
  , makeCustomerId
  , getEmail
  , makeEmail
  , getPhoneNumber
  , makePhoneNumber
  )

modelSpec :: Spec
modelSpec = describe "Model" (
  do describe "makeCustomerId" (
       do it "fails with empty string" (
            makeCustomerId "" `shouldBe` Nothing)
          it "creates an id from alphanum string" (
            let str = "r2d2" in
              fmap getCustomerId (makeCustomerId str) `shouldBe` Just str)
       )
     describe "makeEmail" (
       do it "fails with empty string" (
             makeCustomerId "" `shouldBe` Nothing)
          it "fails with incompatible string" (
             makeEmail "c3po" `shouldBe` Nothing)
          it "creates an email from compatible string" (
             let str = "john@wayne.com" in
               fmap getEmail (makeEmail str) `shouldBe` Just str)
       )
     describe "makePhoneNumber" (
       do it "fails with empty string" (
             makePhoneNumber "" `shouldBe` Nothing)
          it "fails with incompatible string" (
             makePhoneNumber "18 Hilton St." `shouldBe` Nothing)
          it "creates a phone number from compatible string" (
             let str = "00420123456789" in
               fmap getPhoneNumber (makePhoneNumber str) `shouldBe` Just str)
          it "creates a phone number from compatible string beginning with plus" (
             let str = "+420123456789" in
               fmap getPhoneNumber (makePhoneNumber str) `shouldBe` Just str)
       )
  )