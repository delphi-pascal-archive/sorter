object Form2: TForm2
  Left = 391
  Top = 169
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1055#1086#1080#1089#1082'...'
  ClientHeight = 319
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 200
    Top = 232
    Width = 65
    Height = 25
    Caption = #1054#1050
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = #1060#1072#1081#1083':'
  end
  object Label2: TLabel
    Left = 200
    Top = 8
    Width = 42
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088':'
  end
  object Label3: TLabel
    Left = 8
    Top = 232
    Width = 44
    Height = 13
    Caption = #1060#1072#1081#1083#1086#1074':'
  end
  object Label4: TLabel
    Left = 8
    Top = 248
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 8
    Top = 264
    Width = 79
    Height = 13
    Caption = #1054#1073#1097#1080#1081' '#1088#1072#1079#1084#1077#1088':'
  end
  object Label6: TLabel
    Left = 8
    Top = 280
    Width = 6
    Height = 13
    Caption = '0'
  end
  object SpeedButton2: TSpeedButton
    Left = 200
    Top = 264
    Width = 65
    Height = 25
    Caption = #1057#1090#1086#1087
    Enabled = False
    OnClick = SpeedButton2Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 185
    Height = 201
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 200
    Top = 24
    Width = 65
    Height = 201
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox2Click
  end
  object ListBox3: TListBox
    Left = 8
    Top = 320
    Width = 89
    Height = 121
    ItemHeight = 13
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 304
    Width = 273
    Height = 15
    Align = alBottom
    TabOrder = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 16
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    Left = 128
    Top = 240
    object N1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1086#1076#1077#1088#1078#1072#1097#1091#1102' '#1087#1072#1087#1082#1091
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N3Click
    end
  end
end
