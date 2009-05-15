--
-- XMonad Config created by Clayton Ferris
-- an evolving configuration file...
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmonad $ defaultConfig {
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ layoutHook defaultConfig
        }
