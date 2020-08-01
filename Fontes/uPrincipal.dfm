object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Instanciar Objetos Rtti'
  ClientHeight = 40
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnTestarNomeClasse: TBitBtn
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Testar (Nome Classe)'
    TabOrder = 0
    OnClick = btnTestarNomeClasseClick
  end
  object btnTestarNomeClasseTela: TBitBtn
    Left = 143
    Top = 8
    Width = 154
    Height = 25
    Caption = 'Testar (Nome Classe - Tela)'
    TabOrder = 1
    OnClick = btnTestarNomeClasseTelaClick
  end
  object btnVerificarRegistroClasses: TBitBtn
    Left = 303
    Top = 8
    Width = 161
    Height = 25
    Caption = 'Verificar Registro Classes'
    TabOrder = 2
    OnClick = btnVerificarRegistroClassesClick
  end
end
