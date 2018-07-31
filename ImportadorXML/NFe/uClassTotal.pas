unit uClassTotal;

interface
type
   {Valores Totais da NF-e}
   TICMSTot = class
   private
      fvBC : String; {328-W03-Base de Cálculo do ICMS}
      fvICMS : String; {329-W04-Valor Total do ICMS}
      fvBCST : String; {330-W05-Base de Cálculo do ICMS ST}
      fvST : String; {331-W06-Valor Total do ICMS ST}
      fvProd : String; {332-W07-Valor Total dos produtos e serviços}
      fvFrete : String; {333-W08-Valor Total do Frete}
      fvSeg : String; {334-W09-Valor Total do Seguro}
      fvDesc : String; {335-W10-Valor Total do Desconto}
      fvII : String; {336-W11-Valor Total do II}
      fvIPI : String; {337-W12-Valor Total do IPI}
      fvPIS : String; {338-W13-Valor do PIS}
      fvCOFINS : String; {339-W14-Valor do COFINS}
      fvOutro : String; {340-W15-Outras Despesas acessórias}
      fvNF : String; {341-W16-Valor Total da NF-e}
   published
      property vBC : String read fvBC write fvBC;
      property vICMS : String read fvICMS write fvICMS;
      property vBCST : String read fvBCST write fvBCST;
      property vST : String read fvST write fvST;
      property vProd : String read fvProd write fvProd;
      property vFrete : String read fvFrete write fvFrete;
      property vSeg : String read fvSeg write fvSeg;
      property vDesc : String read fvDesc write fvDesc;
      property vII : String read fvII write fvII;
      property vIPI : String read fvIPI write fvIPI;
      property vPIS : String read fvPIS write fvPIS;
      property vCOFINS : String read fvCOFINS write fvCOFINS;
      property vOutro : String read fvOutro write fvOutro;
      property vNF : String read fvNF write fvNF;
   end;
   // add Fabianne
   TISSQNTot = class
   private
      fvServ : String; {343-W18-Valor total dos serviços sob nao incidencia ou nao tributados pelo ICMS}
      fvBC : String; {344-W19-base de calculo do ISS}
      fvISS : String; {345-W20-valor total do ISS}
      fvPIS : String; {346-w21-valor do PIS sobre serviço}
      fvCOFINS : String; {347-W22-valor do COFINS sobre serviços}
   published
      property vServ : String read fvServ write fvServ;
      property vBC : String read fvBC write fvBC;
      property vISS : String read fvISS write fvISS;
      property vPIS : String read fvPIS write fvPIS;
      property vCOFINS : String read fvCOFINS write fvCOFINS;
   end;
   // fim add Fabianne
   TTotal = class
   public
      ICMSTot : TICMSTot;
      ISSQNTot: TISSQNTot; // add Fabianne
      constructor Create;
   end;

implementation

{ TTotal }
constructor TTotal.Create;
begin
     inherited Create;
     ICMSTot := TICMSTot.Create;
     ISSQNTot:= TISSQNTot.Create;
end;

end.
