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
    qrPesquisaid_plano: TLongintField;
    qrPesquisatipo: TStringField;
  private

  public

  end;

var
  frmcad_planoconta: Tfrmcad_planoconta;

implementation

{$R *.lfm}

end.

