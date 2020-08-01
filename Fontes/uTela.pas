unit uTela;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTela = class(TForm)
    lbNome: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTela: TfrmTela;

implementation

{$R *.dfm}

procedure TfrmTela.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case (Key) of
    VK_ESCAPE:
      Close;
  end;
end;

initialization
  RegisterClass(TfrmTela);

finalization
  UnRegisterClass(TfrmTela);

end.
