unit ucad_padrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ComCtrls, StdCtrls;

type

  TCliqueBotao = (cbIncluir, cbAlterar, cbNone);

  { Tfrmcad_padrao }

  Tfrmcad_padrao = class(TForm)
    btnAlterar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtPequisa: TEdit;
    pcCadastro: TPageControl;
    pnpTCadastroPadrao: TPanel;
    pnpTitulo: TPanel;
    pnpRodape: TPanel;
    btnIncluir: TSpeedButton;
    btnPesquisa: TSpeedButton;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcCadastroResize(Sender: TObject);
  private
    procedure botao_edicao(lFLAG:Boolean);
  public

  end;

var
  frmcad_padrao: Tfrmcad_padrao;
  cliqueBotao: TCliqueBotao;

implementation

{$R *.lfm}

{ Tfrmcad_padrao }

procedure Tfrmcad_padrao.FormShow(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.pcCadastroResize(Sender: TObject);
begin

end;

procedure Tfrmcad_padrao.btnIncluirClick(Sender: TObject);
begin
  botao_edicao(True);
  cliqueBotao := cbIncluir;
end;

procedure Tfrmcad_padrao.btnRemoverClick(Sender: TObject);
begin
  botao_edicao(False);
  cliqueBotao := cbNone;
end;

procedure Tfrmcad_padrao.btnSalvarClick(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.btnAlterarClick(Sender: TObject);
begin
  botao_edicao(True);
  cliqueBotao := cbAlterar;
end;

procedure Tfrmcad_padrao.btnCancelarClick(Sender: TObject);
begin
  botao_edicao(False);
  cliqueBotao := cbNone;
end;

procedure Tfrmcad_padrao.botao_edicao(lFLAG: Boolean);
begin
  btnIncluir.Visible    := not lFLAG;
  btnAlterar.Visible    := not lFLAG;
  btnRemover.Visible    := not lFLAG;
  btnSalvar.Visible     := lFLAG;
  btnCancelar.Visible   := lFLAG;
end;

end.

