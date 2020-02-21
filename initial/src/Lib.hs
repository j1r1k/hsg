module Lib where

-- type MyName = [string, string]
data MyName = MyName String String deriving (Show)

getFirstName :: MyName -> String
getFirstName (MyName fn _) = fn

-- type MyNameRecord = { firstName: string; lastName: string }
-- record syntax defines 'getters' for us, pattern matching is different
data MyNameRecod = MyNameRecord { firstName :: String, lastName :: String } deriving (Show)

data MyList a = EmptyList | MyCons a (MyList a) deriving (Show)

data NonEmptyList a = NonEmptyList a (MyList a) 

myHeadNel :: NonEmptyList a -> a
myHeadNel (NonEmptyList a _) = a

myLastNel :: NonEmptyList a -> a
myLastNel (NonEmptyList a EmptyList) = a
myLastNel (NonEmptyList _ (MyCons a as)) = case myLast as of Nothing -> a
                                                             Just b -> b


myHead :: MyList a -> Maybe a
myHead EmptyList = Nothing
myHead (MyCons a _) = Just a

myLast :: MyList a -> Maybe a
myLast EmptyList = Nothing
myLast (MyCons a EmptyList) = Just a
myLast (MyCons _ rest) = myLast rest

showLast :: Show a => MyList a -> Maybe String
showLast list =
  do 
      a <- myLast list
      return (show a)


-- Algebraic data type
data State = Started | Stopped | Paused

-- Non total definition (compiler produces warning)
reactToState :: State -> String
-- let for locally scoped definitions (in block following 'in')
reactToState Started = let x = "Howdy" 
                           y = " starting "
                        in (x ++ " we are " ++ let z = "now" in y ++ z)
reactToState Stopped = "Stopping"

someFunc :: IO ()
someFunc = putStrLn "someFunc"