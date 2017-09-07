object FormAdd: TFormAdd
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Add Interpreter or Program Path'
  ClientHeight = 268
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 16
    Caption = 'Python Program:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 68
    Height = 16
    Caption = 'Description:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 58
    Width = 42
    Height = 16
    Caption = 'Locate:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 124
    Width = 109
    Height = 16
    Caption = 'Python Interpreter:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 151
    Width = 68
    Height = 16
    Caption = 'Description:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 174
    Width = 42
    Height = 16
    Caption = 'Locate:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 455
    Top = 202
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditProg: TEdit
    Left = 82
    Top = 30
    Width = 207
    Height = 21
    TabOrder = 1
  end
  object EditProgLocate: TEdit
    Left = 82
    Top = 57
    Width = 367
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 455
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 3
    OnClick = Button2Click
  end
  object EditPython: TEdit
    Left = 82
    Top = 146
    Width = 207
    Height = 21
    TabOrder = 4
  end
  object EditPythonLocate: TEdit
    Left = 82
    Top = 173
    Width = 367
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 455
    Top = 171
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 455
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 232
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 8
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 8
  end
end
