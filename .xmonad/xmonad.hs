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

------------------
-- Config
------------------
myFont 			= "xft:Hack:regular:pixelsize=12"
myModMask 		= mod4Mask -- Modkey super
myTerminal 		= "urxvt"
myTextEditor 		= "nvim"
myBorderWidth 		= 2
myNormalBorderColor 	= "#cccccc"
myFocusedBorderColor 	= "#ff00bb"

------------------
-- Layout
------------------
myLayoutHook = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def

-----------------
-- Autostart
-----------------
myStartupHook =	do
	spawnOnce "compton &"
	spawnOnce "nitrogen --restore &"

-----------------
-- Keybindings
-----------------
myKeys = [ ("M-C-r", spawn "xmonad --recompile") 	-- Recompile xmonad
	 , ("M-S-r", spawn "xmonad --restart") 		-- Restart xmonad
	 , ("M-S-e", io exitSuccess) 			-- Quit xmonad
	 , ("M-<Return>", spawn myTerminal) 		-- Spawn terminal
	 , ("M-q", kill1) 				-- Kill focused
	 ]

----------------
-- Main
----------------
main = do
	xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
	xmonad $ docks def 
		 { manageHook = manageDocks <+> manageHook defaultConfig
		 , layoutHook = avoidStruts $ myLayoutHook 
		 , borderWidth 		= myBorderWidth
		 , terminal 		= myTerminal
		 , normalBorderColor 	= myNormalBorderColor
		 , focusedBorderColor 	= myFocusedBorderColor
		 , startupHook 		= myStartupHook
		 } `additionalKeysP` 	myKeys
