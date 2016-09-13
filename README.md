## Surface Pro 3 AutoHotkey
An AutoHotkey script to customize Surface Pro 3 pen buttons

### Quick Start
1. Download AHKHID (`AHKHID.ahk`) from [https://raw.githubusercontent.com/jleb/AHKHID/master/AHKHID.ahk](https://raw.githubusercontent.com/jleb/AHKHID/master/AHKHID.ahk)
2. Download `Pen.ahk` from above, and save it to the same directory.
3. Open `Pen.ahk` in your favorite code editor, and navigate to the function that starts with `PenCallback(input)`
  * Inside of this function, you should see if statements that coorespond to pen events.
  * Add any AutoHotkey commands you want inside of the curly brackets.
4. Double-click `Pen.ahk` to run the script.
5. Success!

### Pen Events
All events are fired constantly, except for `PEN_NOT_HOVERING`.
* `PEN_NOT_HOVERING`: The pen is away from the screen. This is called only once, when you move the pen out of range.
* `PEN_HOVERING`: The pen is hovering above the screen.
* `PEN_TOUCHING`: The pen is touching the screen.
* `PEN_1ST_BTN_HOVERING`: The 1st pen button is pressed (closest to the tip), and the pen is hovering above the screen.
* `PEN_1ST_BTN_TOUCHING`: The 1st button is pressed, and the pen is touching the screen.
* `PEN_2ND_BTN_HOVERING`: The 2nd button is pressed, and the pen is hovering above the screen.
* `PEN_2ND_BTN_TOUCHING`: The 2nd button, and the pen is touching the screen.

### Acknowledgements
* [TheGood (AHK Forums)](https://autohotkey.com/board/topic/38015-ahkhid-an-ahk-implementation-of-the-hid-functions/) / [jleb (Github)](https://github.com/jleb/AHKHID) for writing AHKHID.
* [Randy31416 (AHK Forums)](https://autohotkey.com/boards/viewtopic.php?t=7589#p45235) for providing some good starting material.
