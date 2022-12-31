unit utabela;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, Dialogs;

type

  { TTabGlobal }

  TTabGlobal = class(TDataModule)
    conexao: TZConnection;
    procedure conexaoBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation
uses uprincipal;

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.conexaoBeforeConnect(Sender: TObject);
begin
// Preparação para conexão ao banco de dados
  conexao.Database   :=cfg_banco;
  conexao.HostName   :=cfg_servidor;
  conexao.User       :=cfg_usuario;
  conexao.Password   :=cfg_senha;
  conexao.Port       :=cfg_porta;
  conexao.AutoCommit :=True;

  // Preparação para conexão Microsoft
  {$IFDEF Microsoft}
       if cfg_odbc = EmptyStr then
          conexao.LibraryLocation  :=  cfg_pathApp+'libmariadb.dll';
       else
           begin
             conexao.Protocol:='ado';
             conexao.Database:=Driver={'+cfg_odbc+'}; server='+cfg_servidor+'; Database='+cfg_banco+'; User='+cfg_usuario+'; password='+cfg_senha+'; option=3;
           end;
  {$ENDIF}
end;

end.

