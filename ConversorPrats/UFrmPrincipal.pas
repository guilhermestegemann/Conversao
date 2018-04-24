unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.IniFiles, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection1: TFDConnection;
    EditDatabase: TEdit;
    Label1: TLabel;
    BtnConectar: TButton;
    BtnDesconectar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConectarClick(Sender: TObject);
    procedure BtnDesconectarClick(Sender: TObject);
  private
    procedure ConectarDB;
    procedure DesconectarDB;
    procedure CarregarIni;
    procedure SalvarIni;
    procedure AjustaBotoesConexao;
  published

  public
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.AjustaBotoesConexao;
begin
  BtnConectar.Enabled := not FDConnection1.Connected;
  BtnDesconectar.Enabled := FDConnection1.Connected;
end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  ConectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnDesconectarClick(Sender: TObject);
begin
  DesconectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.CarregarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  EditDataBase.Text := INI.ReadString('Geral', 'database', EmptyStr);
end;

procedure TFrmPrincipal.ConectarDB;
begin
  DesconectarDB;
  FDConnection1.Params.Values['database'] := EditDatabase.Text;
  FDConnection1.Connected := True;
end;

procedure TFrmPrincipal.DesconectarDB;
begin
  FDConnection1.Connected := False;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarIni;
  DesconectarDB;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarIni;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.SalvarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  INI.WriteString('Geral', 'database', EditDatabase.Text);
end;

end.
