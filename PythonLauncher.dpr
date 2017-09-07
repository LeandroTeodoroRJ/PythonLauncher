program PythonLauncher;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  UnitAdd in 'UnitAdd.pas' {FormAdd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PythonLauncher';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAdd, FormAdd);
  Application.Run;
end.
