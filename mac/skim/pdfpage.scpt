on run argv
    set fileName to (item 1 of argv)
    set pageNum to (item 2 of argv) as integer

    tell application "Skim"
        open fileName
        tell document 1 to go to page pageNum
        activate
    end tell
tell application "Skim"
	tell document 1
			set view settings to {scale factor:3.0, auto scales:false}
	end tell
end tell
end run
