object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 534
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Image1: TImage
    Left = 7
    Top = 476
    Width = 32
    Height = 32
    OnClick = Image1Click
    OnMouseEnter = Image1MouseEnter
    OnMouseLeave = Image1MouseLeave
  end
  object BitBtn1: TBitBtn
    Left = 7
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 45
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 83
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 121
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 159
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 197
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 235
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 351
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 7
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 367
    Top = 48
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 8
    OnClick = BitBtn9Click
  end
  object ProgressBar1: TProgressBar
    Left = 45
    Top = 492
    Width = 366
    Height = 16
    TabOrder = 9
  end
  object ComboBox1: TComboBox
    Left = 85
    Top = 53
    Width = 260
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'ComboBox1'
    OnKeyPress = ComboBox1KeyPress
    OnSelect = ComboBox1Select
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 86
    Width = 403
    Height = 339
    ActivePage = TabSheet2
    TabOrder = 11
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WebBrowser1: TWebBrowser
        Left = -4
        Top = 3
        Width = 407
        Height = 305
        TabOrder = 0
        OnProgressChange = WebBrowser1ProgressChange
        OnDownloadBegin = WebBrowser1DownloadBegin
        OnDownloadComplete = WebBrowser1DownloadComplete
        OnTitleChange = WebBrowser1TitleChange
        OnNewWindow2 = WebBrowser1NewWindow2
        OnNavigateComplete2 = WebBrowser1NavigateComplete2
        OnDocumentComplete = WebBrowser1DocumentComplete
        OnNavigateError = WebBrowser1NavigateError
        ControlData = {
          4C000000112A0000861F00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object WebBrowser2: TWebBrowser
        Left = 3
        Top = 3
        Width = 389
        Height = 310
        TabOrder = 0
        OnDocumentComplete = WebBrowser2DocumentComplete
        ControlData = {
          4C000000342800000A2000000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object BitBtn10: TBitBtn
    Left = 275
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn2'
    TabOrder = 12
    OnClick = BitBtn10Click
  end
  object CheckBox1: TCheckBox
    Left = 45
    Top = 469
    Width = 284
    Height = 17
    Caption = 'Open  a pages in new windows'
    TabOrder = 13
  end
  object BitBtn11: TBitBtn
    Left = 313
    Top = 8
    Width = 32
    Height = 32
    Caption = 'BitBtn11'
    TabOrder = 14
    OnClick = BitBtn11Click
  end
  object OpenDialog1: TOpenDialog
    OnCanClose = OpenDialog1CanClose
    Left = 336
    Top = 432
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 432
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
        object Printersetting1: TMenuItem
          Caption = 'Printer setting'
          OnClick = Printersetting1Click
        end
        object Print2: TMenuItem
          Caption = 'Print'
          OnClick = Print2Click
        end
      end
      object Properties1: TMenuItem
        Caption = 'Properties'
        OnClick = Properties1Click
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
    end
    object Search1: TMenuItem
      Caption = 'Search'
      object InInternet1: TMenuItem
        Caption = 'In Internet'
        OnClick = InInternet1Click
      end
      object Oncurrentpage1: TMenuItem
        Caption = 'On current page'
        OnClick = Oncurrentpage1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Browser'
      object Clearhistory: TMenuItem
        Caption = 'Clear history'
        OnClick = ClearhistoryClick
      end
      object Setting1: TMenuItem
        Caption = 'Setting'
        OnClick = Setting1Click
      end
      object Showhelp: TMenuItem
        Caption = 'Show help'
        OnClick = ShowhelpClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 296
    Top = 432
    object Createnewtab1: TMenuItem
      Caption = 'Create new tab'
      OnClick = Createnewtab1Click
    end
    object Closeactivetab1: TMenuItem
      Caption = 'Close active tab'
      OnClick = Closeactivetab1Click
    end
  end
  object ActionList1: TActionList
    Left = 256
    Top = 432
    object FileRun1: TFileRun
      Category = 'File'
      Browse = False
      BrowseDlg.Title = 'Run'
      Caption = '&Run...'
      Hint = 'Run|Runs an application'
      Operation = 'open'
      ShowCmd = scShowNormal
    end
  end
end
