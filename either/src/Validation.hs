{-# LANGUAGE NoImplicitPrelude #-}
module Validation (
    CustomerFieldError(..)
  , CustomerValidationError(..)
  , CustomerNameInput(..)
  , CustomerInput(..)
  , validateNonEmpty
  , validateCustomerId
  , validateName
  , validatePhoneNumber
  , validatePhoneNumbers
  , validateCustomer
) where

import Prelude hiding (Either(..))

import Either (Either(..))
import Model (CustomerId, Name(..), PhoneNumber, Customer(..))

data CustomerFieldError = EmptyNotAllowed | PatternNotMatched deriving (Eq, Show)

data CustomerValidationError = ValidationError String CustomerFieldError deriving (Eq, Show)

data CustomerNameInput = CustomerNameInput String String deriving (Eq, Show)

data CustomerInput = CustomerInput {
    inputCustomerId :: String
  , inputName :: CustomerNameInput
  , inputEmail :: String
  , inputPhoneNumbers :: [String]
} deriving (Eq, Show)

validateNonEmpty :: String -> Either CustomerFieldError String
validateNonEmpty = undefined

validateCustomerId :: String -> Either CustomerFieldError CustomerId
validateCustomerId = undefined

validateName :: CustomerNameInput -> Either CustomerFieldError Name
validateName = undefined

validatePhoneNumber :: String -> Either CustomerFieldError PhoneNumber
validatePhoneNumber = undefined

validatePhoneNumbers :: [String] -> Either CustomerFieldError [PhoneNumber]
validatePhoneNumbers = undefined

validateCustomer :: CustomerInput -> Either CustomerValidationError Customer
validateCustomer = undefined