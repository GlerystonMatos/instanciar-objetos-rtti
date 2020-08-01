unit uPessoa;

interface

uses
  Classes;

type
  TPessoa = class(TInterfacedPersistent)
  public
    function ToString: string; override;
  end;

implementation

{ TPessoa }

function TPessoa.ToString: string;
begin
  Result := 'Gleryston Matos';
end;

initialization
  RegisterClass(TPessoa);

finalization
  UnRegisterClass(TPessoa);

end.
