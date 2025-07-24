#SingleInstance Force
#Requires AutoHotkey v2.0

; ---------------------------
; Full Keyboard Maps
; ---------------------------
global engToHeb := Map(
    "a", "ש", "b", "נ", "c", "ב", "d", "ג", "e", "ק", "f", "כ",
    "g", "ע", "h", "י", "i", "ן", "j", "ח", "k", "ל", "l", "ך",
    "m", "צ", "n", "מ", "o", "ם", "p", "פ", "q", "/", "r", "ר",
    "s", "ד", "t", "א", "u", "ו", "v", "ה", "w", "'", "x", "ס",
    "y", "ט", "z", "ז", ",", "ת", ".", "ץ", ";", "ף"
)

global hebToEng := Map()
for k, v in engToHeb {
    if !hebToEng.Has(v)
        hebToEng[v] := k
}

; ---------------------------
; Debug Logging Toggle
; ---------------------------
global debug := true

Log(msg) {
    if debug {
        FileAppend(Format("[{1}] {2}`n", A_Now, msg), A_ScriptDir "\debug_log.txt")
    }
}

; ---------------------------
; Main Hotkey
; ---------------------------
^`:: {
    layout := GetCurrentLayout()
    isHebrew := (layout = 0x040D)
    Log("Current layout: " . (isHebrew ? "Hebrew" : "English"))

    A_Clipboard := ""
    SendInput("^a")
    Sleep(100)
    SendInput("^c")
    ClipWait(2)

    original := A_Clipboard
    Log("Original text: " . original)

    if !original || StrLen(original) = 0 {
        Log("Clipboard is empty. Skipping conversion.")
        return
    }

    converted := ConvertLayout(original, isHebrew ? hebToEng : engToHeb)
    Log("Converted text: " . converted)

    if isHebrew {
        Log("Switching to English")
        SwitchToEnglish()
    } else {
        Log("Switching to Hebrew")
        SwitchToHebrew()
    }

    A_Clipboard := converted
    Sleep(100)
    SendInput("^v")
    Sleep(50)
    SendInput("{Right}{End}")
    Log("Paste complete`n")
}

; ---------------------------
; Conversion Function
; ---------------------------
ConvertLayout(text, layoutMap) {
    result := ""
    Loop Parse text {
        char := A_LoopField
        lowerChar := StrLower(char)
        isUpper := (char != lowerChar)

        if layoutMap.Has(lowerChar) {
            newChar := layoutMap[lowerChar]
            if isUpper
                newChar := StrUpper(newChar)
            result .= newChar
        } else {
            result .= char
        }
    }
    return result
}

; ---------------------------
; Detect Keyboard Layout
; ---------------------------
GetCurrentLayout() {
    threadID := DllCall("GetWindowThreadProcessId", "ptr", WinActive("A"), "uint*", 0)
    hkl := DllCall("GetKeyboardLayout", "uint", threadID, "UPtr")
    return hkl & 0xFFFF
}

; ---------------------------
; Language Switchers
; ---------------------------
SwitchToHebrew() {
    hwnd := WinActive("A")
    PostMessage(0x50, 0, 0, , hwnd)
}

SwitchToEnglish() {
    hwnd := WinActive("A")
    PostMessage(0x50, 0, 1, , hwnd)
}
