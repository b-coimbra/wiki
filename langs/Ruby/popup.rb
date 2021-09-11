require 'dl'

# button constants
BUTTONS_OK = 0
BUTTONS_OKCANCEL = 1
BUTTONS_ABORTRETRYIGNORE = 2
BUTTONS_YESNO = 4

# return code constants
CLICKED_OK = 1
CLICKED_CANCEL = 2
CLICKED_ABORT = 3
CLICKED_RETRY = 4
CLICKED_IGNORE = 5
CLICKED_YES = 6
CLICKED_NO = 7

def message_box(txt, title=APP_TITLE, buttons=BUTTONS_OK)
    user32 = DL.dlopen('user32')
    msgbox = user32['MessageBoxA', 'ILSSI']
    r, rs = msgbox.call(0, txt, title, buttons)
    return r
end

response = message_box("Are you sure you want to proceed?", "Proceed?", BUTTONS_YESNO)
if response == CLICKED_YES
    # insert your code here
end
