{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (lines, putStrLn)

import Data.ByteString.Lazy (ByteString)
import Data.Char (ord)
import Data.Foldable (for_)
import Data.Word (Word8)
import qualified Data.ByteString.Lazy as ByteString
import qualified Data.ByteString.Lazy.Char8 as ByteString8

newline :: Word8
newline
  = fromIntegral
  $ ord '\n'

lines
  :: ByteString
  -> [ByteString]
lines
  = ByteString.split newline

putStrLn
  :: ByteString
  -> IO ()
putStrLn bytestring = do
  ByteString.putStr bytestring
  ByteString8.putStrLn ""

main
  :: IO ()
main = do
  bytestring <- ByteString.getContents
  start (lines bytestring)
  where
    start ("\144\&0;0;8q\"1;1":bytestrings) = do
      -- enter Sixtel mode
      putStrLn "\ESCPq\"1;1"
      continue bytestrings
    continue ["\156",""] = do
      -- exit Sixtel mode
      putStrLn "\ESC\\"
    continue (bytestring:bytestrings) = do
      putStrLn bytestring
      continue bytestrings
