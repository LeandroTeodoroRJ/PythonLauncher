unit UnitAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormAdd = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    EditProg: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditProgLocate: TEdit;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    Label5: TLabel;
    EditPython: TEdit;
    Label6: TLabel;
    EditPythonLocate: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdd: TFormAdd;

implementation

{$R *.dfm}

uses Main;

procedure TFormAdd.Button1Click(Sender: TObject);
begin
if (EditPython.Text <> '') and (EditPythonLocate.Text <> '') then
begin
  FormMain.StringPython.Cells[0,EndoffilePython]:=EditPython.Text;
  FormMain.StringPython.Cells[1,EndoffilePython]:=EditPythonLocate.Text;
  EditPython.Text:= '';
  EditPythonLocate.Text:= '';
  EndoffilePython:= EndoffilePython+1;
  modificacao_path:=True;   //Ao sair grava as modificações
  FormMain.StringPython.RowCount:=EndoffilePython;
end;
end;

procedure TFormAdd.Button2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
  EditProgLocate.Text:=OpenDialog1.FileName;
end;
end;

procedure TFormAdd.Button3Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
  EditPythonLocate.Text:=OpenDialog1.FileName;
end;
end;

procedure TFormAdd.Button4Click(Sender: TObject);
begin
if (EditProg.Text <> '') and (EditProgLocate.Text <> '') then
begin
  FormMain.StringPrograma.Cells[0,Endoffile]:=EditProg.Text;
  FormMain.StringPrograma.Cells[1,Endoffile]:=EditProgLocate.Text;
  EditProg.Text:= '';
  EditProgLocate.Text:= '';
  Endoffile:= Endoffile+1;
  modificacao_path:=True;   //Ao sair grava as modificações
  FormMain.StringPrograma.RowCount:=Endoffile;

end;
end;

procedure TFormAdd.Button5Click(Sender: TObject);
begin
FormAdd.Close;
end;

end.
