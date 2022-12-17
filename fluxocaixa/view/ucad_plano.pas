unit ucad_plano;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ucad_padrao;

type

  { Tfrmcad_planoconta }

  Tfrmcad_planoconta = class(Tfrmcad_padrao)
    cboTipo: TComboBox;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblTipo: TLabel;
  private

  public

  end;

var
  frmcad_planoconta: Tfrmcad_planoconta;

implementation

{$R *.lfm}

end.

