unit dingocode;

interface

uses Windows, SysUtils, Graphics, Controls, Forms, Dialogs, StdCtrls,
Buttons, OleCtrls, SHDocVw, ComCtrls, Menus, ExtCtrls, ActnList, ExtActns, Classes;

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
    Page1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Print1: TMenuItem;
    Navigate1: TMenuItem;
    Back1: TMenuItem;
    Next1: TMenuItem;
    Stop1: TMenuItem;
    Home1: TMenuItem;
    ProgressIndicator: TProgressBar;
    URLBox: TComboBox;
    SearchButton: TBitBtn;
    Search1: TMenuItem;
    InInternet1: TMenuItem;
    Oncurrentpage1: TMenuItem;
    Help1: TMenuItem;
    Preview1: TMenuItem;
    Pagesettings1: TMenuItem;
    Print2: TMenuItem;
    Showhelp: TMenuItem;
    FontButton: TBitBtn;
    WorkSpace: TPageControl;
    CurrentSpace: TTabSheet;
    WebNavigator: TWebBrowser;
    Refreshapage1: TMenuItem;
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
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Back1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
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
    procedure InInternet1Click(Sender: TObject);
    procedure Oncurrentpage1Click(Sender: TObject);
    procedure Preview1Click(Sender: TObject);
    procedure Pagesettings1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure ShowhelpClick(Sender: TObject);
    procedure Refreshapage1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var Scale: Integer=0;
var BrowserWindow: TBrowserWindow;

implementation

{$R *.dfm}

function get_icon(const icon:string): string;
begin
 Result:=ExtractFilePath(Application.ExeName)+'icons'+PathDelim+icon+'.bmp';
end;

procedure do_action(var Browser:TWebBrowser;const Action: Cardinal);
var Argument: OleVariant;
begin
  Argument:=0;
  try
   Browser.ControlInterface.ExecWB(Action,OLECMDEXECOPT_PROMPTUSER,Argument,Argument);
  except
   ;
  end;

end;

procedure check_command_line();
begin
  if ParamCount> 0 then
  begin
    BrowserWindow.WebNavigator.Navigate(ParamStr(1));
  end;

end;

procedure prepare_browser();
begin
  BrowserWindow.WebNavigator.Offline:=True;
  BrowserWindow.WebNavigator.Silent:=False;
  BrowserWindow.WebNavigator.RegisterAsBrowser:=True;
  BrowserWindow.WebNavigator.RegisterAsDropTarget:=True;
end;

procedure windows_setup();
begin
  BrowserWindow.Font.Assign(Screen.MenuFont);
  BrowserWindow.Caption:='Dingo Navigator 2.9.4';
  Application.Title:='Dingo Navigator';
end;

procedure common_setup();
begin
  BrowserWindow.WorkSpace.ActivePageIndex:=0;
  BrowserWindow.WorkSpace.ActivePage.Caption:='';
  BrowserWindow.URLBox.Text:='';
  BrowserWindow.OpenDialog1.InitialDir:='';
  BrowserWindow.OpenDialog1.FileName:='*.htm;*.html;*.mht';

end;

procedure address_bar_setup();
begin
  BrowserWindow.URLBox.Style:=csDropDown;
  BrowserWindow.URLBox.Sorted:=False;
end;

procedure progress_setup();
begin
  BrowserWindow.ProgressIndicator.Smooth:=True;
  BrowserWindow.ProgressIndicator.Orientation:=pbHorizontal;
  BrowserWindow.ProgressIndicator.Min:=0;
  BrowserWindow.ProgressIndicator.Max:=100;
end;

procedure control_button_setup();
begin
  BrowserWindow.OpenButton.Caption:='';
  BrowserWindow.OpenButton.ShowHint:=True;
  BrowserWindow.SaveButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.SaveButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.PrintButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.PrintButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.BackButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.BackButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.NextButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.NextButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.StopButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.StopButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.HomeButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.HomeButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.HelpButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.HelpButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.GoButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.GoButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.SearchButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.SearchButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
  BrowserWindow.FontButton.Caption:=BrowserWindow.OpenButton.Caption;
  BrowserWindow.FontButton.ShowHint:=BrowserWindow.OpenButton.ShowHint;
end;

procedure prepare_program();
begin
  windows_setup();
  common_setup();
  control_button_setup();
  progress_setup();
end;

procedure set_icon();
begin
  BrowserWindow.OpenButton.Glyph.LoadFromFile(get_icon('open'));
  BrowserWindow.SaveButton.Glyph.LoadFromFile(get_icon('save'));
  BrowserWindow.PrintButton.Glyph.LoadFromFile(get_icon('print'));
  BrowserWindow.BackButton.Glyph.LoadFromFile(get_icon('back'));
  BrowserWindow.NextButton.Glyph.LoadFromFile(get_icon('next'));
  BrowserWindow.StopButton.Glyph.LoadFromFile(get_icon('stop'));
  BrowserWindow.HomeButton.Glyph.LoadFromFile(get_icon('home'));
  BrowserWindow.HelpButton.Glyph.LoadFromFile(get_icon('help'));
  BrowserWindow.GoButton.Glyph.LoadFromFile(get_icon('go'));
  BrowserWindow.SearchButton.Glyph.LoadFromFile(get_icon('search'));
  BrowserWindow.FontButton.Glyph.LoadFromFile(get_icon('zoom'));
end;

procedure set_shortcut();
begin
  BrowserWindow.BrowserMenu.Items[0].Items[0].ShortCut:=TextToShortCut('Shift+O');
  BrowserWindow.BrowserMenu.Items[0].Items[1].ShortCut:=TextToShortCut('Shift+S');
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[0].ShortCut:=TextToShortCut('Shift+V');
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[1].ShortCut:=TextToShortCut('Shift+C');
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[2].ShortCut:=TextToShortCut('Shift+P');
  BrowserWindow.BrowserMenu.Items[1].Items[0].ShortCut:=TextToShortCut('Alt+B');
  BrowserWindow.BrowserMenu.Items[1].Items[1].ShortCut:=TextToShortCut('Alt+N');
  BrowserWindow.BrowserMenu.Items[1].Items[2].ShortCut:=TextToShortCut('Alt+S');
  BrowserWindow.BrowserMenu.Items[1].Items[3].ShortCut:=TextToShortCut('Alt+H');
  BrowserWindow.BrowserMenu.Items[1].Items[4].ShortCut:=TextToShortCut('Alt+R');
  BrowserWindow.BrowserMenu.Items[2].Items[0].ShortCut:=TextToShortCut('Shift+F');
  BrowserWindow.BrowserMenu.Items[2].Items[1].ShortCut:=TextToShortCut('Alt+F');
  BrowserWindow.BrowserMenu.Items[3].Items[0].ShortCut:=TextToShortCut('F1');
end;

procedure language_setup();
begin
  BrowserWindow.OpenButton.Hint:='Load the page from a file';
  BrowserWindow.SaveButton.Hint:='Save the page to a file';
  BrowserWindow.PrintButton.Hint:='Print the page';
  BrowserWindow.BackButton.Hint:='Go to the preversion page';
  BrowserWindow.NextButton.Hint:='Go to the next page';
  BrowserWindow.StopButton.Hint:='Stop loading the page';
  BrowserWindow.HomeButton.Hint:='Go to the home page';
  BrowserWindow.HelpButton.Hint:='Show a help';
  BrowserWindow.GoButton.Hint:='Go';
  BrowserWindow.SearchButton.Hint:='Go to the default search service';
  BrowserWindow.FontButton.Hint:='Change a font size';
  BrowserWindow.OpenDialog1.Title:='Open a page';
  BrowserWindow.OpenDialog1.Filter:='A web pages|*.htm;*.html;*.mht';
  BrowserWindow.BrowserMenu.Items[0].Caption:='Page';
  BrowserWindow.BrowserMenu.Items[0].Items[0].Caption:='Open';
  BrowserWindow.BrowserMenu.Items[0].Items[1].Caption:='Save';
  BrowserWindow.BrowserMenu.Items[0].Items[2].Caption:='Print';
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[0].Caption:='Preview';
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[1].Caption:='The page settings';
  BrowserWindow.BrowserMenu.Items[0].Items[2].Items[2].Caption:='Print';
  BrowserWindow.BrowserMenu.Items[1].Caption:='Navigation';
  BrowserWindow.BrowserMenu.Items[1].Items[0].Caption:='Back';
  BrowserWindow.BrowserMenu.Items[1].Items[1].Caption:='Forward';
  BrowserWindow.BrowserMenu.Items[1].Items[2].Caption:='Stop';
  BrowserWindow.BrowserMenu.Items[1].Items[3].Caption:='Home';
  BrowserWindow.BrowserMenu.Items[1].Items[4].Caption:='Refresh';
  BrowserWindow.BrowserMenu.Items[2].Caption:='Search';
  BrowserWindow.BrowserMenu.Items[2].Items[0].Caption:='To Internet';
  BrowserWindow.BrowserMenu.Items[2].Items[1].Caption:='On the current page';
  BrowserWindow.BrowserMenu.Items[3].Caption:='Help';
  BrowserWindow.BrowserMenu.Items[3].Items[0].Caption:='Show';
end;

procedure setup();
begin
  prepare_program();
  prepare_browser();
  address_bar_setup();
  set_shortcut();
  set_icon();
  language_setup();
  check_command_line();
end;

procedure set_zoom(var Browser:TWebBrowser);
var Zoom: OleVariant;
var Argument: OleVariant;
begin
  Inc(Scale,1);
  if Scale>4 then
  begin
   Scale:=0;
  end;
  Zoom:=Scale;
  Argument:=0;
  if Browser.LocationURL<> '' then
  begin
   Browser.ControlInterface.ExecWB(OLECMDID_ZOOM,OLECMDEXECOPT_PROMPTUSER,Zoom,Argument);
  end;

end;

procedure TBrowserWindow.FormCreate(Sender: TObject);
begin
  setup();
end;

procedure TBrowserWindow.FormResize(Sender: TObject);
begin
 BrowserWindow.GoButton.Left:=BrowserWindow.ClientWidth-BrowserWindow.GoButton.Width;
 BrowserWindow.URLBox.Width:=BrowserWindow.GoButton.Left-10;
 BrowserWindow.ProgressIndicator.Top:=BrowserWindow.ClientHeight-BrowserWindow.ProgressIndicator.Height;
 BrowserWindow.ProgressIndicator.Left:=0;
 BrowserWindow.ProgressIndicator.Width:=BrowserWindow.ClientWidth;
 BrowserWindow.WorkSpace.Width:=BrowserWindow.ClientWidth;
 BrowserWindow.WorkSpace.Height:=BrowserWindow.ProgressIndicator.Top-BrowserWindow.ProgressIndicator.Height-BrowserWindow.URLBox.Top-BrowserWindow.ProgressIndicator.Height;
 BrowserWindow.WebNavigator.Width:=BrowserWindow.WorkSpace.ClientWidth-15;
 BrowserWindow.WebNavigator.Height:=BrowserWindow.WorkSpace.ClientHeight-15;
end;

procedure TBrowserWindow.FormShow(Sender: TObject);
begin
 BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.OpenButtonClick(Sender: TObject);
begin
  if BrowserWindow.OpenDialog1.Execute()=True then
  begin
   BrowserWindow.WebNavigator.Navigate(BrowserWindow.OpenDialog1.FileName);
  end;
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.SaveButtonClick(Sender: TObject);
begin
  do_action(BrowserWindow.WebNavigator,OLECMDID_SAVEAS);
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.PrintButtonClick(Sender: TObject);
begin
  do_action(BrowserWindow.WebNavigator,OLECMDID_PRINT);
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.BackButtonClick(Sender: TObject);
begin
  try
   BrowserWindow.WebNavigator.GoBack();
  except
   ;
  end;
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.NextButtonClick(Sender: TObject);
begin
  try
   BrowserWindow.WebNavigator.GoForward();
  except
   ;
  end;
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.StopButtonClick(Sender: TObject);
begin
  if BrowserWindow.WebNavigator.LocationURL<> '' then
  begin
   BrowserWindow.WebNavigator.Stop();
  end;
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.HomeButtonClick(Sender: TObject);
begin
  BrowserWindow.WebNavigator.GoHome();
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.HelpButtonClick(Sender: TObject);
begin
  BrowserWindow.WebNavigator.Navigate(ExtractFilePath(Application.ExeName)+'help'+PathDelim+'help.htm');
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.GoButtonClick(Sender: TObject);
begin
  BrowserWindow.WebNavigator.Navigate(BrowserWindow.URLBox.Text);
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.SearchButtonClick(Sender: TObject);
begin
  BrowserWindow.WebNavigator.GoSearch();
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.FontButtonClick(Sender: TObject);
begin
  set_zoom(BrowserWindow.WebNavigator);
  BrowserWindow.WorkSpace.ActivePage.SetFocus();
end;

procedure TBrowserWindow.Open1Click(Sender: TObject);
begin
  BrowserWindow.OpenButton.Click();
end;

procedure TBrowserWindow.Save1Click(Sender: TObject);
begin
  BrowserWindow.SaveButton.Click();
end;

procedure TBrowserWindow.Back1Click(Sender: TObject);
begin
  BrowserWindow.BackButton.Click();
end;

procedure TBrowserWindow.Next1Click(Sender: TObject);
begin
  BrowserWindow.NextButton.Click();
end;

procedure TBrowserWindow.Stop1Click(Sender: TObject);
begin
  BrowserWindow.StopButton.Click();
end;

procedure TBrowserWindow.Home1Click(Sender: TObject);
begin
  BrowserWindow.HomeButton.Click();
end;

procedure TBrowserWindow.WebNavigatorDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  ProgressIndicator.Position:=ProgressIndicator.Min;
end;

procedure TBrowserWindow.WebNavigatorTitleChange(ASender: TObject; const Text: WideString);
begin
  BrowserWindow.WorkSpace.ActivePage.Caption:=Text;
end;

procedure TBrowserWindow.WebNavigatorNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  BrowserWindow.URLBox.Text:=BrowserWindow.WebNavigator.LocationURL;
  if BrowserWindow.URLBox.Items.IndexOf(BrowserWindow.URLBox.Text)=-1 then
  begin
   BrowserWindow.URLBox.Items.Add(BrowserWindow.URLBox.Text);
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
  ProgressIndicator.Max:=ProgressMax;
  ProgressIndicator.Position:=Progress;
end;

procedure TBrowserWindow.URLBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
  begin
    BrowserWindow.WebNavigator.Navigate(BrowserWindow.URLBox.Text);
  end;

end;

procedure TBrowserWindow.URLBoxSelect(Sender: TObject);
begin
 BrowserWindow.WebNavigator.Navigate(BrowserWindow.URLBox.Text);
end;

procedure TBrowserWindow.InInternet1Click(Sender: TObject);
begin
  BrowserWindow.SearchButton.Click();
end;

procedure TBrowserWindow.Oncurrentpage1Click(Sender: TObject);
begin
  do_action(BrowserWindow.WebNavigator,OLECMDID_FIND);
end;

procedure TBrowserWindow.Preview1Click(Sender: TObject);
begin
  do_action(BrowserWindow.WebNavigator,OLECMDID_PRINTPREVIEW);
end;

procedure TBrowserWindow.Pagesettings1Click(Sender: TObject);
begin
  do_action(BrowserWindow.WebNavigator,OLECMDID_PAGESETUP);
end;

procedure TBrowserWindow.Print2Click(Sender: TObject);
begin
  BrowserWindow.PrintButton.Click();
end;

procedure TBrowserWindow.Refreshapage1Click(Sender: TObject);
begin
 if BrowserWindow.WebNavigator.LocationURL<> '' then
 begin
  BrowserWindow.WebNavigator.Refresh();
 end;

end;

procedure TBrowserWindow.ShowhelpClick(Sender: TObject);
begin
  BrowserWindow.HelpButton.Click();
end;

end.
