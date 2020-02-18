{-# LANGUAGE NoImplicitPrelude #-}

module Lib where

import Prelude hiding (Either(..))

import Either (Either(..))

someFunc :: IO ()
someFunc = putStrLn "someFunc"