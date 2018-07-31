unit UClassNFe;

interface

uses uClassDestinatario, uClassEmitente, uClassFatura, uClassIdentifica,
  uClassInformacaoAdicional, uClassNFEexporta, uClassNFEtransp, uClassProdutos,
  uClassReferenciada, uClassTotal;

Type
  TNFe = Class
  public
    Versao: String; { Versão do leiaute }
    CaminhoXML: String; { Nome do Arquivo XML }
    NomeXML: String; { Nome do Arquivo XML }
    Assinada: String; { Registrar se o XML da NF-e foi assinado }
    Validada: String; { Registrar se o XML da NF-e foi validado }
    Autorizada: String; { Registrar se o XML da NF-e foi validado }
    idLote: String; { Identificação do da NF-e }
    xPed: String; { 407-ZB03-Pedido }
    ide: TIde;
    ref: TRef;
    emit: TEmit;
    dest: TDest;
    itens: TItemList;
    total: TTotal;
    transp: TTransp;
    cobranca: TCobranca;
    adicional: TAdicional;
    exporta: TExporta;
    constructor Create;
    destructor Destroy; override;
  End;

implementation


{ TNFe }

constructor TNFe.Create;
begin
  inherited Create;
  Versao := '2.00';
  Autorizada := 'N';
  ide := TIde.Create;
  //ref := TRef.Create;
  emit := TEmit.Create;
  dest := TDest.Create;
  itens := TItemList.Create;
  total := TTotal.Create;
  transp := TTransp.Create;
  cobranca := TCobranca.Create;
  adicional := TAdicional.Create;
  exporta := TExporta.Create;
end;

destructor TNFe.Destroy;
begin
  ide.Free;
  ref.Free;
  emit.Free;
  dest.Free;
  itens.Free;
  total.Free;
  transp.Free;
  cobranca.Free;
  adicional.Free;
  exporta.Free;
  inherited;
end;

end.
