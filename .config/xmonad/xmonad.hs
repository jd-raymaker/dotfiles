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
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce
import Data.Monoid
import qualified XMonad.StackSet as W
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

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
-- Layout
------------------
myLayoutHook = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def

-----------------
-- Autostart
-----------------
myStartupHook =	do
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
    [ ("M-S-<Esc>", spawn myPowerMenu)              -- Quit xmonad
    , ("M-<Return>", spawn myTerminal)              -- Spawn terminal
    , ("M-S-q", kill1)                              -- Kill focused
    , ("M-<Space>", spawn myLauncher)               -- Open rofi 
    , ("M-r", spawn myFileManager)                  -- Open Ranger
    , ("M-f", sendMessage (T.Toggle "floats"))      -- Set to float
    , ("M-S-f", withFocused $ windows . W.sink)     -- Push to tile
    ]

----------------
-- Main
----------------
main = do
    xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
    xmonad $ docks def 
            { manageHook            = manageDocks <+> myManageHook
            , layoutHook            = avoidStruts myLayoutHook 
            , borderWidth           = myBorderWidth
            , terminal              = myTerminal
            , modMask               = myModMask
            , normalBorderColor     = myNormalBorderColor
            , focusedBorderColor    = myFocusedBorderColor
            , startupHook           = myStartupHook
            } `additionalKeysP` myKeys
