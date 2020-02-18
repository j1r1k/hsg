{-# LANGUAGE NoImplicitPrelude #-}

module Either (
  Either(Left, Right)
) where

import Prelude hiding (Either(..))

data Either l a = Left l | Right a deriving (Eq, Ord, Show)

instance Functor (Either l) where
  fmap = undefined

instance Applicative (Either l) where
  pure = undefined
  (<*>) = undefined