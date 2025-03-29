program dingo;

uses
  Forms,
  dingocode in 'dingocode.pas' {BrowserWindow};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Dingo navigator';
  Application.CreateForm(TBrowserWindow, BrowserWindow);
  Application.Run;
end.
