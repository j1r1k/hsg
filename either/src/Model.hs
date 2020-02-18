module Model (
    CustomerId
  , getCustomerId
  , makeCustomerId
  , Name(..)
  , Email
  , getEmail
  , makeEmail
  , PhoneNumber
  , getPhoneNumber
  , makePhoneNumber
  , Customer(..)
) where

import Text.Regex.TDFA ((=~))

newtype CustomerId = CustomerId { getCustomerId :: String } deriving (Eq, Show)

makeCustomerId :: String -> Maybe CustomerId
makeCustomerId str = if str =~ idRegex then Just (CustomerId str) else Nothing
  where idRegex = "^[a-zA-Z0-9]+$"

data Name = Name { getFirstName :: String, getLastName :: String } deriving (Eq, Show)

newtype Email = Email { getEmail :: String } deriving (Eq, Show)

makeEmail :: String -> Maybe Email
makeEmail str = if str =~ emailRegex then Just (Email str) else Nothing
  where emailRegex = "^[a-zA-Z0-9+._-]+@[a-zA-Z-]+\\.[a-z]+$"

newtype PhoneNumber = PhoneNumber { getPhoneNumber :: String } deriving (Eq, Show)

makePhoneNumber :: String -> Maybe PhoneNumber
makePhoneNumber str = if str =~ phoneRegex then Just (PhoneNumber str) else Nothing
  where phoneRegex = "^\\+?[0-9]+$"

data Customer = Customer {
      customerId :: CustomerId
    , name :: Name
    , email :: Email
    , phoneNumbers :: [PhoneNumber]
} deriving (Eq, Show)