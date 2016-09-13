# Surface Pro 3 AutoHotkey
An AutoHotkey script to customize Surface Pro 3 pen buttons

## Quick Start
1. Create a new folder somewhere to store everything.
2. Download AHKHID (`AHKHID.ahk`) from [https://raw.githubusercontent.com/jleb/AHKHID/master/AHKHID.ahk](https://raw.githubusercontent.com/jleb/AHKHID/master/AHKHID.ahk)
3. Download `Pen.ahk` from above, and save it to the same folder.
4. Open `Pen.ahk` in your favorite text editor, and navigate to the section that starts with `PenCallback(input)`
    * Inside of this function, you should see If statements that correspond to pen events.
    * Add any AutoHotkey commands you want inside of the curly brackets!
    * See the [examples](#examples) section for samples of things I tried.
5. Double-click `Pen.ahk` to run the script.
6. Success!

## Pen Events
* `PEN_NOT_HOVERING`: The pen is away from the screen. This is only sometimes fired.
* `PEN_HOVERING`: The pen is hovering above the screen.
* `PEN_TOUCHING`: The pen is touching the screen.
* `PEN_1ST_BTN_HOVERING`: The 1st pen button is pressed (closest to the tip), and the pen is hovering above the screen.
* `PEN_1ST_BTN_TOUCHING`: The 1st button is pressed, and the pen is touching the screen.
* `PEN_2ND_BTN_HOVERING`: The 2nd button is pressed, and the pen is hovering above the screen.
* `PEN_2ND_BTN_TOUCHING`: The 2nd button, and the pen is touching the screen.

Pen events are fired when the pen changes state. If you would like it to be fired continuously, change the line with `LimitPenCallback(proc)` to `PenCallback(proc)`.

## Examples
* **When clicking the 2nd button, do a right-click**

    Change the `PEN_2ND_BTN_HOVERING` section to the following:

    ```
    if(input = PEN_2ND_BTN_HOVERING) {
        Click right
    }
    ```
* **When clicking the 2nd button, press an imaginary function key**

    Change the `PEN_2ND_BTN_HOVERING` section to the following:

    ```
    if(input = PEN_2ND_BTN_HOVERING) {
        Send {F13} ; F13-F24 is the valid range
    }
    ```

    Useful for drawing programs like [Krita](https://krita.org/), where you can map keys to do things.

    For instance, to make the 2nd button open the popup palette in Krita (3.0), go to *Settings > Configure Krita*. Under *Canvas Input Settings > Show Popup Palette*, add a shortcut. Change the type to *Key Combination*.

    Under the input section, click the 2nd button on the pen. It should show that `F13` is selected.

    Now when you click the 2nd button in Krita, the popup palette should show up!

* **Do a middle-click drag while holding down the 1st button and hovering**

    Change the `PEN_1ST_BTN_HOVERING` section to the following:

    ```
    if(input = PEN_1ST_BTN_HOVERING) {
        Click Middle down
    } else if(lastInput = PEN_1ST_BTN_HOVERING) {
        Click Middle up
    }
    ```

    We use the Else-If to find out when to release the middle click. If the last input was `PEN_1ST_BTN_HOVERING`, then we know we've changed states and we should release the key.

## Acknowledgements
* [TheGood (AHK Forums)](https://autohotkey.com/board/topic/38015-ahkhid-an-ahk-implementation-of-the-hid-functions/) / [jleb (Github)](https://github.com/jleb/AHKHID) for writing AHKHID.
* [Randy31416 (AHK Forums)](https://autohotkey.com/boards/viewtopic.php?t=7589#p45235) for providing some good starting material.
