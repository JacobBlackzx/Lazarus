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
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation
    uses uprincipal;

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.DataModuleCreate(Sender: TObject);
begin

end;

procedure TTabGlobal.conexaoBeforeConnect(Sender: TObject);
begin
// Estrutura Padrão Microsoft e Linux
//  conexao.Protocol     :='MariaDB-10';
  conexao.Database     :=cfg_banco;
  conexao.HostName     :=cfg_servidor;
  conexao.User         :=cfg_usuario;
  conexao.Password     :=cfg_senha;
  conexao.Port         :=cfg_porta;

  conexao.AutoCommit   :=True;
// Estrutura para conexão a banco de dados Microsoft
  {$IFDEF WINDOWS}
       if cfg_odbc = EmptyStr then
//          ShowMessage(cfg_pathApp+'libmariadb.dll');
          conexao.LibraryLocation := cfg_pathApp+'libmariadb.dll' //dll 32bits
       else
         begin
           conexao.Protocol:='ado'; // Banco com arquitetura 64Bots
           conexao.Database:='Driver={mariadb ODBC 3.1 Driver}; server='+cfg_servidor+'; Database='+cfg_banco+'; User='+cfg_usuario+'; password='+cfg_senha+'; option=3;'
         end;

  {$ENDIF}
end;

end.

