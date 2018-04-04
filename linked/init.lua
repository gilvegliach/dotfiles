local mods = {"cmd", "alt"}
local allMods = {"cmd", "alt", "control"}

hs.window.animationDuration = 0

require("hs.application")
require("hs.window")


mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 1 second
    mouseCircleTimer = hs.timer.doAfter(1, function() mouseCircle:delete() end)
end
-- TODO: this keybinding overrides the show-dock one
hs.hotkey.bind(mods, "D", mouseHighlight)

-- move window to prev monitor
hs.hotkey.bind(mods, 'j', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local prevScreen = screen:previous()
        local max = prevScreen:frame()

        f.x = max.x
        f.y = max.y
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- move window to next monitor
hs.hotkey.bind(mods, 'k', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local nextScreen = screen:previous()
        local max = nextScreen:frame()

        f.x = max.x
        f.y = max.y
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- x, y, w, h are higher-order functions
function resizeWindow(x, y, w, h)
	return function()
		if hs.window.focusedWindow() then
        	local win = hs.window.focusedWindow()
			local f = win:frame()
			local screen = win:screen()
			local max = screen:frame()

			f.x = x(max)
			f.y = y(max)
			f.w = w(max)
			f.h = h(max)
			win:setFrame(f)
		else
        	hs.alert.show("No active window")
		end
	end
end

-- left half screen
hs.hotkey.bind(mods, 'left', 
	resizeWindow(
		function (s) return s.x end,
	 	function (s) return s.y end,
		function (s) return s.w / 2 end,
		function (s) return s.h end))

-- right half screen
hs.hotkey.bind(mods, 'right', 
	resizeWindow(
		function (s) return s.x + s.w / 2 end,
	 	function (s) return s.y end,
		function (s) return s.w / 2 end,
		function (s) return s.h end))


-- top half screen
hs.hotkey.bind(mods, 'up', 
	resizeWindow(
		function (s) return s.x end,
	 	function (s) return s.y end,
		function (s) return s.w end,
		function (s) return s.h / 2 end))

-- bottom half screen
hs.hotkey.bind(mods, 'down', 
	resizeWindow(
		function (s) return s.x end,
	 	function (s) return s.y + s.h / 2 end,
		function (s) return s.w end,
		function (s) return s.h / 2 end))

-- fullscreen
hs.hotkey.bind(mods, 'f', 
	resizeWindow(
		function (s) return s.x end,
	 	function (s) return s.y end,
		function (s) return s.w end,
		function (s) return s.h end))

-- top left one quarter screen
hs.hotkey.bind(mods, 'home', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- top right one quarter screen
hs.hotkey.bind(mods, 'pageup', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- bottom left one quarter screen
hs.hotkey.bind(mods, 'pagedown', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- bottom right one quarter screen
hs.hotkey.bind(mods, 'end', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)


-- reload config on write
function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-- show window hints
hs.hotkey.bind(mods, 'o', function()
    hs.hints.windowHints()
end)
