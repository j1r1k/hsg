{-# LANGUAGE NoImplicitPrelude #-}

module EitherSpec where

import Prelude hiding (Either(..))

import Test.Hspec (Spec, describe)
import Test.Hspec.Checkers (testBatch)
import Test.QuickCheck.Checkers (EqProp(..))
import qualified Test.QuickCheck.Classes as Classes (applicative, functor)
import Test.QuickCheck (Arbitrary(..), oneof, property)

import Either (Either(..))

newtype EW l a = EW (Either l a) deriving (Eq, Show)

instance Functor (EW l) where
  fmap f (EW e) = EW (fmap f e) 

instance Applicative (EW l) where
  pure = EW . pure
  EW a1 <*> EW a2 = EW (a1 <*> a2)

instance (Arbitrary l, Arbitrary a) => Arbitrary (EW l a) where
  arbitrary = oneof [fmap (EW . Left) arbitrary, fmap (EW . Right) arbitrary]
  shrink (EW (Left x))  = [ EW $ Left  x' | x' <- shrink x ]
  shrink (EW (Right y)) = [ EW $ Right y' | y' <- shrink y ]

instance (EqProp l, EqProp a) => EqProp (EW l a) where
  EW (Right a1) =-= EW (Right a2) = a1 =-= a2
  EW (Left l1) =-= EW (Left l2) = l1 =-= l2
  _ =-= _  = property False

eitherSpec :: Spec
eitherSpec = describe "Either" (
  do pure ()
    -- testBatch (Classes.functor (undefined :: EW Int (Int, Int, Int))) 
    -- testBatch (Classes.applicative (undefined :: EW Int (Int, Int, Int))) 
  )
          