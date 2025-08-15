object BrowserWindow: TBrowserWindow
  Left = 0
  Top = 0
  Caption = 'BrowserWindow'
  ClientHeight = 572
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
    object PageMenu: TMenuItem
      Caption = 'Page'
      object OpenMenuItem: TMenuItem
        Caption = 'Open'
        OnClick = OpenMenuItemClick
      end
      object SaveMenuItem: TMenuItem
        Caption = 'Save'
        OnClick = SaveMenuItemClick
      end
      object PrintMenu: TMenuItem
        Caption = 'Print'
        object PreviewMenuItem: TMenuItem
          Caption = 'Preview'
          OnClick = PreviewMenuItemClick
        end
        object PagesettingsMenuItem: TMenuItem
          Caption = 'The page settings'
          OnClick = PagesettingsMenuItemClick
        end
        object PrintMenuItem: TMenuItem
          Caption = 'Print'
          OnClick = PrintMenuItemClick
        end
      end
    end
    object NavigateMenu: TMenuItem
      Caption = 'Navigate'
      object BackMenuItem: TMenuItem
        Caption = 'Back'
        OnClick = BackMenuItemClick
      end
      object NextMenuItem: TMenuItem
        Caption = 'Next'
        OnClick = NextMenuItemClick
      end
      object StopMenuItem: TMenuItem
        Caption = 'Stop'
        OnClick = StopMenuItemClick
      end
      object HomeMenuItem: TMenuItem
        Caption = 'Home'
        OnClick = HomeMenuItemClick
      end
      object RefreshMenuItem: TMenuItem
        Caption = 'Refresh'
        OnClick = RefreshMenuItemClick
      end
    end
    object SearchMenu: TMenuItem
      Caption = 'Search'
      object InInternetMenuItem: TMenuItem
        Caption = 'To Internet'
        OnClick = InInternetMenuItemClick
      end
      object OncurrentpageMenuItem: TMenuItem
        Caption = 'On the current page'
        OnClick = OncurrentpageMenuItemClick
      end
    end
    object HelpMenu: TMenuItem
      Caption = 'Help'
      object ShowMenuItem: TMenuItem
        Caption = 'Show'
        OnClick = ShowMenuItemClick
      end
    end
  end
end
