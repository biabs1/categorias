module Tela where

import qualified System.Process as SP
import Control.Monad
import Data.Time
import System.IO

sleep :: Float -> IO()
sleep total = do 
  t1 <- getCurrentTime
  sleep' t1 total

sleep' :: UTCTime -> Float -> IO()
sleep' t1 total = do
       t2 <- getCurrentTime
       let time = ( realToFrac $ diffUTCTime t2 t1 :: Float) 
       if total > time then sleep' t1 total 
                       else return ()

limparTela = do
  _ <- SP.system "reset"
  return ()
