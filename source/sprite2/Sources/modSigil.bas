Option Explicit On

'/*
'Sound, Input, and Graphics Integration Library (SIGIL) 0.9.0
'Geoff Nagy
'*/

' remember: the co-ordinate system has 0,0 at the bottom left.

'// text alignment symbolic constants
Public Const SL_ALIGN_CENTER = 0
Public Const SL_ALIGN_RIGHT = 1
Public Const SL_ALIGN_LEFT = 2

'// input key symbolic constants
Public Const SL_KEY_ESCAPE = 256
Public Const SL_KEY_ENTER = 257
Public Const SL_KEY_TAB = 258
Public Const SL_KEY_BACKSPACE = 259
Public Const SL_KEY_INSERT = 260
Public Const SL_KEY_DELETE = 261
Public Const SL_KEY_RIGHT = 262
Public Const SL_KEY_LEFT = 263
Public Const SL_KEY_DOWN = 264
Public Const SL_KEY_UP = 265
Public Const SL_KEY_PAGE_UP = 266
Public Const SL_KEY_PAGE_DOWN = 267
Public Const SL_KEY_HOME = 268
Public Const SL_KEY_END = 269
Public Const SL_KEY_CAPS_LOCK = 280
Public Const SL_KEY_SCROLL_LOCK = 281
Public Const SL_KEY_NUM_LOCK = 282
Public Const SL_KEY_PRINT_SCREEN = 283
Public Const SL_KEY_PAUSE = 284
Public Const SL_KEY_F1 = 290
Public Const SL_KEY_F2 = 291
Public Const SL_KEY_F3 = 292
Public Const SL_KEY_F4 = 293
Public Const SL_KEY_F5 = 294
Public Const SL_KEY_F6 = 295
Public Const SL_KEY_F7 = 296
Public Const SL_KEY_F8 = 297
Public Const SL_KEY_F9 = 298
Public Const SL_KEY_F10 = 299
Public Const SL_KEY_F11 = 300
Public Const SL_KEY_F12 = 301
Public Const SL_KEY_F13 = 302
Public Const SL_KEY_F14 = 303
Public Const SL_KEY_F15 = 304
Public Const SL_KEY_F16 = 305
Public Const SL_KEY_F17 = 306
Public Const SL_KEY_F18 = 307
Public Const SL_KEY_F19 = 308
Public Const SL_KEY_F20 = 309
Public Const SL_KEY_F21 = 310
Public Const SL_KEY_F22 = 311
Public Const SL_KEY_F23 = 312
Public Const SL_KEY_F24 = 313
Public Const SL_KEY_F25 = 314
Public Const SL_KEY_KEYPAD_0 = 320
Public Const SL_KEY_KEYPAD_1 = 321
Public Const SL_KEY_KEYPAD_2 = 322
Public Const SL_KEY_KEYPAD_3 = 323
Public Const SL_KEY_KEYPAD_4 = 324
Public Const SL_KEY_KEYPAD_5 = 325
Public Const SL_KEY_KEYPAD_6 = 326
Public Const SL_KEY_KEYPAD_7 = 327
Public Const SL_KEY_KEYPAD_8 = 328
Public Const SL_KEY_KEYPAD_9 = 329
Public Const SL_KEY_KEYPAD_DECIMAL = 330
Public Const SL_KEY_KEYPAD_DIVIDE = 331
Public Const SL_KEY_KEYPAD_MULTIPLY = 332
Public Const SL_KEY_KEYPAD_SUBTRACT = 333
Public Const SL_KEY_KEYPAD_ADD = 334
Public Const SL_KEY_KEYPAD_ENTER = 335
Public Const SL_KEY_KEYPAD_EQUAL = 336
Public Const SL_KEY_LEFT_SHIFT = 340
Public Const SL_KEY_LEFT_CONTROL = 341
Public Const SL_KEY_LEFT_ALT = 342
Public Const SL_KEY_LEFT_SUPER = 343
Public Const SL_KEY_RIGHT_SHIFT = 344
Public Const SL_KEY_RIGHT_CONTROL = 345
Public Const SL_KEY_RIGHT_ALT = 346
Public Const SL_KEY_RIGHT_SUPER = 347

'// mouse input symbolic constants
Public Const SL_MOUSE_BUTTON_1 = 0
Public Const SL_MOUSE_BUTTON_2 = 1
Public Const SL_MOUSE_BUTTON_3 = 2
Public Const SL_MOUSE_BUTTON_4 = 3
Public Const SL_MOUSE_BUTTON_5 = 4
Public Const SL_MOUSE_BUTTON_6 = 5
Public Const SL_MOUSE_BUTTON_7 = 6
Public Const SL_MOUSE_BUTTON_8 = 7
Public Const SL_MOUSE_BUTTON_LEFT = SL_MOUSE_BUTTON_1
Public Const SL_MOUSE_BUTTON_RIGHT = SL_MOUSE_BUTTON_2
Public Const SL_MOUSE_BUTTON_MIDDLE = SL_MOUSE_BUTTON_3

    '// initialization commands

Public Declare Sub slWindow CDecl Lib "sigil" (ByVal width As Integer, ByVal height As Integer, ByVal title As String, ByVal fullScreen As Integer)
Public Declare Sub slShowCursor CDecl Lib "sigil" (ByVal showCursor As Integer)
Public Declare Sub slClose CDecl Lib "sigil" ()
Public Declare Function slShouldClose CDecl Lib "sigil" () As Integer

    '// simple input

Public Declare Function slGetKey CDecl Lib "sigil" (ByVal key As Integer) As Integer

Public Declare Function slGetMouseButton CDecl Lib "sigil" (ByVal button As Integer) As Integer
Public Declare Function slGetMouseX CDecl Lib "sigil" () As Integer
Public Declare Function slGetMouseY CDecl Lib "sigil" () As Integer

    '// simple frame timing

Public Declare Function slGetDeltaTime CDecl Lib "sigil" () As Double
Public Declare Function slGetTime CDecl Lib "sigil" () As Double

    '// rendering commands

Public Declare Sub slRender CDecl Lib "sigil" ()

    '// color control

Public Declare Sub slSetBackColor CDecl Lib "sigil" (ByVal red As Double, ByVal green As Double, ByVal blue As Double)
Public Declare Sub slSetForeColor CDecl Lib "sigil" (ByVal red As Double, ByVal green As Double, ByVal blue As Double, ByVal alpha As Double)

    '// blending control

Public Declare Sub slSetAdditiveBlend CDecl Lib "sigil" (ByVal additiveBlend As Integer)

    '// transformations

Public Declare Sub slPush CDecl Lib "sigil" ()
Public Declare Sub slPop CDecl Lib "sigil" ()

Public Declare Sub slTranslate CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double)
Public Declare Sub slRotate CDecl Lib "sigil" (ByVal degrees As Double)
Public Declare Sub slScale CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double)

    '// texture loading

Public Declare Function slLoadTexture CDecl Lib "sigil" (ByVal filename As String) As Integer

    '// sound loading and playing

Public Declare Function slLoadWAV CDecl Lib "sigil" (ByVal filename As String) As Integer
Public Declare Function slSoundPlay CDecl Lib "sigil" (ByVal sound As Integer) As Integer
Public Declare Function slSoundLoop CDecl Lib "sigil" (ByVal sound As Integer) As Integer
Public Declare Sub slSoundPause CDecl Lib "sigil" (ByVal sound As Integer)
Public Declare Sub slSoundStop CDecl Lib "sigil" (ByVal sound As Integer)
Public Declare Sub slSoundPauseAll CDecl Lib "sigil" ()
Public Declare Sub slSoundResumeAll CDecl Lib "sigil" ()
Public Declare Sub slSoundStopAll CDecl Lib "sigil" ()
Public Declare Function slSoundPlaying CDecl Lib "sigil" (ByVal sound As Integer) As Integer
Public Declare Function slSoundLooping CDecl Lib "sigil" (ByVal sound As Integer) As Integer

    '// simple shape commands

Public Declare Sub slTriangleFill CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal width As Double, ByVal height As Double)
Public Declare Sub slTriangleOutline CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal width As Double, ByVal height As Double)

Public Declare Sub slRectangleFill CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal width As Double, ByVal height As Double)
Public Declare Sub slRectangleOutline CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal width As Double, ByVal height As Double)

Public Declare Sub slCircleFill CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal radius As Double, ByVal numVertices As Integer)
Public Declare Sub slCircleOutline CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal radius As Double, ByVal numVertices As Integer)

Public Declare Sub slSemiCircleFill CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal radius As Double, ByVal numVertices As Integer, ByVal degrees As Double)
Public Declare Sub slSemiCircleOutline CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal radius As Double, ByVal numVertices As Integer, ByVal degrees As Double)

Public Declare Sub slPoint CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double)

Public Declare Sub slLine CDecl Lib "sigil" (ByVal x1 As Double, ByVal y1 As Double, ByVal x2 As Double, ByVal y2 As Double)

Public Declare Sub slSetSpriteTiling CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double)
Public Declare Sub slSetSpriteScroll CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double)
Public Declare Sub slSprite CDecl Lib "sigil" (ByVal texture As Integer, ByVal x As Double, ByVal y As Double, ByVal width As Double, ByVal height As Double)

    '// text commands

Public Declare Sub slSetTextAlign CDecl Lib "sigil" (ByVal fontAlign As Integer)
Public Declare Function slGetTextWidth CDecl Lib "sigil" (ByVal text As String) As Double
Public Declare Function slGetTextHeight CDecl Lib "sigil" (ByVal text As String) As Double
Public Declare Function slLoadFont CDecl Lib "sigil" (ByVal fontFilename As String) As Integer
Public Declare Sub slSetFont CDecl Lib "sigil" (ByVal font As Integer, ByVal fontSize As Integer)
Public Declare Sub slSetFontSize CDecl Lib "sigil" (ByVal fontSize As Integer)
Public Declare Sub slText CDecl Lib "sigil" (ByVal x As Double, ByVal y As Double, ByVal text As String)

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Helper function

'This function returns image height, width and type
'of JPG, GIF, BMP & PNG formats.


'Type for returning image info
Public Type ImgDimType
  height As Long
  width As Long
End Type


Function getImgDim(ByVal fileName As String, ImgDim As ImgDimType, _
                   Ext As String) As Boolean


'Inputs:
'
'fileName is a string containing the path name of the image file.
'
'ImgDim is passed as an empty type var and contains the height 
'and width that's passed back.
'
'Ext is passed as an empty string and contains the image type 
'as a 3 letter description that's passed back.
'
'
'Returns:
'
'True if the function was successful.


  'declare vars
  Dim handle As Integer, isValidImage As Boolean
  Dim byteArr(255) As Byte, i As Integer

  'init vars
  isValidImage = False
  ImgDim.height = 0
  ImgDim.width = 0
  
  'open file and get 256 byte chunk
  handle = FreeFile
  On Error GoTo endFunction
  Open fileName For Binary Access Read As #handle
  Get handle,, byteArr
  Close #handle
  

  'check for jpg header (SOI): &HFF and &HD8
  ' contained in first 2 bytes
  If byteArr(0) = &HFF And byteArr(1) = &HD8 Then
    isValidImage = True
  Else
    GoTo checkGIF
  End If
  
  'check for SOF marker: &HFF and &HC0 TO &HCF
  For i = 0 To 255
    If byteArr(i) = &HFF And byteArr(i + 1) >= &HC0 _
                         And byteArr(i + 1) <= &HCF Then
      ImgDim.height = byteArr(i + 5) * 256 + byteArr(i + 6)
      ImgDim.width = byteArr(i + 7) * 256 + byteArr(i + 8)
      Exit For
    End If
  Next i
  
  'get image type and exit
  Ext = "jpg"
  GoTo endFunction


checkGIF:
  
  'check for GIF header
  If byteArr(0) = &H47 And byteArr(1) = &H49 And byteArr(2) = &H46 _
  And byteArr(3) = &H38 Then
    ImgDim.width = byteArr(7) * 256 + byteArr(6)
    ImgDim.height = byteArr(9) * 256 + byteArr(8)
    isValidImage = True
  Else
    GoTo checkBMP
  End If
  
  'get image type and exit
  Ext = "gif"
  GoTo endFunction

  
checkBMP:
  
  'check for BMP header
  If byteArr(0) = 66 And byteArr(1) = 77 Then
    isValidImage = True
  Else
    GoTo checkPNG
  End If
  
  'get record type info
  If byteArr(14) = 40 Then
    
    'get width and height of BMP
    ImgDim.width = byteArr(21) * 256 ^ 3 + byteArr(20) * 256 ^ 2 _
                 + byteArr(19) * 256 + byteArr(18)
    
    ImgDim.height = byteArr(25) * 256 ^ 3 + byteArr(24) * 256 ^ 2 _
                  + byteArr(23) * 256 + byteArr(22)
  
  'another kind of BMP
  ElseIf byteArr(17) = 12 Then
  
    'get width and height of BMP
    ImgDim.width = byteArr(19) * 256 + byteArr(18)
    ImgDim.height = byteArr(21) * 256 + byteArr(20)
    
  End If
  
  'get image type and exit
  Ext = "bmp"
  GoTo endFunction

  
checkPNG:

  'check for PNG header
  If byteArr(0) = &H89 And byteArr(1) = &H50 And byteArr(2) = &H4E _
  And byteArr(3) = &H47 Then
    ImgDim.width = byteArr(18) * 256 + byteArr(19)
    ImgDim.height = byteArr(22) * 256 + byteArr(23)
    isValidImage = True
  Else
    GoTo endFunction
  End If
  
  Ext = "png"


endFunction:

  'return function's success status
  getImgDim = isValidImage
  

End Function


