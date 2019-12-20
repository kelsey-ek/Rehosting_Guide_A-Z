# Screen Quick Reference

## Purpose

The ```screen``` command in Linux provides the ability to launch and use multiple shell sessions from a single ssh session. When a process is started with ‘screen’, the process can be detached from session & then can reattach the session at a later time. When the session is detached, the process that was originally started from the screen is still running and managed by the screen itself. The process can then re-attach the session at a later time, and the terminals are still there, the way it was left.

HiDB Loads...

## Basic

| Description 				            | Command 				       |
|---------------------------------------|------------------------------|
| Start a new session with session name | `screen -S <session_name>`   |
| List running sessions / screens	    | `screen -ls`				   |
| Attach to a running session		    | `screen -x`				   |
| Attach to a running session with name	| `screen -r <session_name>`   |
| Detach a running session		        | `screen -d <session_name>`   |

## Scripting

| Description                       | Command                                 |
|-----------------------------------|-----------------------------------------|
| send a command to a named session | `screen -S <session-name> -X <command>` |

## Escape Key

All screen commands are prefixed by an escape key, by default Ctrl-a (that's Control-a, sometimes written ^a).

## Getting Out

| Description				        | Command						                        |
|-----------------------------------|-------------------------------------------------------|
| detach 				            | `Ctrl-a d`						                    |
| detach and logout (quick exit) 	| `Ctrl-a D D`						                    |
| exit screen 				        | `Ctrl-a :` quit or exit all of the programs in screen.|
| force-exit screen 			    | `Ctrl-a C-\` (not recommended) 			            |

## Help

| Description	| Command			            |
|---------------|-------------------------------|
| See help	    | `Ctrl-a ?` (Lists keybindings)|

## Window Management

| Description				            | Command								                                |
|---------------------------------------|-----------------------------------------------------------------------|
| Create new window 			        | `Ctrl-a c`								                            |
| Change to last-visited active window 	| `Ctrl-a Ctrl-a` (commonly used to flip-flop between two windows)   	|
| Change to window by number 		    | `Ctrl-a <number>` (only for windows 0 to 9)				            |
| Change to window by number or name 	| `Ctrl-a ' <number or title>`				                    		|
| Change to next window in list 	    | `Ctrl-a n` or `Ctrl-a <space>`			                     		|
| Change to previous window in list 	| `Ctrl-a p` or `Ctrl-a <backspace>`			                		|
| See window list 			            | `Ctrl-a "` (allows you to select a window to change to)	        	|
| Show window bar 			            | `Ctrl-a w` (if you don't have window bar)		                   		|
| Kill current window 			        | `Ctrl-a k` (not recommended)				                     		|
| Kill all windows 			            | `Ctrl-a \` (not recommended)				                     		|
| Rename current window 		        | `Ctrl-a A`								                            |

## Split screen

| Description				            | Command					|
|---------------------------------------|---------------------------|
| Split display horizontally 		    | `Ctrl-a S`			    |
| Split display vertically 	        	| `Ctrl-a |` or `Ctrl-a V`  |
| Jump to next display region    		| `Ctrl-a tab`			    |
| Remove current region 		        | `Ctrl-a X`			    |
| Remove all regions but the current one| `Ctrl-a Q`				|

## Misc

| Description						                    | Command							                                	|
|-------------------------------------------------------|-----------------------------------------------------------------------|
| Redraw window 					                    | `Ctrl-a C-l`								                            |
| Enter copy mode 					                    | `Ctrl-a [` or `Ctrl-a <esc>` (also used for viewing scrollback buffer)|
| Paste 					                        	| `Ctrl-a ]`							                             	|
| Monitor window for activity            				| `Ctrl-a M`							                            	|
| Monitor window for silence 	            			| `Ctrl-a _`						                             		|
| Enter digraph (for producing non-ASCII characters) 	| `Ctrl-a Ctrl-v`					                            		|
| Lock (password protect) display 		            	| `Ctrl-a x`					                             			|
| Enter screen command 			                  		| `Ctrl-a :`				                             				|
| Enable logging in the screen session 		         	| `Ctrl-a H`							

## Examples

1. Open a screen by typing the command ```screen```

2. Enter this simple infinite while loop:

```bash
while true;
do 
	echo "Do Something"
	sleep 5
done
```

3. Detach from the screen ```Ctrl + d```

4. List the open Screens with ```screen -ls``` You will see an output that looks like the following:

```
There is a screen on:
	14705.pts1.hostname (Detached)
1 Socket in /var/run/screen/S-oframe.
```

5. To reattach to the screen, type ```screen -r 14705```


