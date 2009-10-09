--
-- XMonad Config created by Clayton Ferris
-- an evolving configuration file...
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.DecorationMadness
import XMonad.Util.Run
import System.IO

mylayout = avoidStruts $ tabbed shrinkText defaultTheme ||| tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 2/3
        delta = 3/100

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal = "urxvt"
        , borderWidth = 1
        , normalBorderColor = "grey30"
        , focusedBorderColor = "#aecf96"
        , workspaces = ["1:term", "2:web", "3:dev", "4:comm", "5:misc"]
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = mylayout
        , logHook = dynamicLogWithPP $ xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        }
