unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, UnitAdd,
  ShellAPI, IniFiles, System.IOUtils, Math, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFormMain = class(TForm)
    StringPrograma: TStringGrid;
    StringPython: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    ButtonRun: TButton;
    ButtonAdd: TButton;
    ButtonRemovePython: TButton;
    ButtonRemoveProgram: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure StringProgramaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringPythonSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ButtonRunClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonRemoveProgramClick(Sender: TObject);
    procedure ButtonRemovePythonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  EndofFile: integer;
  EndofFilePython: integer;
  path_program:integer;
  path_python:integer;
  modificacao_path:boolean;

implementation
procedure GravaIni(ponteiro: string; dado: string; arquivo:string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(System.IOUtils.TPath.GetDocumentsPath+System.SysUtils.PathDelim+arquivo);
  try
    ArqIni.WriteString('cfg', ponteiro, dado);
  finally
    ArqIni.Free;
  end;
end;

function LeIni(ponteiro: string; arquivo:string): string;
var
  ArqIni: TIniFile;
  dado: string;
begin
  ArqIni := TIniFile.Create(System.IOUtils.TPath.GetDocumentsPath+System.SysUtils.PathDelim+arquivo);
  try
    dado := ArqIni.ReadString('cfg', ponteiro, 'Erro ao ler valor');
  finally
    ArqIni.Free;
  end;
result:=dado;
end;

{$R *.dfm}

procedure TFormMain.ButtonAddClick(Sender: TObject);
begin
FormAdd.ShowModal;
end;

procedure TFormMain.ButtonRemoveProgramClick(Sender: TObject);
var
end_table:integer;
count:integer;
begin
if path_program <> -1 then
begin
  count:=path_program;
  end_table:=StringPrograma.RowCount;
  while count < end_table do
  begin
    StringPrograma.Cells[0,count]:= StringPrograma.Cells[0,count+1]; //Sobe 1 linha
    StringPrograma.Cells[1,count]:= StringPrograma.Cells[1,count+1];
    count:=count+1;
  end;
  StringPrograma.RowCount:=StringPrograma.RowCount-1;  //Diminui 1 linha na tabela
  modificacao_path:=True;
  Endoffile:= ifthen(Endoffile>1, Endoffile-1,Endoffile);

  if path_program = StringPrograma.RowCount then
  begin
    StringPrograma.RowCount:=StringPrograma.RowCount-1;  //Diminui 1 linha na tabela
    modificacao_path:=True;
    Endoffile:= ifthen(Endoffile>1, Endoffile-1,Endoffile);
  end;
end;
end;

procedure TFormMain.ButtonRemovePythonClick(Sender: TObject);
var
end_table:integer;
count:integer;
begin
if path_python <> -1 then
begin
  count:=path_python;
  end_table:=StringPython.RowCount;
  while count < end_table do
  begin
    StringPython.Cells[0,count]:= StringPython.Cells[0,count+1]; //Sobe 1 linha
    StringPython.Cells[1,count]:= StringPython.Cells[1,count+1];
    count:=count+1;
  end;
  StringPython.RowCount:=StringPython.RowCount-1;  //Diminui 1 linha na tabela
  modificacao_path:=True;
  EndoffilePython := ifthen(EndoffilePython>1, EndoffilePython-1,EndoffilePython);

  if path_python = StringPython.RowCount then
  begin
    StringPython.RowCount:=StringPython.RowCount-1;  //Diminui 1 linha na tabela
    modificacao_path:=True;
    EndoffilePython := ifthen(EndoffilePython>1, EndoffilePython-1,EndoffilePython);
  end;
end;
end;

procedure TFormMain.ButtonRunClick(Sender: TObject);
var
interpreter:string;
path:string;
begin
if (path_program <> -1)and(path_python <> -1) then
begin
  interpreter:=StringPython.Cells[1,path_python];
  path:=StringPrograma.Cells[1,path_program];
  ShellExecute(handle,'open',PChar(interpreter), Pchar(path),'',SW_SHOWNORMAL)
  //C:\Users\Leandro\AppData\Local\Programs\Python\Python35-32\python.exe
  //C:\Users\Leandro\Documents
end
else
begin
  showmessage('Escolha o programa e o interpretador.');
end;

end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
count:integer;        //Contador da tabela
count_grava:integer;  //Contador do arquivo ini
begin
if modificacao_path = True then
begin
  count:=0;
  count_grava:=2;
  //Grava o EoF do arquivo de path dos interpretadores
  GravaIni('1', inttostr(EndoffilePython) ,'Interpreter.ini');
  while count < EndoffilePython do
  begin
    //Grava descrição
    GravaIni(inttostr(count_grava), StringPython.Cells[0,count] ,'Interpreter.ini');
    //Grava o caminho do path
    GravaIni(inttostr(count_grava+1), StringPython.Cells[1,count] ,'Interpreter.ini');
    count:= count+1;
    count_grava:= count_grava+2;
  end;
  count:=0;
  count_grava:=2;
  //Aqui grava o arquivo do path dos programas
  //Grava o EoF do arquivo de path dos programas
  GravaIni('1', inttostr(Endoffile) ,'Programas.ini');
  while count < Endoffile do
  begin
    //Grava descrição
    GravaIni(inttostr(count_grava), StringPrograma.Cells[0,count] ,'Programas.ini');
    //Grava o caminho do path
    GravaIni(inttostr(count_grava+1), StringPrograma.Cells[1,count] ,'Programas.ini');
    count:= count+1;
    count_grava:= count_grava+2;
  end;

end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
count:integer;        //Contador da tabela
count_grava:integer;  //Contador do arquivo ini
begin
StringPrograma.ColWidths[0]:=200;
StringPython.ColWidths[0]:=200;
StringPrograma.ColWidths[1]:=400;
StringPython.ColWidths[1]:=400;
StringPrograma.Cells[0,0]:='Description';
StringPython.Cells[0,0]:='Description';
StringPrograma.Cells[1,0]:='Locate';
StringPython.Cells[1,0]:='Locate';

path_program:=-1; //Célula default selecionada
path_python:=-1;

modificacao_path:=False;  //Sem novas modificações a serem gravadas no arquivo
                          //path

//Lê o EndOfFile atual do arquivo de path dos interpretadores
if LeIni('1', 'Interpreter.ini') <> 'Erro ao ler valor' then
begin
  //Primeiro registro grava o EndOfFile
  EndoffilePython:=strtoint(LeIni('1', 'Interpreter.ini'));
  Endoffile:=strtoint(LeIni('1', 'Programas.ini'));
  StringPrograma.RowCount:=Endoffile;       //Aumenta as linhas
  StringPython.RowCount:=EndoffilePython;

  //Path do interpretador
  count:=0;
  count_grava:=2;
  while count < EndoffilePython do
  begin
    //Lê descrição
    StringPython.Cells[0,count]:= LeIni(inttostr(count_grava), 'Interpreter.ini');
    //Lê o caminho do path
    StringPython.Cells[1,count]:= LeIni(inttostr(count_grava+1), 'Interpreter.ini');
    count:= count+1;
    count_grava:= count_grava+2;
  end;

  //Continua aqui para o path dos programas
  count:=0;
  count_grava:=2;
  while count < Endoffile do
  begin
    //Lê descrição
    StringPrograma.Cells[0,count]:= LeIni(inttostr(count_grava), 'Programas.ini');
    //Lê o caminho do path
    StringPrograma.Cells[1,count]:= LeIni(inttostr(count_grava+1), 'Programas.ini');
    count:= count+1;
    count_grava:= count_grava+2;
  end;
end
else
begin
  showmessage('Arquivo não encontrado.');
  EndoffilePython:=1; //Defualt EoF
  Endoffile:=1;       //Defualt EoF
end;

end;

procedure TFormMain.StringProgramaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
path_program:=Arow;
end;

procedure TFormMain.StringPythonSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
path_python:=Arow;
end;

end.
