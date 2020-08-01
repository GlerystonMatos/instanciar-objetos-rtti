unit uPrincipal;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, SysUtils, Rtti, Vcl.StdCtrls, Vcl.Buttons,
  System.TypInfo;

type
  TfrmPrincipal = class(TForm)
    btnTestarNomeClasse: TBitBtn;
    btnTestarNomeClasseTela: TBitBtn;
    btnVerificarRegistroClasses: TBitBtn;
    procedure btnTestarNomeClasseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnTestarNomeClasseTelaClick(Sender: TObject);
    procedure btnVerificarRegistroClassesClick(Sender: TObject);
  private
    function Instanciar(const AStrClass: TValue): TObject;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnVerificarRegistroClassesClick(Sender: TObject);
begin
  try
    FindClass('TPessoa');
    FindClass('TfrmTela');
    ShowMessage('As classes foram registradas.');
  except
    on E: Exception do
      ShowMessage('As classes necessárias não foram registradas.');
  end;
end;

procedure TfrmPrincipal.btnTestarNomeClasseClick(Sender: TObject);
var
  pessoa: TObject;
begin
  try
    pessoa := Instanciar('uPessoa.TPessoa').Create();
    try
      ShowMessage(pessoa.ToString);
    finally
      FreeAndNil(pessoa);
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmPrincipal.btnTestarNomeClasseTelaClick(Sender: TObject);
var
  tela: TForm;
begin
  try
    tela := TForm(Instanciar('uTela.TfrmTela')).Create(self);
    try
      tela.ShowModal;
    finally
      FreeAndNil(tela);
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case (Key) of
    VK_ESCAPE:
      Close;
  end;
end;

function TfrmPrincipal.Instanciar(const AStrClass: TValue): TObject;
var
  rttiType: TRttiType;
  rttiContext: TRttiContext;
  instancia: TRttiInstanceType;
begin
  try
    case AStrClass.Kind of
      tkString, tkLString, tkWString, tkUString:
        begin
          instancia := (rttiContext.FindType(AStrClass.AsString) as TRttiInstanceType);
          Result := (instancia.MetaclassType.Create);
        end;
      tkClassRef:
        begin
          rttiType := rttiContext.GetType(AStrClass.AsClass);
          instancia := (rttiContext.FindType(rttiType.QualifiedName) as TRttiInstanceType);
          Result := instancia.MetaclassType.Create;
        end;
    else
      raise Exception.Create('O parâmetro passado não é válidado para a função.');
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

end.
