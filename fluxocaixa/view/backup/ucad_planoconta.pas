unit ucad_planoconta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, utabela, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  ZDataset, ucad_padrao, DB;

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
    procedure btnPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  frmcad_planoconta: Tfrmcad_planoconta;

implementation

{$R *.lfm}

{ Tfrmcad_planoconta }

procedure Tfrmcad_planoconta.btnPesquisarClick(Sender: TObject);
begin
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
     if qrPesquisa.RecordCount <= 0; then
        ShowMessage('Nenhum registro encontrado !');
end;

end.

