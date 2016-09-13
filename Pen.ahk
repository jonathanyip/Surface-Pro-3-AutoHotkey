; Set up our Pen constants
global PEN_NOT_HOVERING := 0x0      ; Pen is moved away from screen.
global PEN_HOVERING := 0x1          ; Pen is hovering above screen.
global PEN_TOUCHING := 0x3          ; Pen is touching screen.
global PEN_1ST_BTN_HOVERING := 0x9  ; 1st button is pressed.
global PEN_1ST_BTN_TOUCHING := 0x11 ; 1st button is pressed, pen is touching screen.
global PEN_2ND_BTN_HOVERING := 0x5  ; 2nd button is pressed.
global PEN_2ND_BTN_TOUCHING := 0x7  ; 3nd button is pressed, pen is touching screen.

; Respond to the Pen inputs
; Fill this section with your favorite AutoHotkey scripts.
PenCallback(input) {
    if (input = PEN_NOT_HOVERING) {

    }

    if(input = PEN_HOVERING) {

    }

    if(input = PEN_TOUCHING) {

    }

    if(input = PEN_1ST_BTN_HOVERING) {

    }

    if(input = PEN_1ST_BTN_TOUCHING) {

    }

    if(input = PEN_2ND_BTN_HOVERING) {

    }

    if(input = PEN_2ND_BTN_TOUCHING) {

    }
}

; Include AHKHID
#include AHKHID.ahk

; Set up other constants
; USAGE_PAGE and USAGE might change on different devices...
WM_INPUT := 0xFF

USAGE_PAGE := 13
USAGE := 2

; Set up AHKHID constants
AHKHID_UseConstants()

; Register the Pen
AHKHID_AddRegister(1)
AHKHID_AddRegister(USAGE_PAGE, USAGE, A_ScriptHwnd, RIDEV_INPUTSINK)
AHKHID_Register()

; Intercept WM_INPUT
OnMessage(WM_INPUT, "InputMsg")

; Callback for WM_INPUT
; Isolates the bits responsible for the pen states from the raw data.
InputMsg(wParam, lParam) {
    Local type, input_info, input_data, raw, proc
    Critical

    type := AHKHID_GetInputInfo(lParam, II_DEVTYPE)

    if (type = RIM_TYPEHID) {
        input_info := AHKHID_GetInputInfo(lParam, II_DEVHANDLE)
        input_data := AHKHID_GetInputData(lParam, uData)

        raw := NumGet(uData, 0, "UInt")
        proc := (raw >> 8) & 0x1F

        PenCallback(proc)
    }
}