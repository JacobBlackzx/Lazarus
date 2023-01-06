unit ucad_planoconta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, utabela, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  ZDataset, ZSqlUpdate, ucad_padrao, DB, classe_plano;

type

  { Tfrmcad_planoconta }

  Tfrmcad_planoconta = class(Tfrmcad_padrao)
    cboTipo: TComboBox;
    dsPesquisa: TDataSource;
    dbgTela: TDBGrid;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblTipo: TLabel;
    qrPesquisa: TZQuery;
    qrPesquisadescricao: TStringField;
    qrPesquisaid_plano1: TLongintField;
    qrPesquisatipo: TStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cboTipoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmcad_planoconta: Tfrmcad_planoconta;
  plano: Tplano; // Declaração de variavel Plano

implementation

{$R *.lfm}

{ Tfrmcad_planoconta }

procedure Tfrmcad_planoconta.btnPesquisarClick(Sender: TObject);
begin
// Implementação da função Pesquisar via caixa e btn
  if qrPesquisa.Active then qrPesquisa.Close;
     qrPesquisa.SQL.Clear;
     qrPesquisa.SQL.Add('select * from planos');
     qrPesquisa.SQL.Add('where descricao like :cPesquisa');
     qrPesquisa.ParamByName('cPesquisa').AsString:= '%'+Trim(edtPesquisa.Text+'%');
     try
       qrPesquisa.Open;
     except
       on e: Exception do
          ShowMessage('Erro ao realizar a pesquisa'+sLineBreak+e.ClassName+sLineBreak+ e.Message);
     end;
     if qrPesquisa.RecordCount <= 0 then
        ShowMessage('Nenhum registro encontrado !');
end;

procedure Tfrmcad_planoconta.btnIncluirClick(Sender: TObject);
begin
// Implementar função do botão Incluir
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
end;

procedure Tfrmcad_planoconta.btnSalvarClick(Sender: TObject);
begin
// Implementar função do botão Salvar
  inherited;
  plano.id_plano  :=StrToInt(edtCodigo.Text);
  plano.descricao :=edtDescricao.Text;
  plano.tipo      :=cboTipo.Text;
  plano.incluir;
end;

procedure Tfrmcad_planoconta.cboTipoChange(Sender: TObject);
begin

end;

procedure Tfrmcad_planoconta.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if Assigned(plano) then
     FreeAndNil(plano);
end;

procedure Tfrmcad_planoconta.FormCreate(Sender: TObject);
begin
  plano := Tplano.Create;
end;

end.

