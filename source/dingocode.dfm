object BrowserWindow: TBrowserWindow
  Left = 0
  Top = 0
  Caption = 'BrowserWindow'
  ClientHeight = 552
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = BrowserMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OpenButton: TBitBtn
    Left = 7
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenButtonClick
  end
  object SaveButton: TBitBtn
    Left = 45
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Save'
    TabOrder = 1
    OnClick = SaveButtonClick
  end
  object PrintButton: TBitBtn
    Left = 83
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Print'
    TabOrder = 2
    OnClick = PrintButtonClick
  end
  object BackButton: TBitBtn
    Left = 121
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Back'
    TabOrder = 3
    OnClick = BackButtonClick
  end
  object NextButton: TBitBtn
    Left = 159
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Next'
    TabOrder = 4
    OnClick = NextButtonClick
  end
  object StopButton: TBitBtn
    Left = 197
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Stop'
    TabOrder = 5
    OnClick = StopButtonClick
  end
  object HomeButton: TBitBtn
    Left = 235
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Home'
    TabOrder = 6
    OnClick = HomeButtonClick
  end
  object HelpButton: TBitBtn
    Left = 351
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Help'
    TabOrder = 7
    OnClick = HelpButtonClick
  end
  object GoButton: TBitBtn
    Left = 550
    Top = 48
    Width = 32
    Height = 32
    Caption = 'Go'
    TabOrder = 8
    OnClick = GoButtonClick
  end
  object ProgressIndicator: TProgressBar
    Left = 8
    Top = 528
    Width = 581
    Height = 16
    TabOrder = 9
  end
  object URLBox: TComboBox
    Left = 8
    Top = 59
    Width = 536
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'URL'
    OnKeyPress = URLBoxKeyPress
    OnSelect = URLBoxSelect
  end
  object SearchButton: TBitBtn
    Left = 275
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Search'
    TabOrder = 11
    OnClick = SearchButtonClick
  end
  object FontButton: TBitBtn
    Left = 313
    Top = 8
    Width = 32
    Height = 32
    Caption = 'Font'
    TabOrder = 12
    OnClick = FontButtonClick
  end
  object WorkSpace: TPageControl
    Left = 8
    Top = 86
    Width = 581
    Height = 436
    ActivePage = CurrentSpace
    TabOrder = 13
    object CurrentSpace: TTabSheet
      Caption = 'Current space'
      object WebNavigator: TWebBrowser
        Left = -4
        Top = 3
        Width = 574
        Height = 402
        TabOrder = 0
        OnProgressChange = WebNavigatorProgressChange
        OnTitleChange = WebNavigatorTitleChange
        OnNewWindow2 = WebNavigatorNewWindow2
        OnNavigateComplete2 = WebNavigatorNavigateComplete2
        OnDocumentComplete = WebNavigatorDocumentComplete
        ControlData = {
          4C000000533B00008C2900000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 520
    Top = 8
  end
  object BrowserMenu: TMainMenu
    Left = 560
    Top = 8
    object Page1: TMenuItem
      Caption = 'Page'
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Print1: TMenuItem
        Caption = 'Print'
        object Preview1: TMenuItem
          Caption = 'Preview'
          OnClick = Preview1Click
        end
        object Pagesettings1: TMenuItem
          Caption = 'The page settings'
          OnClick = Pagesettings1Click
        end
        object Print2: TMenuItem
          Caption = 'Print'
          OnClick = Print2Click
        end
      end
    end
    object Navigate1: TMenuItem
      Caption = 'Navigate'
      object Back1: TMenuItem
        Caption = 'Back'
        OnClick = Back1Click
      end
      object Next1: TMenuItem
        Caption = 'Next'
        OnClick = Next1Click
      end
      object Stop1: TMenuItem
        Caption = 'Stop'
        OnClick = Stop1Click
      end
      object Home1: TMenuItem
        Caption = 'Home'
        OnClick = Home1Click
      end
      object Refreshapage1: TMenuItem
        Caption = 'Refresh'
        OnClick = Refreshapage1Click
      end
    end
    object Search1: TMenuItem
      Caption = 'Search'
      object InInternet1: TMenuItem
        Caption = 'To Internet'
        OnClick = InInternet1Click
      end
      object Oncurrentpage1: TMenuItem
        Caption = 'On the current page'
        OnClick = Oncurrentpage1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Showhelp: TMenuItem
        Caption = 'Show'
        OnClick = ShowhelpClick
      end
    end
  end
end
