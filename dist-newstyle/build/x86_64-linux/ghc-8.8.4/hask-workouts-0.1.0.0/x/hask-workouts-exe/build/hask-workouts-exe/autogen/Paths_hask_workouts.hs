{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hask_workouts (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/malandr/.cabal/bin"
libdir     = "/home/malandr/.cabal/lib/x86_64-linux-ghc-8.8.4/hask-workouts-0.1.0.0-inplace-hask-workouts-exe"
dynlibdir  = "/home/malandr/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/malandr/.cabal/share/x86_64-linux-ghc-8.8.4/hask-workouts-0.1.0.0"
libexecdir = "/home/malandr/.cabal/libexec/x86_64-linux-ghc-8.8.4/hask-workouts-0.1.0.0"
sysconfdir = "/home/malandr/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hask_workouts_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hask_workouts_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hask_workouts_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hask_workouts_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hask_workouts_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hask_workouts_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
