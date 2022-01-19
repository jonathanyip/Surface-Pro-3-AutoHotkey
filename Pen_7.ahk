; Surface Pro 7 AutoHotkey
; Original Project: https://github.com/jonathanyip/Surface-Pro-3-AutoHotkey
;
; Last Updated: January 19, 2022

; Set up our pen constants
global PEN_HOVERING := 0x04          ; Pen is hovering above screen.
global PEN_1ST_BTN_HOVERING := 0x0C  ; 1st button is pressed.
global PEN_2ND_BTN_HOVERING := 0x24  ; 2nd button is pressed.
global PEN_TOUCHING := 0x05          ; Pen is touching screen.
global PEN_1ST_BTN_TOUCHING := 0x1C  ; 1st button is pressed, pen is touching screen.
global PEN_2ND_BTN_TOUCHING := 0x25  ; 3nd button is pressed, pen is touching screen.
global PEN_NOT_HOVERING := 0x0      ; Pen is moved away from screen.

; Respond to the pen inputs
; Fill this section with your favorite AutoHotkey scripts!
; lastInput is the last input that was detected before a state change.
PenCallback(input, lastInput) {
    if (input = PEN_NOT_HOVERING) {

    }

    if (input = PEN_HOVERING) {

    }

    if (input = PEN_TOUCHING) {

    }

    if (input = PEN_1ST_BTN_HOVERING) {

    }

    if (input = PEN_1ST_BTN_TOUCHING) {

    }

    if (input = PEN_2ND_BTN_HOVERING) {

    }

    if (input = PEN_2ND_BTN_TOUCHING) {

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

; Register the pen
AHKHID_AddRegister(1)
AHKHID_AddRegister(USAGE_PAGE, USAGE, A_ScriptHwnd, RIDEV_INPUTSINK)
AHKHID_Register()

; Intercept WM_INPUT
OnMessage(WM_INPUT, "InputMsg")

; Callback for WM_INPUT
; Isolates the bits responsible for the pen states from the raw data.
InputMsg(wParam, lParam) {
    Local type, inputInfo, inputData, raw, proc
    Critical

    type := AHKHID_GetInputInfo(lParam, II_DEVTYPE)

    if (type = RIM_TYPEHID) {
        inputInfo := AHKHID_GetInputInfo(lParam, II_DEVHANDLE)
        inputData := AHKHID_GetInputData(lParam, uData)

        raw := NumGet(uData, 0, "UInt")
        proc := (raw >> 24) 

        LimitPenCallback(proc)
    }
}

; Limits the callback only to when the pen changes state.
; This stop the repetitive firing that goes on when the pen moves around.
LimitPenCallback(input) {
    static lastInput := PEN_NOT_HOVERING

    if (input != lastInput) {
        PenCallback(input, lastInput)
        lastInput := input
    }
}