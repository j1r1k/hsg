module Main where

import Test.Hspec (SpecWith, hspec, describe, it, shouldBe)

import Lib

listSpec :: SpecWith ()
listSpec = describe "MyList" $
    do describe "myHead" $
         do it "should work for empty list" (
                  -- backticks for function used in infix position
                  myHead (EmptyList :: MyList Int) `shouldBe` Nothing
                  )
            it "should work for singleton list" (
                  myHead (MyCons 1 EmptyList :: MyList Int) `shouldBe` Just 1
                  )
            it "should work for two element list" (
                  myHead (MyCons 1 (MyCons 2 EmptyList) :: MyList Int) `shouldBe` Just 1
                  )
       describe "myLast" $
         do it "should work for empty list" (
                  myLast (EmptyList :: MyList Int) `shouldBe` Nothing
                  )
            it "should work for singleton list" (
                  myLast (MyCons 1 EmptyList :: MyList Int) `shouldBe` Just 1
                  )
            it "should work for two element list" (
                  myLast (MyCons 1 (MyCons 2 EmptyList) :: MyList Int) `shouldBe` Just 2
                  )

main :: IO ()
main = hspec listSpec