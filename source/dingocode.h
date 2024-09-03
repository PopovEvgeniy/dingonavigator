#ifndef dingocodeH
#define dingocodeH

#include <vcl.h>
#include <docobj.h>
#include <inifiles.hpp>
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Dialogs.hpp>
#include <OleCtrls.hpp>
#include <SHDocVw.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
#include <ActnList.hpp>
#include <ExtActns.hpp>

class TForm1 : public TForm
{
__published:
	TOpenDialog *OpenDialog1;
	TLabel *Label1;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
	TBitBtn *BitBtn3;
	TBitBtn *BitBtn4;
	TBitBtn *BitBtn5;
	TBitBtn *BitBtn6;
	TBitBtn *BitBtn7;
	TBitBtn *BitBtn8;
	TBitBtn *BitBtn9;
	TMainMenu *MainMenu1;
	TMenuItem *Page1;
	TMenuItem *Open1;
	TMenuItem *Save1;
	TMenuItem *Print1;
	TMenuItem *Navigate1;
	TMenuItem *Back1;
	TMenuItem *Next1;
	TMenuItem *Stop1;
	TMenuItem *Home1;
	TProgressBar *ProgressBar1;
	TComboBox *ComboBox1;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TWebBrowser *WebBrowser1;
	TBitBtn *BitBtn10;
	TMenuItem *Search1;
	TMenuItem *InInternet1;
	TMenuItem *Oncurrentpage1;
	TMenuItem *Help1;
	TMenuItem *Clearhistory;
	TImage *Image1;
	TPopupMenu *PopupMenu1;
	TMenuItem *Createnewtab1;
	TMenuItem *Closeactivetab1;
	TMenuItem *Preview1;
	TMenuItem *Printersetting1;
	TMenuItem *Print2;
	TTabSheet *TabSheet2;
	TWebBrowser *WebBrowser2;
	TCheckBox *CheckBox1;
	TMenuItem *Properties1;
	TMenuItem *Setting1;
	TMenuItem *Showhelp;
	TActionList *ActionList1;
	TFileRun *FileRun1;
	TBitBtn *BitBtn11;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall BitBtn2Click(TObject *Sender);
	void __fastcall BitBtn3Click(TObject *Sender);
	void __fastcall BitBtn4Click(TObject *Sender);
	void __fastcall BitBtn5Click(TObject *Sender);
	void __fastcall BitBtn6Click(TObject *Sender);
	void __fastcall BitBtn7Click(TObject *Sender);
	void __fastcall BitBtn8Click(TObject *Sender);
	void __fastcall BitBtn9Click(TObject *Sender);
	void __fastcall WebBrowser1NavigateComplete2(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL);
	void __fastcall OpenDialog1CanClose(TObject *Sender, bool &CanClose);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall Open1Click(TObject *Sender);
	void __fastcall Save1Click(TObject *Sender);
	void __fastcall Back1Click(TObject *Sender);
	void __fastcall Next1Click(TObject *Sender);
	void __fastcall Stop1Click(TObject *Sender);
	void __fastcall Home1Click(TObject *Sender);
	void __fastcall WebBrowser1ProgressChange(TObject *ASender, int Progress,
          int ProgressMax);
	void __fastcall WebBrowser1DocumentComplete(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL);
	void __fastcall ComboBox1KeyPress(TObject *Sender, char &Key);
	void __fastcall ComboBox1Select(TObject *Sender);
	void __fastcall WebBrowser1TitleChange(TObject *ASender,
          const WideString Text);
	void __fastcall WebBrowser1NewWindow2(TObject *ASender, IDispatch *&ppDisp,
          WordBool &Cancel);
	void __fastcall BitBtn10Click(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall InInternet1Click(TObject *Sender);
	void __fastcall Oncurrentpage1Click(TObject *Sender);
	void __fastcall WebBrowser1NavigateError(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL, OleVariant &Frame,
          OleVariant &StatusCode, WordBool &Cancel);
	void __fastcall WebBrowser1DownloadBegin(TObject *Sender);
	void __fastcall WebBrowser1DownloadComplete(TObject *Sender);
	void __fastcall Image1MouseEnter(TObject *Sender);
	void __fastcall Image1MouseLeave(TObject *Sender);
	void __fastcall Image1Click(TObject *Sender);
	void __fastcall Createnewtab1Click(TObject *Sender);
	void __fastcall Closeactivetab1Click(TObject *Sender);
	void __fastcall PageControl1Change(TObject *Sender);
	void __fastcall PopupMenu1Popup(TObject *Sender);
	void __fastcall Preview1Click(TObject *Sender);
	void __fastcall Printersetting1Click(TObject *Sender);
	void __fastcall Print2Click(TObject *Sender);
	void __fastcall WebBrowser2DocumentComplete(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL);
	void __fastcall Properties1Click(TObject *Sender);
	void __fastcall Setting1Click(TObject *Sender);
	void __fastcall ClearhistoryClick(TObject *Sender);
	void __fastcall ShowhelpClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall BitBtn11Click(TObject *Sender);
private:
public:

void __fastcall BrowserNavigateComplete2(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL);

void __fastcall BrowserProgressChange(TObject *ASender, int Progress,
          int ProgressMax);

void __fastcall BrowserDocumentComplete(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL);

void __fastcall BrowserTitleChange(TObject *ASender,
          const WideString Text);

void __fastcall BrowserNewWindow2(TObject *ASender, IDispatch *&ppDisp,
          WordBool &Cancel);

void __fastcall BrowserNavigateError(TObject *ASender,
          const IDispatch *pDisp, OleVariant &URL, OleVariant &Frame,
          OleVariant &StatusCode, WordBool &Cancel);

void __fastcall BrowserDownloadBegin(TObject *Sender);

void __fastcall BrowserDownloadComplete(TObject *Sender);
	__fastcall TForm1(TComponent* Owner);
};

extern PACKAGE TForm1 *Form1;

#endif