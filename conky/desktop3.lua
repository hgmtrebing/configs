-- vim: ts=4 sw=4 noet ai cindent syntax=lua
--[[
Conky, a system monitor, based on torsmo

Any original torsmo code is licensed under the BSD license

All code written since the fork of torsmo is licensed under the GPL

Please see COPYING for details

Copyright (c) 2004, Hannu Saransaari and Lauri Hakkarainen
Copyright (c) 2005-2012 Brenden Matthews, Philip Kovacs, et. al. (see AUTHORS)
All rights reserved.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--If you are having trouble figuring out what to do, be sure to check the "UNKNOWN" section.
--This is where I placed fields I was not certain how to use or what they did.
--
-- Layout and Position Properties
-- 		-alignment
-- 		-gap_x
-- 		-gap_y
-- 		-border_inner_margin
-- 		-border_outer_margin
-- 		-display
-- 		-maximum_width
-- 		-minimum_height
-- 		-minimum_width
-- 		-own_window
-- 		-own_window_class
-- 		-own_window_hints
--		-own_window_type
--		-xinerama_head
--
-- Coloration
--	 	-default_color
--	 	-default_outline_color
--		-default_shade_color
--		-own_window_argb_value
--		-own_window_argb_visual
--		-own_window_colour
--		-own_window_transparent
--
-- General Appearance
--
--		Bar-Specific
--			-default_bar_height
--			-default_bar_width
--
--		Gauge-Specific
--			-default_gauge_height
--			-default_gauge_width
--		
--		Graph-Specific
--			-default_graph_height
--			-default_graph_width
--			-draw_graph_borders
--			-show_graph_range
--			-show_graph_scale
--		
--		Border-Specific
--			-draw_borders
--			-draw_graph_borders
--			-strippled_borders
--
--		Text and Formatting
--			-extra_newline
--			-font
--			-format_human_readable
--			-max_text_width
--			-override_utf8_locale
--			-pad_percents
--			-short_units
--			-temperature_units
--			-text_buffer_size
--			-times_in_seconds
--			-top_cpu_separate
--			-top_name_verbose
--			-top_name_width
--			-uppercase
--			-use_spacer
--			-use_xft
--			-xftalpha
--
--		General or Unknown
--			-draw_outline
--			-draw_shades
--			-own_window_title
--
-- Alternative Outputs
-- 		-out_to_console
-- 		-out_to_http
-- 		-out_to_ncurses
-- 		-out_to_stderr
-- 		-out_to_x
-- 		-overwrite_file
--
-- General Configuration
--		-total_run_times
--		-update_interval
--		-update_interval_on_battery
--
-- Data Collection
-- 		-diskio_avg_samples
-- 		-cpu_avg_samples
-- 		-format_human_readable
-- 		-hddtemp_host
-- 		-hddtemp_port
-- 		-net_avg_samples
-- 		-net_avg_samples
--
-- Unknown
--		-console_graph_ticks		
--		-disable_auto_reload
--		-imlib_cache_flush_inteveral
--		-imlib_cache_size
--		-max_port_monitor_connections
--		-nvidia_display
--		-templateN
--
--		Local Services Related (I think)
--			-mpd_host
--			-mpd_password
--			-mpd_port
--			-music_player_interval
--
--			-mysql_db
--			-mysql_host
--			-mysql_password
--			-mysql_port
--			-mysql_user
--		
--		Networking Related (I think)
--			-http_refresh
--			-if_up_strictness
--
--		Email Related (I think)
--			-imap (I think this is for email)
--			-mail_spool
--			-pop3
--
--		Embedded Lua Scripts (I think)
--			-lua_draw_hook_post (seems to be related to embedding lua scripts)
--			-lua_draw_hook_pre 
--			-lua_load
--			-lua_shutdown_hook
--			-lua_startup_hook

conky.config = {
    alignment = 'top_right', 			--determines where on the screen Conky displays
    background = false, 				--determines whether Conky is forked to background; does not seem to affect Conky's performance
	border_inner_margin = 5, 			--Margin between border and text, in pixels
	border_outer_margin = 5, 			--Margin between border and edge of the window, in pixels
    border_width = 1, 					--Width of the border
	--console_graph_ticks 				--TBD, not sure what it does
    cpu_avg_samples = 2,
	default_bar_height = 10, 			--Height for bars
	default_bar_width = 10, 			--Width for bars, 0 indicates to expand to fill the window
	--It seems that default bar sizes can be overidden in conky.text
	default_color = "ff0000", 			--default color, accepts Hex values (ff00ff) and keywords ("white")
	default_gauge_height = 25, 			-- default height for gauges
	default_gauge_width = 40, 			-- default width for gauges
	default_graph_height = 25, 			-- Specify a default height for graphs
	default_graph_width = 0, 			-- default width for graphs. If 0, graph will expand to fit width of Conky window
    default_outline_color = 'white', 	--default outline color
    default_shade_color = 'white', 		--default shad color
	disable_auto_reload = false, 		-- Enable to disable the inotify-based auto config reload feature
	diskio_avg_samples = 2, 			-- The number of samples to average foor disk I/O monitoring
	--display 							-- Specify an X display to connect to. I am not sure how to use it.
	double_buffer = true, 				--Use the Xdbe extension(eliminates flicker). I do not notice much of a difference using this.
	draw_borders = true,				-- Draws borders around sections of text
    draw_graph_borders = false,			-- Draws borders around graphs
    draw_outline = false,				-- Draw outlines? In testing, this seriously messed up the appearance of Conky
    draw_shades = false,				-- Draw shades? In testing, this mildly messed up the appearance of Conkey
	extra_newline = false,				-- Puts an extra newline at the end when writing to stdout, useful in certain circumstances
    use_xft = true,
    font = 'Ubuntu Mono:size=13',		--Font name in X
	format_human_readable = true,		--Print byte values in human readable formats
    gap_x = 30, 						--X Gap between Conky and the edge of the screen, based on the 'alignment' property
    gap_y = 60, 						--Y Gap between Conky and the edge of the screen, based on the 'alignment' property
	hddtemp_host = "127.0.0.1",			--Hostname to connect to for hddtemp objects.
	hddtemp_port = "7634",				--Port to use for hddtemp connections. Default is 7634.
	http_refresh = no,					--When this is set the page generated with out_to_http will automatically refresh each interval. Default value is no.
	max_port_monitor_connections = 256,	--Allows each port monitor to track at most this many connections (I am not really sure what this means, but default is 256)
	max_text_width = 0,					--Makes sure that each line is no longer than max_text_width. Use 0 if you want to make sure lines do not get broken
	max_user_text = 16384,				--Maximum size of user text buffer, i.e. text inside conky.text section in config file (default is 16384 bytes) 
	maximum_width = 0,					--Maximum width of the window
    minimum_height = 5,					--Minimum height of the window
	minimum_width = 5,					--Minimum width of the window
    net_avg_samples = 2,				--The number of samples to average for net data
    no_buffers = true,					--Subtract (file system) buffers from used memory
    out_to_console = false,				--Print text to stdout (for instance, the terminal)
	out_to_http = false,				--Let conky act as a small http-server serving it's text (Conky does not recognize this, though it was listed in the wiki)
	out_to_ncurses = false,				--NB - only works if out_to_x is false - Print text in the console, but use ncurses so that conky can print the text of a new update over the old text.
    out_to_stderr = false,				--Print text to stderr	
	out_to_x = true,					--Determines if output should be in X. This must be false to use out_to_ncurses, but true at all other times
	override_utf8_locale = false,		--Force UTF8? requires XFT 
	overwrite_file = "",				--Overwrite the file given as argument. 
    own_window = true,					--Boolean, create own window to draw? 
	own_window_argb_value = 130,			--When ARGB visuals are enabled, this use this to modify the alpha value used. Valid range is 0-255, where 0 is 0% opacity, and 255 is 100% opacity. 
	own_window_argb_visual = true,		--Boolean, use ARGB visual? ARGB can be used for real transparency, note that a composite manager is required for real transparency
    own_window_class = 'Conky',			--Manually set the WM_CLASS name. Defaults to "Conky". 
	own_window_colour = "000000",		--If own_window_transparent no, set a specified background colour (defaults to black). 
	own_window_hints = "undecorated",	--If own_window is yes, you may use these window manager hints to affect the way Conky displays. Notes: Use own_window_type desktop as another way to implement many of these hints implicitly. If you use own_window_type override, window manager hints have no meaning and are ignored. 
	own_window_title = "Conky",			--Manually set the window name. Defaults to "conky (<hostname>)". 
	own_window_transparent = false,		--Boolean, set transparency? If ARGB visual is enabled, sets background opacity to 0%. 	
    own_window_type = 'desktop',		--if own_window is yes, you may specify type normal, desktop, dock, panel or override (default: normal).Desktop windows are special windows that have no window decorations; are always visible on your desktop; do not appear in your pager or taskbar; and are sticky across all workspaces. Panel windows reserve space along a desktop edge, just like panels and taskbars, preventing maximized windows from overlapping them. The edge is chosen based on the alignment option. Override windows are not under the control of the window manager. Hints are ignored. This type of window can be useful for certain situations. 
	pad_percents = 0,					-- 	Pad percentages to this many decimals (0 = no padding) 
	short_units = true,					-- Shortens units to a single character (kiB->k, GiB->G, etc.). Default is off. 
	show_graph_range = true,			-- Shows the time range covered by a graph. 
	show_graph_scale = true,			-- Shows the maximum value in scaled graphs. 
    stippled_borders = 0,				-- Border stippling (dashing) in pixels 
	temperature_unit = "celsius",		--Desired output unit of all objects displaying a temperature. Parameters are either "fahrenheit" or "celsius". The default unit is degree Celsius. 
	text_buffer_size = 256,				--Size of the standard text buffer (default is 256 bytes). This buffer is used for intermediary text, such as individual lines, output from $exec vars, and various other variables. Increasing the size of this buffer can drastically reduce Conky's performance, but will allow for more text display per variable. The size of this buffer cannot be smaller than the default value of 256 bytes. 
	times_in_seconds = true,			--If true, variables that output times output a number that represents seconds. This doesn't affect $time, $tztime and $utime 
	top_cpu_separate = true,			--If true, cpu in top will show usage of one processor's power. If false, cpu in top will show the usage of all processors' power combined. 	
	top_name_verbose = true,			--If true, top name shows the full command line of each process, including arguments (whenever possible). Otherwise, only the basename is displayed. Default value is false. 
	top_name_width = 15,				--Width for $top name value (defaults to 15 characters).
	total_run_times = 0,				--Total number of times for Conky to update before quitting. Zero makes Conky run forever 
    update_interval = 1.0,				--Update Interval
	--update_interval_on_battery = 1.0,	--Update interval when running on batterypower 
    uppercase = false,					--Boolean value, if true, text is rendered in upper case 
    use_spacer = 'none',				--Adds spaces around certain objects to stop them from moving other things around. Arguments are left, right, and none (default). The old true/false values are deprecated and default to right/none respectively. Note that this only helps if you are using a mono font, such as Bitstream Vera Sans Mono. 
	use_xft = true,						--Use Xft (anti-aliased font and stuff) 
	xftalpha = 1,						--Alpha of Xft font. Must be a value at or between 1 and 0. 
}

conky.text = [[
$alignc $nodename 
$alignc $distribution $sysname $kernel $machine

----CPU----

----Memory----

----Storage----

$alignc ----Networking----
Gateway IP: $gw_ip
Ethernet IP: ${addr enp0s31f6} 
Download: ${downspeed enp0s31f6} Upload: ${upspeed enp0s31f6}
${downspeedgraph enp0s31f6 100 10 ffffff ffffff }
Wireless IP: ${addr wlan0}



$alignc ----Processes----
Total Processes: $processes
]]

--conky.text = [[
--${scroll 16 $nodename - $sysname $kernel on $machine | }
--Workspace: $desktop of $desktop_number
--$hr
--${color grey}Uptime:$color $uptime
--${color grey}Frequency (in MHz):$color $freq
--${color grey}Frequency (in GHz):$color $freq_g
--${color grey}RAM Usage:$color $mem/$memmax - $memperc% ${membwlp5s0ar 4}
--${color grey}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapb-ar 4}
--${color grey}CPU Usage:$color $cpu% ${cpubar 4}
--${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
--$hr
--${color grey}File systems:
-- / $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
--${color grey}Networking:
--Up:$color ${upspeed eth0} ${color grey} - Down:$color ${downspeed eth0}
--$hr
--${color grey}Name              PID   CPU%   MEM%
--${color lightgrey} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
--${color lightgrey} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
--${color lightgrey} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
--${color lightgrey} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
--]]
