program ImportaXML;

uses
  Forms,
  MidasLib,
  Form_Principal in 'Form_Principal.pas' {FormPrincipal},
  uDMDados in 'DataModule\uDMDados.pas' {DMDados: TDataModule},
  UClassNFe in 'UClassNFe.pas',
  uClassDestinatario in 'NFe\uClassDestinatario.pas',
  uClassEmitente in 'NFe\uClassEmitente.pas',
  uClassFatura in 'NFe\uClassFatura.pas',
  uClassIdentifica in 'NFe\uClassIdentifica.pas',
  uClassInformacaoAdicional in 'NFe\uClassInformacaoAdicional.pas',
  uClassNFEexporta in 'NFe\uClassNFEexporta.pas',
  uClassNFEtransp in 'NFe\uClassNFEtransp.pas',
  uClassProdutos in 'NFe\uClassProdutos.pas',
  uClassReferenciada in 'NFe\uClassReferenciada.pas',
  uClassTotal in 'NFe\uClassTotal.pas',
  uClassEndereco in 'NFe\uClassEndereco.pas',
  UFerramentas in 'UFerramentas.pas',
  UData in 'UData.pas',
  UCTeImportacao in 'UCTeImportacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDMDados, DMDados);
  Application.Run;
end.
