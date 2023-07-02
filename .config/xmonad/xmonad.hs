--
-- Imports
--
import System.Exit (exitSuccess)
import System.IO
import XMonad
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.Tabbed (tabbedAlways, shrinkText, Theme(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce
import Data.Monoid
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86

------------------
-- Config
------------------
myFont                  = "xft:Hack:regular:pixelsize=12"
myModMask               = mod4Mask -- Modkey super
myBorderWidth           = 1
myTerminal              = "urxvt"
myTextEditor            = "nvim"
myPowerMenu             = "powermenu"
myNormalBorderColor     = "#cccccc"
myFocusedBorderColor    = "#ff00bb"
myLauncher              = "rofi -show drun"
myFileManager           = myTerminal ++ " -e ranger"

------------------
-- Audio and player controls
------------------
audioMute           = "pulsemixer --toggle-mute"
audioRaiseVolume    = "pulsemixer --change-volume +5"
audioLowerVolume    = "pulsemixer --change-volume -5"
audioPlayPause      = "playerctl play-pause"
audioStop           = "playerctl stop"
audioNext           = "playerctl next"
audioPrev           = "playerctl previous"

------------------
-- Layout
------------------
myLayouts = toggleLayouts (noBorders Full) (myTiled ||| myTabbed)
    where
        myTiled = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def
        myTabbed = noBorders $ tabbedAlways shrinkText myTabConf

myTabConf = def
    { fontName = "xft:Hack:regular:pixelsize=12"
    , activeColor         = "#267326"
    , activeBorderColor   = "#40bf40"
    , activeTextColor     = "#ffffff"
    , inactiveColor       = "#496749"
    , inactiveBorderColor = "#333333"
    , inactiveTextColor   = "#dddddd"
    , urgentColor         = "#900000"
    , urgentBorderColor   = "#2f343a"
    , urgentTextColor     = "#ffffff"
    }

-----------------
-- Autostart
-----------------
myStartupHook =	do
    spawn "$HOME/.config/polybar/launch.sh &"
    spawnOnce "dunst &"
    spawnOnce "nvidia-settings -l &"
    spawnOnce "udiskie -s &"
    spawnOnce "nitrogen --restore &"

-----------------
-- ManageHook
-- --------------
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
    [ className =? "vlc" 	--> doFloat
    , className =? "mpv" 	--> doFloat
    , className =? "Gimp" 	--> doFloat
    ]

-----------------
-- Keybindings
-----------------
myKeys =
    [ ("M-S-<Esc>",     spawn myPowerMenu)
    , ("M-<Return>",    spawn myTerminal)
    , ("M-<Space>",     spawn myLauncher)
    , ("M-r",           spawn myFileManager)
    , ("M-f",           sendMessage ToggleLayout)
    , ("M-S-q",         kill1) -- Kill focused
    -- Audio keys
    , ("<XF86AudioRaiseVolume>",    spawn audioRaiseVolume)
    , ("<XF86AudioLowerVolume>",    spawn audioLowerVolume)
    , ("<XF86AudioPlay>",           spawn audioPlayPause)
    , ("<XF86AudioMute>",           spawn audioMute)
    , ("<XF86AudioStop>",           spawn audioStop)
    , ("<XF86AudioNext>",           spawn audioNext)
    , ("<XF86AudioPrev>",           spawn audioPrev)
    ]

----------------
-- Main
----------------
main = do
    -- xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
    xmonad $ docks def 
            { manageHook            = manageDocks <+> myManageHook
            , layoutHook            = avoidStruts myLayouts 
            , borderWidth           = myBorderWidth
            , terminal              = myTerminal
            , modMask               = myModMask
            , normalBorderColor     = myNormalBorderColor
            , focusedBorderColor    = myFocusedBorderColor
            , startupHook           = myStartupHook
            } `additionalKeysP` myKeys
