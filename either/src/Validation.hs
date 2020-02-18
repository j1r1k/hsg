{-# LANGUAGE NoImplicitPrelude #-}
module Validation (
    CustomerFieldError(..)
  , CustomerValidationError(..)
  , CustomerValidation
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

type CustomerValidation a = Either CustomerValidationError a

data CustomerNameInput = CustomerNameInput String String deriving (Eq, Show)

data CustomerInput = CustomerInput {
    inputCustomerId :: String
  , inputName :: CustomerNameInput
  , inputEmail :: String
  , inputPhoneNumbers :: [String]
} deriving (Eq, Show)

validateNonEmpty :: String -> CustomerValidation String
validateNonEmpty = undefined

validateCustomerId :: String -> CustomerValidation CustomerId
validateCustomerId = undefined

validateName :: CustomerNameInput -> CustomerValidation Name
validateName = undefined

validatePhoneNumber :: String -> CustomerValidation PhoneNumber
validatePhoneNumber = undefined

validatePhoneNumbers :: [String] -> CustomerValidation [PhoneNumber]
validatePhoneNumbers = undefined

validateCustomer :: CustomerInput -> CustomerValidation Customer
validateCustomer = undefined