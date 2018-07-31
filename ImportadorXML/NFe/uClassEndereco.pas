unit uClassEndereco;

interface

type
   {Endere�o}
   TEndereco = class
   private
      fxLgr : string; {Logradouro}
      fnro : string; {N�mero}
      fxCpl : string; {Complemento}
      fxBairro : string; {Bairro}
      fcMun : string; {C�digo do munic�pio}
      fxMun : string; {Nome do munic�pio}
      fUF : string; {Sigla da UF}
      fCEP : string; {C�digo do CEP}
      fcPais : String; {C�digo do Pa�s}
      fxPais : String; {Nome do Pa�s}
      ffone  : String; {Telefone}
      femail : String;
   published
      property xLgr : String read fxLgr write fxLgr;
      property nro : String read fnro write fnro;
      property xCpl : String read fxCpl write fxCpl;
      property xBairro : String read fxBairro write fxBairro;
      property cMun : String read fcMun write fcMun;
      property xMun : String read fxMun write fxMun;
      property UF : String read fUF write fUF;
      property CEP : String read fCEP write fCEP;
      property cPais : String read fcPais write fcPais;
      property xPais : String read fxPais write fxPais;
      property fone : String read ffone write ffone;
      property email : String read femail write femail;
   end;

implementation

end.
