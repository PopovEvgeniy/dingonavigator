unit dingocode;

{
 This software was made by Popov Evgeniy Alekseyevich.
 It is distributed under the GNU GENERAL PUBLIC LICENSE (Version 2 or higher).
}

interface

uses Windows, SysUtils, Graphics, Controls, Forms, Dialogs, StdCtrls,
Buttons, OleCtrls, SHDocVw, ComCtrls, Menus, Classes;

type
    TBrowserWindow = class(TForm)
    OpenDialog1: TOpenDialog;
    OpenButton: TBitBtn;
    SaveButton: TBitBtn;
    PrintButton: TBitBtn;
    BackButton: TBitBtn;
    NextButton: TBitBtn;
    StopButton: TBitBtn;
    HomeButton: TBitBtn;
    HelpButton: TBitBtn;
    GoButton: TBitBtn;
    BrowserMenu: TMainMenu;
    PageMenu: TMenuItem;
    OpenMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    PrintMenu: TMenuItem;
    NavigateMenu: TMenuItem;
    BackMenuItem: TMenuItem;
    NextMenuItem: TMenuItem;
    StopMenuItem: TMenuItem;
    HomeMenuItem: TMenuItem;
    ProgressIndicator: TProgressBar;
    URLBox: TComboBox;
    SearchButton: TBitBtn;
    SearchMenu: TMenuItem;
    InInternetMenuItem: TMenuItem;
    OncurrentpageMenuItem: TMenuItem;
    HelpMenu: TMenuItem;
    PreviewMenuItem: TMenuItem;
    PagesettingsMenuItem: TMenuItem;
    PrintMenuItem: TMenuItem;
    ShowMenuItem: TMenuItem;
    FontButton: TBitBtn;
    WorkSpace: TPageControl;
    CurrentSpace: TTabSheet;
    WebNavigator: TWebBrowser;
    RefreshMenuItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure HomeButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure BackMenuItemClick(Sender: TObject);
    procedure NextMenuItemClick(Sender: TObject);
    procedure StopMenuItemClick(Sender: TObject);
    procedure HomeMenuItemClick(Sender: TObject);
    procedure WebNavigatorDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebNavigatorTitleChange(ASender: TObject; const Text: WideString);
    procedure WebNavigatorNavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
      procedure WebNavigatorNewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure WebNavigatorProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure URLBoxKeyPress(Sender: TObject; var Key: Char);
    procedure URLBoxSelect(Sender: TObject);
    procedure InInternetMenuItemClick(Sender: TObject);
    procedure OncurrentpageMenuItemClick(Sender: TObject);
    procedure PreviewMenuItemClick(Sender: TObject);
    procedure PagesettingsMenuItemClick(Sender: TObject);
    procedure PrintMenuItemClick(Sender: TObject);
    procedure ShowMenuItemClick(Sender: TObject);
    procedure RefreshMenuItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
    procedure do_action(const Action: Cardinal);
    procedure set_zoom();
    procedure check_command_line();
    procedure prepare_browser();
    procedure window_setup();
    procedure common_setup();
    procedure address_bar_setup();
    procedure progress_setup();
    procedure control_button_setup();
    procedure prepare_program();
    procedure set_icon();
    procedure set_shortcut();
    procedure language_setup();
    procedure setup();
   public
    { Public declarations }
  end;

var Scale: Integer=0;
var BrowserWindow: TBrowserWindow;

implementation

{$R *.dfm}
{$R icons.res}

procedure TBrowserWindow.do_action(const Action: Cardinal);
begin
  try
   Self.WebNavigator.ExecWB(Action,OLECMDEXECOPT_PROMPTUSER);
  except
   On E:Exception do ShowMessage(E.Message);
  end;

end;

procedure TBrowserWindow.set_zoom();
var Zoom: OleVariant;
begin
  Inc(Scale,1);
  if Scale>4 then
  begin
   Scale:=0;
  end;
  Zoom:=Scale;
  if Self.WebNavigator.LocationURL<> '' then
  begin
   Self.WebNavigator.ExecWB(OLECMDID_ZOOM,OLECMDEXECOPT_DODEFAULT,Zoom);
  end;

end;

procedure TBrowserWindow.check_command_line();
begin
  if ParamCount()>0 then
  begin
    Self.WebNavigator.Navigate(ParamStr(1));
  end;

end;

procedure TBrowserWindow.prepare_browser();
begin
  Self.WebNavigator.Offline:=False;
  Self.WebNavigator.Silent:=False;
  Self.WebNavigator.RegisterAsBrowser:=True;
  Self.WebNavigator.RegisterAsDropTarget:=True;
end;

procedure TBrowserWindow.window_setup();
begin
  Self.Font.Assign(Screen.MenuFont);
  Self.Caption:='Dingo Navigator 3.0.7';
  Application.Title:='Dingo Navigator';
end;

procedure TBrowserWindow.common_setup();
begin
  Self.WorkSpace.ActivePageIndex:=0;
  Self.WorkSpace.ActivePage.Caption:='';
  Self.URLBox.Text:='';
  Self.OpenDialog1.InitialDir:='';
  Self.OpenDialog1.FileName:='*.htm;*.html;*.mht';
end;

procedure TBrowserWindow.address_bar_setup();
begin
  Self.URLBox.Style:=csDropDown;
  Self.URLBox.Sorted:=False;
end;

procedure TBrowserWindow.progress_setup();
begin
  Self.ProgressIndicator.Smooth:=True;
  Self.ProgressIndicator.Orientation:=pbHorizontal;
  Self.ProgressIndicator.Min:=0;
  Self.ProgressIndicator.Max:=100;
end;

procedure TBrowserWindow.control_button_setup();
begin
  Self.OpenButton.Caption:='';
  Self.SaveButton.Caption:='';
  Self.PrintButton.Caption:='';
  Self.BackButton.Caption:='';
  Self.NextButton.Caption:='';
  Self.StopButton.Caption:='';
  Self.HomeButton.Caption:='';
  Self.HelpButton.Caption:='';
  Self.GoButton.Caption:='';
  Self.SearchButton.Caption:='';
  Self.FontButton.Caption:='';
  Self.OpenButton.ShowHint:=True;
  Self.SaveButton.ShowHint:=True;
  Self.PrintButton.ShowHint:=True;
  Self.BackButton.ShowHint:=True;
  Self.NextButton.ShowHint:=True;
  Self.StopButton.ShowHint:=True;
  Self.HomeButton.ShowHint:=True;
  Self.HelpButton.ShowHint:=True;
  Self.GoButton.ShowHint:=True;
  Self.SearchButton.ShowHint:=True;
  Self.FontButton.ShowHint:=True
end;

procedure TBrowserWindow.prepare_program();
begin
  Self.window_setup();
  Self.common_setup();
  Self.control_button_setup();
  Self.progress_setup();
end;

procedure TBrowserWindow.set_icon();
begin
  Self.OpenButton.Glyph.LoadFromResourceName(HINSTANCE,'OPEN');
  Self.SaveButton.Glyph.LoadFromResourceName(HINSTANCE,'SAVE');
  Self.PrintButton.Glyph.LoadFromResourceName(HINSTANCE,'PRINT');
  Self.BackButton.Glyph.LoadFromResourceName(HINSTANCE,'BACK');
  Self.NextButton.Glyph.LoadFromResourceName(HINSTANCE,'NEXT');
  Self.StopButton.Glyph.LoadFromResourceName(HINSTANCE,'STOP');
  Self.HomeButton.Glyph.LoadFromResourceName(HINSTANCE,'HOME');
  Self.HelpButton.Glyph.LoadFromResourceName(HINSTANCE,'HELP');
  Self.GoButton.Glyph.LoadFromResourceName(HINSTANCE,'GO');
  Self.SearchButton.Glyph.LoadFromResourceName(HINSTANCE,'SEARCH');
  Self.FontButton.Glyph.LoadFromResourceName(HINSTANCE,'ZOOM');
end;

procedure TBrowserWindow.set_shortcut();
begin
  Self.OpenMenuItem.ShortCut:=TextToShortCut('Shift+O');
  Self.SaveMenuItem.ShortCut:=TextToShortCut('Shift+S');
  Self.PreviewMenuItem.ShortCut:=TextToShortCut('Shift+V');
  Self.PagesettingsMenuItem.ShortCut:=TextToShortCut('Shift+C');
  Self.PrintMenuItem.ShortCut:=TextToShortCut('Shift+P');
  Self.BackMenuItem.ShortCut:=TextToShortCut('Alt+B');
  Self.NextMenuItem.ShortCut:=TextToShortCut('Alt+N');
  Self.StopMenuItem.ShortCut:=TextToShortCut('Alt+S');
  Self.HomeMenuItem.ShortCut:=TextToShortCut('Alt+H');
  Self.RefreshMenuItem.ShortCut:=TextToShortCut('Alt+R');
  Self.InInternetMenuItem.ShortCut:=TextToShortCut('Shift+F');
  Self.OncurrentpageMenuItem.ShortCut:=TextToShortCut('Alt+F');
  Self.ShowMenuItem.ShortCut:=TextToShortCut('F1');
end;

procedure TBrowserWindow.language_setup();
begin
  Self.OpenButton.Hint:='Load the page from a file';
  Self.SaveButton.Hint:='Save the page to a file';
  Self.PrintButton.Hint:='Print the page';
  Self.BackButton.Hint:='Go to the previous page';
  Self.NextButton.Hint:='Go to the next page';
  Self.StopButton.Hint:='Stop loading the page';
  Self.HomeButton.Hint:='Go to the home page';
  Self.HelpButton.Hint:='Show the help page';
  Self.GoButton.Hint:='Go';
  Self.SearchButton.Hint:='Go to the default search service';
  Self.FontButton.Hint:='Change a font size';
  Self.OpenDialog1.Title:='Open a page';
  Self.OpenDialog1.Filter:='Web pages|*.htm;*.html;*.mht';
  Self.PageMenu.Caption:='Page';
  Self.OpenMenuItem.Caption:='Open';
  Self.SaveMenuItem.Caption:='Save';
  Self.PrintMenu.Caption:='Print';
  Self.PreviewMenuItem.Caption:='Preview';
  Self.PagesettingsMenuItem.Caption:='The page settings';
  Self.PrintMenuItem.Caption:='Print';
  Self.NavigateMenu.Caption:='Navigation';
  Self.BackMenuItem.Caption:='Back';
  Self.NextMenuItem.Caption:='Forward';
  Self.StopMenuItem.Caption:='Stop';
  Self.HomeMenuItem.Caption:='Home';
  Self.RefreshMenuItem.Caption:='Refresh';
  Self.SearchMenu.Caption:='Search';
  Self.InInternetMenuItem.Caption:='To the Internet';
  Self.OncurrentpageMenuItem.Caption:='On the current page';
  Self.HelpMenu.Caption:='Help';
  Self.ShowMenuItem.Caption:='Show';
end;

procedure TBrowserWindow.setup();
begin
  Self.prepare_program();
  Self.prepare_browser();
  Self.address_bar_setup();
  Self.set_shortcut();
  Self.set_icon();
  Self.language_setup();
  Self.check_command_line();
end;

procedure TBrowserWindow.FormCreate(Sender: TObject);
begin
  Self.setup();
end;

procedure TBrowserWindow.FormResize(Sender: TObject);
begin
 Self.GoButton.Left:=Self.ClientWidth-Self.GoButton.Width;
 Self.GoButton.Top:=Self.URLBox.Top;
 Self.URLBox.Width:=Self.GoButton.Left-15;
 Self.ProgressIndicator.Top:=Self.ClientHeight-Self.ProgressIndicator.Height;
 Self.ProgressIndicator.Left:=0;
 Self.ProgressIndicator.Width:=Self.ClientWidth;
 Self.WorkSpace.Width:=Self.ClientWidth;
 Self.WorkSpace.Height:=Self.ProgressIndicator.Top-Self.URLBox.Top-30;
 Self.WebNavigator.Width:=Self.WorkSpace.ClientWidth-15;
 Self.WebNavigator.Height:=Self.WorkSpace.ClientHeight-15;
end;

procedure TBrowserWindow.FormShow(Sender: TObject);
begin
 Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.OpenButtonClick(Sender: TObject);
begin
  if Self.OpenDialog1.Execute()=True then
  begin
   Self.WebNavigator.Navigate(Self.OpenDialog1.FileName);
  end;
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.SaveButtonClick(Sender: TObject);
begin
  Self.do_action(OLECMDID_SAVEAS);
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.PrintButtonClick(Sender: TObject);
begin
  Self.do_action(OLECMDID_PRINT);
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.BackButtonClick(Sender: TObject);
begin
  try
   Self.WebNavigator.GoBack();
  except
   On E:Exception do ShowMessage(E.Message);
  end;
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.NextButtonClick(Sender: TObject);
begin
  try
   Self.WebNavigator.GoForward();
  except
   On E:Exception do ShowMessage(E.Message);
  end;
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.StopButtonClick(Sender: TObject);
begin
  if Self.WebNavigator.LocationURL<> '' then
  begin
   Self.WebNavigator.Stop();
  end;
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.HomeButtonClick(Sender: TObject);
begin
  Self.WebNavigator.GoHome();
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.HelpButtonClick(Sender: TObject);
begin
  Self.WebNavigator.Navigate(ExtractFilePath(Application.ExeName)+'help'+PathDelim+'help.htm');
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.GoButtonClick(Sender: TObject);
begin
  if Self.URLBox.Text<>'' then Self.WebNavigator.Navigate(Self.URLBox.Text);
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.SearchButtonClick(Sender: TObject);
begin
  Self.WebNavigator.GoSearch();
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.FontButtonClick(Sender: TObject);
begin
  Self.set_zoom();
  Self.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.OpenMenuItemClick(Sender: TObject);
begin
  Self.OpenButton.Click();
end;

procedure TBrowserWindow.SaveMenuItemClick(Sender: TObject);
begin
  Self.SaveButton.Click();
end;

procedure TBrowserWindow.BackMenuItemClick(Sender: TObject);
begin
  Self.BackButton.Click();
end;

procedure TBrowserWindow.NextMenuItemClick(Sender: TObject);
begin
  Self.NextButton.Click();
end;

procedure TBrowserWindow.StopMenuItemClick(Sender: TObject);
begin
  Self.StopButton.Click();
end;

procedure TBrowserWindow.HomeMenuItemClick(Sender: TObject);
begin
  Self.HomeButton.Click();
end;

procedure TBrowserWindow.WebNavigatorDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Self.ProgressIndicator.Position:=ProgressIndicator.Min;
end;

procedure TBrowserWindow.WebNavigatorTitleChange(ASender: TObject; const Text: WideString);
begin
  Self.WorkSpace.ActivePage.Caption:=Text;
end;

procedure TBrowserWindow.WebNavigatorNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Self.URLBox.Text:=Self.WebNavigator.LocationURL;
  if Self.URLBox.Items.IndexOf(Self.URLBox.Text)=-1 then
  begin
   Self.URLBox.Items.Add(Self.URLBox.Text);
  end;

end;

procedure TBrowserWindow.WebNavigatorNewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
 Cancel:=True;
end;

procedure TBrowserWindow.WebNavigatorProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
  Self.ProgressIndicator.Max:=ProgressMax;
  Self.ProgressIndicator.Position:=Progress;
end;

procedure TBrowserWindow.URLBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
  begin
    if Self.URLBox.Text<>'' then Self.WebNavigator.Navigate(Self.URLBox.Text);
  end;

end;

procedure TBrowserWindow.URLBoxSelect(Sender: TObject);
begin
 if Self.URLBox.Text<>'' then Self.WebNavigator.Navigate(Self.URLBox.Text);
end;

procedure TBrowserWindow.InInternetMenuItemClick(Sender: TObject);
begin
  Self.SearchButton.Click();
end;

procedure TBrowserWindow.OncurrentpageMenuItemClick(Sender: TObject);
begin
  Self.do_action(OLECMDID_FIND);
end;

procedure TBrowserWindow.PreviewMenuItemClick(Sender: TObject);
begin
  Self.do_action(OLECMDID_PRINTPREVIEW);
end;

procedure TBrowserWindow.PagesettingsMenuItemClick(Sender: TObject);
begin
  Self.do_action(OLECMDID_PAGESETUP);
end;

procedure TBrowserWindow.PrintMenuItemClick(Sender: TObject);
begin
  Self.PrintButton.Click();
end;

procedure TBrowserWindow.RefreshMenuItemClick(Sender: TObject);
begin
 if Self.WebNavigator.LocationURL<> '' then
 begin
  Self.WebNavigator.Refresh();
 end;

end;

procedure TBrowserWindow.ShowMenuItemClick(Sender: TObject);
begin
  Self.HelpButton.Click();
end;

end.
