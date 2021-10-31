object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Simple test'
  ClientHeight = 445
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  DesignSize = (
    700
    445)
  TextHeight = 15
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 161
    Height = 49
    Caption = 'RTL Move'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 184
    Top = 8
    Width = 161
    Height = 49
    Caption = 'mORMot2 Move'
    TabOrder = 1
    OnClick = btn2Click
  end
  object mmoLog: TMemo
    Left = 8
    Top = 72
    Width = 684
    Height = 365
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btn3: TButton
    Left = 360
    Top = 8
    Width = 161
    Height = 49
    Caption = 'Super Fast Move'
    TabOrder = 3
    OnClick = btn3Click
  end
end
