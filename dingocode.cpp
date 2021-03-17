#include <new>
#include "dingocode.h"

#pragma package(smart_init)
#pragma resource "*.dfm"
#pragma resource "icon.res"
TForm1 *Form1;

__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}

AnsiString get_path()
{
 return ExtractFilePath(Application->ExeName);
}

AnsiString get_history()
{
 return get_path()+"history";
}

void save_history()
{
 AnsiString history;
 history=get_history();
 Form1->ComboBox1->Items->SaveToFile(history);
}

void load_history()
{
 AnsiString history;
 history=get_history();
 if (FileExists(history)==true)
 {
  Form1->ComboBox1->Items->LoadFromFile(history);
 }

}

void clear_history()
{
 AnsiString history;
 history=get_history();
 Form1->ComboBox1->Items->Clear();
 if (FileExists(history)==true)
 {
  DeleteFile(history);
 }

}

TWebBrowser* get_active_browser()
{
 return (TWebBrowser*)Form1->PageControl1->ActivePage->Controls[0];
}

void delete_tab()
{
 if (Form1->PageControl1->ActivePageIndex>1)
 {
  delete get_active_browser();
  delete Form1->PageControl1->ActivePage;
 }

}

void clear_memory()
{
 Form1->PageControl1->ActivePageIndex=Form1->PageControl1->PageCount-1;
 while (Form1->PageControl1->ActivePageIndex>1)
 {
  delete_tab();
 }

}

void change_url()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Form1->ComboBox1->Text=WideString(Browser->LocationURL);
}

void indicator_setup()
{
 Form1->Image1->Width=32;
 Form1->Image1->Height=Form1->Image1->Width;
 Form1->Image1->Stretch=false;
 Form1->Image1->Proportional=true;
}

void change_icon(const AnsiString icon)
{
 unsigned int Instance;
 Instance=(int)HInstance;
 Form1->Image1->Picture->Bitmap->LoadFromResourceName(Instance,icon);
}

void set_size()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Form1->BitBtn9->Left=Form1->ClientWidth-Form1->BitBtn9->Width-4;
 Form1->ComboBox1->Width=Form1->ClientWidth-4*Form1->BitBtn9->Width;
 Form1->PageControl1->Width=Form1->ClientWidth;
 Form1->PageControl1->Height=Form1->ClientHeight-125;
 Browser->Width=Form1->PageControl1->Width-20;
 Form1->ProgressBar1->Width=Browser->Width-Form1->Image1->Width;
 Form1->ProgressBar1->Top=Form1->PageControl1->Height+90;
 Form1->Image1->Top=Form1->ProgressBar1->Top;
 Form1->ProgressBar1->Top+=10;
 Form1->CheckBox1->Left=Form1->ProgressBar1->Left;
 Form1->CheckBox1->Top=Form1->ProgressBar1->Top-25;
 Form1->PageControl1->Height-=15;
 Browser->Height=Form1->PageControl1->Height-40;
}

TWebBrowser* create_new_tab()
{
 TTabSheet *Tab=NULL;
 TWebBrowser *Browser=NULL;
 try
 {
  Tab=new TTabSheet(Form1->PageControl1);
  Tab->PageControl=Form1->PageControl1;
  Browser=new TWebBrowser(Tab);
  Tab->InsertControl(Browser);
 }
 catch (...)
 {
  ShowMessage("Can't create a new tab");
  Form1->Close();
 }
 Browser->Offline=true;
 Browser->Silent=false;
 Browser->RegisterAsBrowser=false;
 Browser->RegisterAsDropTarget=false;
 Form1->PageControl1->ActivePage=Tab;
 set_size();
 return Browser;
}

void go_page(const AnsiString address)
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->Navigate(address,navNoHistory);
}

void load_blank_page()
{
 Form1->ComboBox1->Text="about:blank";
 Form1->PageControl1->ActivePage->Caption=Form1->ComboBox1->Text;
}

void action_page(const unsigned short int action)
{
 TWebBrowser *Browser=NULL;
 OleVariant argument;
 argument=0;
 Browser=get_active_browser();
 Browser->ControlInterface->ExecWB(action,1,argument,argument);
}

void back_page()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->ControlInterface->GoBack();
}

void next_page()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->ControlInterface->GoForward();
}

void stop_page()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->Stop();
}

void refresh_page()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->ControlInterface->Refresh();
}

void go_search()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->GoSearch();
 Browser->GoSearch();
}

void go_home()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 Browser->GoHome();
}

void find_on_page()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 action_page(32);
}

void check_command_line()
{
 AnsiString file;
 if (ParamCount()>0)
 {
  file=ParamStr(1);
  go_page(file);
 }

}

void check_history(const WideString url)
{
 AnsiString address;
 int index;
 address=WideString(url);
 index=Form1->ComboBox1->Items->IndexOf(address);
 if (index==-1)
 {
  Form1->ComboBox1->Items->Add(address);
 }

}

void add_to_history()
{
 TWebBrowser *Browser=NULL;
 Browser=get_active_browser();
 if (Browser->ReadyState==4)
 {
  check_history(Browser->LocationURL);
 }

}

void prepare_browser()
{
 Form1->WebBrowser1->Offline=true;
 Form1->WebBrowser1->Silent=false;
 Form1->WebBrowser1->RegisterAsBrowser=true;
 Form1->WebBrowser1->RegisterAsDropTarget=true;
 Form1->WebBrowser2->Offline=true;
 Form1->WebBrowser2->Silent=false;
 Form1->WebBrowser2->RegisterAsBrowser=false;
 Form1->WebBrowser2->RegisterAsDropTarget=false;
}

void execute_program(const AnsiString program,const AnsiString arguments)
{
 Form1->FileRun1->Operation="open";
 Form1->FileRun1->ShowCmd=scShow;
 Form1->FileRun1->FileName=program;
 Form1->FileRun1->Parameters=arguments;
 Form1->FileRun1->Execute();
}

void windows_setup()
{
 Form1->Font->Assign(Screen->MenuFont);
 Form1->Caption="DINGO NAVIGATOR 2.3.4";
 Application->Title="DINGO NAVIGATOR";
}

void common_setup()
{
 Form1->ComboBox1->Text="";
 Form1->OpenDialog1->InitialDir="";
 Form1->OpenDialog1->Filter="Web pages|*.htm;*.html;*.mht";
 Form1->OpenDialog1->FileName="*.htm;*.html;*.mht";
 Form1->CheckBox1->Checked=false;
 Form1->Label1->AutoSize=true;
}

void address_bar_setup()
{
 Form1->ComboBox1->Style=csDropDown;
 Form1->ComboBox1->Sorted=false;
}

void progress_setup()
{
 Form1->ProgressBar1->Smooth=true;
 Form1->ProgressBar1->Orientation=pbHorizontal;
 Form1->ProgressBar1->Min=0;
 Form1->ProgressBar1->Max=100;
}

void page_setup()
{
 Form1->PageControl1->Pages[0]->Caption="";
 Form1->PageControl1->Pages[1]->Caption=Form1->PageControl1->Pages[0]->Caption;
 Form1->PageControl1->Pages[1]->TabVisible=false;
 Form1->PageControl1->ActivePage=Form1->PageControl1->Pages[0];
 Form1->PageControl1->PopupMenu=Form1->PopupMenu1;
}

void show_help()
{
 AnsiString help;
 help=get_path()+"help\\index.html";
 go_page(help);
}

void control_button_setup()
{
 Form1->BitBtn1->Caption="";
 Form1->BitBtn1->ShowHint=true;
 Form1->BitBtn2->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn2->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn3->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn3->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn4->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn4->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn5->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn5->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn6->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn6->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn7->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn7->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn8->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn8->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn9->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn9->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn10->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn10->ShowHint=Form1->BitBtn1->ShowHint;
 Form1->BitBtn11->Caption=Form1->BitBtn1->Caption;
 Form1->BitBtn11->ShowHint=Form1->BitBtn1->ShowHint;
}

void prepare_program()
{
 windows_setup();
 page_setup();
 common_setup();
 control_button_setup();
 progress_setup();
}

void set_icon()
{
 unsigned int Instance;
 Instance=(int)HInstance;
 Form1->BitBtn1->Glyph->LoadFromResourceName(Instance,"OPEN");
 Form1->BitBtn2->Glyph->LoadFromResourceName(Instance,"SAVE");
 Form1->BitBtn3->Glyph->LoadFromResourceName(Instance,"PRINT");
 Form1->BitBtn4->Glyph->LoadFromResourceName(Instance,"BACK");
 Form1->BitBtn5->Glyph->LoadFromResourceName(Instance,"NEXT");
 Form1->BitBtn6->Glyph->LoadFromResourceName(Instance,"STOP");
 Form1->BitBtn7->Glyph->LoadFromResourceName(Instance,"HOME");
 Form1->BitBtn8->Glyph->LoadFromResourceName(Instance,"HELP");
 Form1->BitBtn9->Glyph->LoadFromResourceName(Instance,"GO");
 Form1->BitBtn10->Glyph->LoadFromResourceName(Instance,"SEARCH");
 Form1->BitBtn11->Glyph->LoadFromResourceName(Instance,"ZOOM");
}

void set_page_shortcut()
{
 Form1->MainMenu1->Items->Items[0]->Items[0]->ShortCut=TextToShortCut("Shift+O");
 Form1->MainMenu1->Items->Items[0]->Items[1]->ShortCut=TextToShortCut("Shift+S");
 Form1->MainMenu1->Items->Items[0]->Items[3]->ShortCut=TextToShortCut("Shift+B");
}

void set_print_shortcut()
{
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[0]->ShortCut=TextToShortCut("Shift+V");
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[1]->ShortCut=TextToShortCut("Shift+C");
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[2]->ShortCut=TextToShortCut("Shift+P");
}

void set_navigation_shortcut()
{
 Form1->MainMenu1->Items->Items[1]->Items[0]->ShortCut=TextToShortCut("Alt+B");
 Form1->MainMenu1->Items->Items[1]->Items[1]->ShortCut=TextToShortCut("Alt+N");
 Form1->MainMenu1->Items->Items[1]->Items[2]->ShortCut=TextToShortCut("Alt+S");
 Form1->MainMenu1->Items->Items[1]->Items[3]->ShortCut=TextToShortCut("Alt+H");
}

void set_find_shortcut()
{
 Form1->MainMenu1->Items->Items[2]->Items[0]->ShortCut=TextToShortCut("Shift+F");
 Form1->MainMenu1->Items->Items[2]->Items[1]->ShortCut=TextToShortCut("Alt+F");
}

void set_help_shortcut()
{
 Form1->MainMenu1->Items->Items[3]->Items[2]->ShortCut=TextToShortCut("F1");
}

void set_tab_shortcut()
{
 Form1->PopupMenu1->Items->Items[0]->ShortCut=TextToShortCut("Ctrl+F2");
 Form1->PopupMenu1->Items->Items[1]->ShortCut=TextToShortCut("Ctrl+F4");
}

void set_shortcut()
{
 set_page_shortcut();
 set_print_shortcut();
 set_navigation_shortcut();
 set_find_shortcut();
 set_help_shortcut();
 set_tab_shortcut();
}

void language_setup()
{
 Form1->BitBtn1->Hint="Open";
 Form1->BitBtn2->Hint="Save";
 Form1->BitBtn3->Hint="Print";
 Form1->BitBtn4->Hint="Back";
 Form1->BitBtn5->Hint="Forward";
 Form1->BitBtn6->Hint="Stop";
 Form1->BitBtn7->Hint="Home";
 Form1->BitBtn8->Hint="Show Help";
 Form1->BitBtn9->Hint="Go";
 Form1->BitBtn10->Hint="Search";
 Form1->BitBtn11->Hint="Change font size";
 Form1->Label1->Caption="Address";
 Form1->CheckBox1->Caption="Open new page in new window";
 Form1->OpenDialog1->Filter="Web pages|*.htm;*.html;*.mht";
 Form1->MainMenu1->Items->Items[0]->Caption="Page";
 Form1->MainMenu1->Items->Items[0]->Items[0]->Caption="Open";
 Form1->MainMenu1->Items->Items[0]->Items[1]->Caption="Save";
 Form1->MainMenu1->Items->Items[0]->Items[2]->Caption="Print";
 Form1->MainMenu1->Items->Items[0]->Items[3]->Caption="Properties";
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[0]->Caption="Preview";
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[1]->Caption="Printer setting";
 Form1->MainMenu1->Items->Items[0]->Items[2]->Items[2]->Caption="Print";
 Form1->MainMenu1->Items->Items[1]->Caption="Navigation";
 Form1->MainMenu1->Items->Items[1]->Items[0]->Caption="Back";
 Form1->MainMenu1->Items->Items[1]->Items[1]->Caption="Forward";
 Form1->MainMenu1->Items->Items[1]->Items[2]->Caption="Stop";
 Form1->MainMenu1->Items->Items[1]->Items[3]->Caption="Home";
 Form1->MainMenu1->Items->Items[2]->Caption="Search";
 Form1->MainMenu1->Items->Items[2]->Items[0]->Caption="In internet";
 Form1->MainMenu1->Items->Items[2]->Items[1]->Caption="On current page";
 Form1->MainMenu1->Items->Items[3]->Caption="Browser";
 Form1->MainMenu1->Items->Items[3]->Items[0]->Caption="Clear history";
 Form1->MainMenu1->Items->Items[3]->Items[1]->Caption="Setting";
 Form1->MainMenu1->Items->Items[3]->Items[2]->Caption="Show help";
 Form1->PopupMenu1->Items->Items[0]->Caption="Create new tab";
 Form1->PopupMenu1->Items->Items[1]->Caption="Close active tab";
}

void setup()
{
 prepare_program();
 prepare_browser();
 address_bar_setup();
 set_shortcut();
 set_icon();
 indicator_setup();
 language_setup();
 set_size();
 load_blank_page();
 check_command_line();
}

void correct_popup_menu()
{
 if (Form1->PageControl1->ActivePageIndex==0)
 {
  Form1->PopupMenu1->Items->Items[1]->Enabled=false;
 }
 else
 {
  Form1->PopupMenu1->Items->Items[1]->Enabled=true;
 }
 Form1->PopupMenu1->Items->Items[1]->Visible=Form1->PopupMenu1->Items->Items[1]->Enabled;
}

void create_new_browser(const WideString url)
{
 AnsiString address;
 address=WideString(url);
 execute_program(Application->ExeName,address);
}

void show_setting()
{
 TWebBrowser *Browser=NULL;
 IOleCommandTarget *target=NULL;
 GUID ID={0xed016940, 0xbd5b, 0x11cf,{0xba, 0x4e, 0x0, 0xc0, 0x4f, 0xd7, 0x08, 0x16}};
 Browser=get_active_browser();
 Browser->ControlInterface->QueryInterface(IID_IOleCommandTarget,(void**)&target);
 target->Exec(&ID,3,1,NULL,NULL);
 target->Release();
}

void set_zoom()
{
 TWebBrowser *Browser=NULL;
 OleVariant zoom;
 OleVariant argument;
 static int scale=0;
 argument=0;
 Browser=get_active_browser();
 scale++;
 if(scale>4)
 {
  scale=0;
 }
 zoom=scale;
 Browser->ControlInterface->ExecWB(19,1,zoom,argument);
}

void __fastcall TForm1::FormCreate(TObject *Sender)
{
 setup();
 load_history();
 change_icon("COMPLETE");
}

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
 OpenDialog1->Execute();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
 action_page(4);
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
 action_page(6);
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn4Click(TObject *Sender)
{
 back_page();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn5Click(TObject *Sender)
{
 next_page();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn6Click(TObject *Sender)
{
 stop_page();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn7Click(TObject *Sender)
{
 go_home();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn8Click(TObject *Sender)
{
 show_help();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::BitBtn9Click(TObject *Sender)
{
 go_page(ComboBox1->Text);
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::WebBrowser1NavigateComplete2(TObject *ASender,
      const IDispatch *pDisp, OleVariant &URL)
{
 change_url();
}

void __fastcall TForm1::OpenDialog1CanClose(TObject *Sender, bool &CanClose)
{
 go_page(OpenDialog1->FileName);
}

void __fastcall TForm1::FormResize(TObject *Sender)
{
 set_size();
}

void __fastcall TForm1::Open1Click(TObject *Sender)
{
 Form1->BitBtn1->Click();
}

void __fastcall TForm1::Save1Click(TObject *Sender)
{
 Form1->BitBtn2->Click();
}

void __fastcall TForm1::Back1Click(TObject *Sender)
{
 Form1->BitBtn4->Click();
}

void __fastcall TForm1::Next1Click(TObject *Sender)
{
 Form1->BitBtn5->Click();
}

void __fastcall TForm1::Stop1Click(TObject *Sender)
{
 Form1->BitBtn6->Click();
}

void __fastcall TForm1::Home1Click(TObject *Sender)
{
 Form1->BitBtn7->Click();
}

void __fastcall TForm1::WebBrowser1ProgressChange(TObject *ASender,
	  int Progress, int ProgressMax)
{
 Form1->ProgressBar1->Max=ProgressMax;
 Form1->ProgressBar1->Position=Progress;
}

void __fastcall TForm1::WebBrowser1DocumentComplete(TObject *ASender,
	  const IDispatch *pDisp, OleVariant &URL)
{
 Form1->ProgressBar1->Position=Form1->ProgressBar1->Min;
 add_to_history();
}

void __fastcall TForm1::ComboBox1KeyPress(TObject *Sender, char &Key)
{
  if(Key==VK_RETURN)
 {
  go_page(ComboBox1->Text);
 }

}

void __fastcall TForm1::ComboBox1Select(TObject *Sender)
{
 go_page(Form1->ComboBox1->Text);
}

void __fastcall TForm1::WebBrowser1TitleChange(TObject *ASender,
	  const WideString Text)
{
 Form1->PageControl1->ActivePage->Caption=WideString(Text);
}

void __fastcall TForm1::WebBrowser1NewWindow2(TObject *ASender,
	  IDispatch *&ppDisp, WordBool &Cancel)
{

 TWebBrowser *Browser=NULL;
 if (Form1->CheckBox1->Checked==true)
 {
  ppDisp=Form1->WebBrowser2->Application;
 }
 else
 {
 Browser=create_new_tab();
 Browser->OnNavigateComplete2=Form1->WebBrowser1->OnNavigateComplete2;
 Browser->OnProgressChange=Form1->WebBrowser1->OnProgressChange;
 Browser->OnDocumentComplete=Form1->WebBrowser1->OnDocumentComplete;
 Browser->OnTitleChange=Form1->WebBrowser1->OnTitleChange;
 Browser->OnNewWindow2=Form1->WebBrowser1->OnNewWindow2;
 Browser->OnNavigateError=Form1->WebBrowser1->OnNavigateError;
 Browser->OnDownloadBegin=Form1->WebBrowser1->OnDownloadBegin;
 Browser->OnDownloadComplete=Form1->WebBrowser1->OnDownloadComplete;
 ppDisp=Browser->Application;
 }

}

void __fastcall TForm1::BitBtn10Click(TObject *Sender)
{
 go_search();
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::FormShow(TObject *Sender)
{
 Form1->PageControl1->ActivePage->SetFocus();
}

void __fastcall TForm1::InInternet1Click(TObject *Sender)
{
 Form1->BitBtn10->Click();
}

void __fastcall TForm1::Oncurrentpage1Click(TObject *Sender)
{
 find_on_page();
}

void __fastcall TForm1::WebBrowser1NavigateError(TObject *ASender,
      const IDispatch *pDisp, OleVariant &URL, OleVariant &Frame,
      OleVariant &StatusCode, WordBool &Cancel)
{
 int code;
 code=StatusCode;
 if (code!=200)
 {
  Cancel=true;
  change_icon("Error");
  ShowMessage("Can't show page");
 }

}

void __fastcall TForm1::WebBrowser1DownloadBegin(TObject *Sender)
{
 change_icon("COMPLETE");
}

void __fastcall TForm1::WebBrowser1DownloadComplete(TObject *Sender)
{
 change_icon("BEGIN");
}

void __fastcall TForm1::Image1MouseEnter(TObject *Sender)
{
 Form1->Image1->Cursor=crHandPoint;
}

void __fastcall TForm1::Image1MouseLeave(TObject *Sender)
{
 Form1->Image1->Cursor=crDefault;
}

void __fastcall TForm1::Image1Click(TObject *Sender)
{
 refresh_page();
}

void __fastcall TForm1::Createnewtab1Click(TObject *Sender)
{
 TWebBrowser *Browser=NULL;
 Browser=create_new_tab();
 Form1->ComboBox1->Text="";
 Browser->OnNavigateComplete2=Form1->WebBrowser1->OnNavigateComplete2;
 Browser->OnProgressChange=Form1->WebBrowser1->OnProgressChange;
 Browser->OnDocumentComplete=Form1->WebBrowser1->OnDocumentComplete;
 Browser->OnTitleChange=Form1->WebBrowser1->OnTitleChange;
 Browser->OnNewWindow2=Form1->WebBrowser1->OnNewWindow2;
 Browser->OnNavigateError=Form1->WebBrowser1->OnNavigateError;
 Browser->OnDownloadBegin=Form1->WebBrowser1->OnDownloadBegin;
 Browser->OnDownloadComplete=Form1->WebBrowser1->OnDownloadComplete;
}

void __fastcall TForm1::Closeactivetab1Click(TObject *Sender)
{
 correct_popup_menu();
 delete_tab();
}

void __fastcall TForm1::PageControl1Change(TObject *Sender)
{
 set_size();
 change_url();
}

void __fastcall TForm1::PopupMenu1Popup(TObject *Sender)
{
 correct_popup_menu();
}

void __fastcall TForm1::Preview1Click(TObject *Sender)
{
 action_page(7);
}

void __fastcall TForm1::Printersetting1Click(TObject *Sender)
{
 action_page(8);
}

void __fastcall TForm1::Print2Click(TObject *Sender)
{
 Form1->BitBtn3->Click();
}

void __fastcall TForm1::WebBrowser2DocumentComplete(TObject *ASender,
	  const IDispatch *pDisp, OleVariant &URL)
{

 if (Form1->WebBrowser2->ReadyState==4)
 {
  create_new_browser(Form1->WebBrowser2->LocationURL);
 }

}

void __fastcall TForm1::Properties1Click(TObject *Sender)
{
 action_page(10);
}

void __fastcall TForm1::Setting1Click(TObject *Sender)
{
 show_setting();
}

void __fastcall TForm1::ClearhistoryClick(TObject *Sender)
{
 clear_history();
}

void __fastcall TForm1::ShowhelpClick(TObject *Sender)
{
 Form1->BitBtn8->Click();
}

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
 clear_memory();
 save_history();
}

void __fastcall TForm1::BitBtn11Click(TObject *Sender)
{
 set_zoom();
 Form1->PageControl1->ActivePage->SetFocus();
}