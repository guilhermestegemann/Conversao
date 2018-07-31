unit UCTeImportacao;

interface


type
  TCTeImportacao = Class (TObject)
  private
  public
    class function GetCodigoClifor(ACNPJ, ATipo: String): Integer;
    class function GetCodigoMotorista(ACPF: String): Integer;
    class function Importar(AArquivo: String; AFilial: Integer) : boolean;
    class function GravarCancelamentoCTe(AArquivo: String; AFilial: Integer) : boolean;
  End;

implementation

uses
  UFerramentas, ACBrCTe, SysUtils, pcnConversao,
  pcteCTe, DBClient, Classes, pcteConversaoCTe, uDMDados;

{ TCTeImportacao }



class function TCTeImportacao.GetCodigoClifor(ACNPJ, ATipo: String): Integer;
var
  ASQL: String;
begin
  ASQL := 'SELECT CODIGO FROM CLIFOR WHERE CLIFOR.CNPJ = %s';
  ASQL := Format(ASQL, [QuotedStr(MascaraCnpj(ACNPJ))]);
  Open_SQL(DMDados.cdGeral, ASQL);
  if DMDados.cdGeral.RecordCount <> 1 then
    raise Exception.Create('Erro ao encontrar: ' + ATipo)
  else
    Result := DMDados.cdGeral.FieldByName('CODIGO').AsInteger;
end;

class function TCTeImportacao.GetCodigoMotorista(ACPF: String): Integer;
var
  ASQL: String;
begin
  ASQL := 'SELECT CODIGO FROM FUNCIONARIO WHERE FUNCIONARIO.CPF = %s';
  ASQL := Format(ASQL, [QuotedStr(MascaraCpf(ACPF))]);
  Open_SQL(DMDados.cdGeral, ASQL);
  if DMDados.cdGeral.RecordCount <> 1 then
    raise Exception.Create('Erro ao encontrar Motorista.')
  else
    Result := DMDados.cdGeral.FieldByName('CODIGO').AsInteger;
end;

class function TCTeImportacao.GravarCancelamentoCTe(AArquivo: String; AFilial: Integer): boolean;
var
  ACBrCTe : TACBrCTe;
  i : Integer;
begin

  Result := False;
  ACBrCTe := TACBrCTe.Create(nil);

  try
    if ACBrCTe.EventoCTe.LerXML(AArquivo) then
    begin
      for I := 0 to (ACBrCTe.EventoCTe.Evento.Count-1) do
      begin
        if ACBrCTe.EventoCTe.Evento[i].InfEvento.tpEvento = teCancelamento then
        begin
          Open_SQL(DMDados.cdCTe, Format('SELECT * FROM CT WHERE CT.CHAVE = %s AND CT.FILIAL = %d',
            [QuotedStr(ACBrCTe.EventoCTe.Evento[i].InfEvento.chCTe), AFilial]));
          if DMDados.cdCTe.RecordCount <> 1 then
            raise Exception.Create('CT-e não encontrado.')
          else
          begin
            DMDados.cdCTe.Edit;
            DMDados.cdCTeCANCNPROT.AsString := ACBrCTe.EventoCTe.Evento[i].RetInfEvento.nProt;
            DMDados.cdCTeCANCELADO.AsString := 'S';
            DMDados.cdCTeCANCXML.AsString   := ObterXML(AArquivo);
            if not GravarMaster(DMDados.cdCTe, true, 'Erro de gravação no Cancelamento do CT-e.') then Abort;
            Result := True;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(ACBrCTe);
  end;
end;

class function TCTeImportacao.Importar(AArquivo: String; AFilial: Integer): boolean;
var
  ACBrCTe : TACBrCTe;
  I, J, IdCTe : Integer;

  function GetCodigoCFOP(ACFOP: Integer): String;
  var
    ACFOPTexto: String;
  begin
    ACFOPTexto := IntToStr(ACFOP);
    ACFOPTexto := Copy(ACFOPTexto, 1, 1) + '.' + Copy(ACFOPTexto, 2 , 3);
    Open_SQL(DMDados.cdGeral, Format('SELECT CODIGO FROM CFOP WHERE CFOP.CFOP = %s', [QuotedStr(ACFOPTexto)]));
    if DMDados.cdGeral.RecordCount <> 1 then
      raise Exception.Create('Problema ao encontrar CFOP.')
    else
      Result := DMDados.cdGeral.FieldByName('CODIGO').AsString;
  end;

begin

  Result := False;
  ACBrCTe := TACBrCTe.Create(nil);

  try
    if ACBrCTe.Conhecimentos.LoadFromFile(AArquivo) then
    begin
      for I := 0 to ACBrCTe.Conhecimentos.Count - ACBrCTe.Conhecimentos.Count do
      begin
        Open_SQL(DMDados.cdCTe, 'SELECT * FROM CT WHERE CT.NUMERO IS NULL');
        DMDados.cdCTe.Append;
        //DMDados.cdCTeID.AsInteger := ACBrCTe.Conhecimentos.Items[I].CTe.ide.cCT;
        DMDados.cdCTeEMISSAO.AsDateTime := ACBrCTe.Conhecimentos.Items[I].CTe.ide.dhEmi;
        DMDados.cdCTeMODELO.AsInteger := ACBrCTe.Conhecimentos.Items[I].CTe.ide.modelo;
        DMDados.cdCTeSERIE.AsInteger := ACBrCTe.Conhecimentos.Items[I].CTe.ide.serie;
        DMDados.cdCTeNUMERO.AsInteger := ACBrCTe.Conhecimentos.Items[I].CTe.ide.nCT;
        DMDados.cdCTeCFOP.AsString := GetCodigoCFOP(ACBrCTe.Conhecimentos.Items[I].CTe.ide.CFOP);
        DMDados.cdCTeVALORTOTAL.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.vTPrest;
        DMDados.cdCTeVALORDESCONTO.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.cobr.Fat.vDesc;

        ACBrCTe.Conhecimentos.Items[I].CTe.Ide.modal := mdRodoviario;

        case ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.SituTrib of
          cst00 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS00.CST);
                    DMDados.cdCTeBASEICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS00.vBC;
                    DMDados.cdCTeVALORREDBASEICMS.AsFloat := 0;
                    DMDados.cdCTePERCICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS00.pICMS;
                    DMDados.cdCTeVALORICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS00.vICMS;
                  end;
          cst20 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS20.CST);
                    DMDados.cdCTeBASEICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS20.vBC;
                    DMDados.cdCTeVALORREDBASEICMS.AsFloat := GetValorPerc(DMDados.cdCTeBASEICMS.AsFloat, ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS20.pRedBC);
                    DMDados.cdCTePERCICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS20.pICMS;
                    DMDados.cdCTeVALORICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS20.vICMS;
                  end;
          cst40 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS45.CST);
                  end;
          cst41 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS45.CST);
                  end;
          cst45 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS45.CST);
                    DMDados.cdCTeBASEICMS.AsFloat := 0;
                    DMDados.cdCTeVALORREDBASEICMS.AsFloat := 0;
                    DMDados.cdCTePERCICMS.AsFloat := 0;
                    DMDados.cdCTeVALORICMS.AsFloat := 0;
                  end;
          cst60 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS60.CST);
                    DMDados.cdCTeBASEICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS60.vBCSTRet;
                    DMDados.cdCTeVALORREDBASEICMS.AsFloat := 0;
                    DMDados.cdCTePERCICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS60.pICMSSTRet;
                    DMDados.cdCTeVALORICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS60.vICMSSTRet;
                  end;
          cst90 : begin
                    DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS90.CST);
                    DMDados.cdCTeBASEICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS90.vBC;
                    DMDados.cdCTeVALORREDBASEICMS.AsFloat := GetValorPerc(DMDados.cdCTeBASEICMS.AsFloat, ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS90.pRedBC);
                    DMDados.cdCTePERCICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS90.pICMS;
                    DMDados.cdCTeVALORICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMS90.vICMS;
                  end;
          cstICMSOutraUF : begin
                             DMDados.cdCTeCSTICMS.AsString := CSTICMSToStr(ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMSOutraUF.CST);
                             DMDados.cdCTeBASEICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMSOutraUF.vBCOutraUF;
                             DMDados.cdCTeVALORREDBASEICMS.AsFloat := GetValorPerc(DMDados.cdCTeBASEICMS.AsFloat, ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMSOutraUF.pRedBCOutraUF);
                             DMDados.cdCTePERCICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMSOutraUF.pICMSOutraUF;
                             DMDados.cdCTeVALORICMS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.Imp.ICMS.ICMSOutraUF.vICMSOutraUF;
                           end;
        end;

        for j := 0 to (ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp.Count -1) do
        begin
          if ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].xNome = 'VALOROUTRAS' then
            DMDados.cdCTeVALOROUTRAS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].vComp;
          if ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].xNome = 'VALORPEDAGIO' then
            DMDados.cdCTeVALORPEDAGIO.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].vComp;
          if ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].xNome = 'FRETE' then
            DMDados.cdCTeVALORSERVICO.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.vPrest.Comp[j].vComp;
        end;

        DMDados.cdCTeCHAVE.AsString := ACBrCTe.Conhecimentos.Items[0].CTe.procCTe.chCTe;
        DMDados.cdCTeTIPOCTE.AsString := tpCTToStr(ACBrCTe.Conhecimentos.Items[0].CTe.ide.tpCTe);
        DMDados.cdCTeXML.AsString := ObterXML(AArquivo);
        if ACBrCTe.Conhecimentos.Items[0].CTe.rem.CNPJCPF <> '' then
          DMDados.cdCTeREMETENTE.AsInteger := GetCodigoClifor(ACBrCTe.Conhecimentos.Items[0].CTe.rem.CNPJCPF, 'Remetente');
        if ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF <> '' then
          DMDados.cdCTeDESTINATARIO.AsInteger := GetCodigoClifor(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 'Destinatário');
        if ACBrCTe.Conhecimentos.Items[0].CTe.receb.CNPJCPF <> '' then
          DMDados.cdCTeRECEBEDOR.AsInteger := GetCodigoClifor(ACBrCTe.Conhecimentos.Items[0].CTe.receb.CNPJCPF, 'Recebedor');
        if ACBrCTe.Conhecimentos.Items[0].CTe.exped.CNPJCPF <> '' then
          DMDados.cdCTeEXPEDIDOR.AsInteger := GetCodigoClifor(ACBrCTe.Conhecimentos.Items[0].CTe.exped.CNPJCPF, 'Expedidor');
        if ACBrCTe.Conhecimentos.Items[0].CTe.ide.toma4.CNPJCPF <> '' then
          DMDados.cdCTeTOMADOR.AsInteger := GetCodigoClifor(ACBrCTe.Conhecimentos.Items[0].CTe.ide.toma4.CNPJCPF, 'Tomador');

        if TpTomadorToStr(ACBrCTe.Conhecimentos.Items[I].CTe.ide.toma03.Toma) <> '' then
          DMDados.cdCTeTOMADORSERVICO.AsString := TpTomadorToStr(ACBrCTe.Conhecimentos.Items[I].CTe.ide.toma03.Toma);
        if TpTomadorToStr(ACBrCTe.Conhecimentos.Items[I].CTe.ide.toma4.toma) <> '' then
          DMDados.cdCTeTOMADORSERVICO.AsString := TpTomadorToStr(ACBrCTe.Conhecimentos.Items[I].CTe.ide.toma4.toma);

        DMDados.cdCTeINDICADORFORMAPAGAMENTO.AsString := tpforPagToStr(ACBrCTe.Conhecimentos.Items[I].CTe.ide.forPag);
        DMDados.cdCTeINDICADORTIPOSERVICO.AsString := TpServPagToStr (ACBrCTe.Conhecimentos.Items[I].CTe.ide.tpServ);
        DMDados.cdCTeNPROT.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.procCTe.nProt;
        DMDados.cdCTeDATAPREVISTAENTREGA.AsDateTime := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.dPrev;

        { *** INFORMAÇÕES DA CARGA *** }
        if (ACBrCTe.Conhecimentos.Items[I].CTe.Ide.tpCTe in [tcNormal, tcSubstituto]) then
        begin
          DMDados.cdCTeCARGAPREDOMINANTE.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.proPred;
          for j := 0 to (ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.InfQ.Count - 1) do
          begin
            if ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.InfQ[j].tpMed = 'PESO BRUTO' then
            begin
              DMDados.cdCTePESOBRUTO.AsFloat := ACBrCTe.Conhecimentos.Items[0].CTe.infCTeNorm.infCarga.InfQ[j].qCarga;
            end;
            if ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.InfQ[j].tpMed = 'PESO LIQUIDO' then
            begin
              DMDados.cdCTePESOLIQUIDO.AsFloat := ACBrCTe.Conhecimentos.Items[0].CTe.infCTeNorm.infCarga.InfQ[j].qCarga;
            end;
            if ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.InfQ[j].tpMed = 'VOLUMES' then
            begin
              DMDados.cdCTeVOLUMES.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.InfQ[j].qCarga;
            end;
          end;
          DMDados.cdCTeVALORTOTALITENS.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infCarga.vCarga;
        end;
        DMDados.cdCTeVALORTOTALTRIBUTO.AsFloat := ACBrCTe.Conhecimentos.Items[I].CTe.imp.vTotTrib;
        DMDados.cdCTeOBS.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.compl.xObs;
        if (ACBrCTe.Conhecimentos.Items[I].CTe.Ide.tpCTe = tcComplemento) then
        begin
          DMDados.cdCTeCHAVEREFERENCIADA.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.infCteComp.Chave;
        end;
        if (ACBrCTe.Conhecimentos.Items[I].CTe.Ide.tpCTe = tcAnulacao) then
        begin
          DMDados.cdCTeCHAVEREFERENCIADA.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.infCteAnu.chCTe;
        end;

        if (ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.veic.Count > 0) then  {só um veiculo informado no ERP}
        begin
          DMDados.cdCTeVEICULO.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.veic[0].cInt;
        end;

        if (ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.moto.Count > 0) then  {só um motorista informado no ERP}
        begin
          DMDados.cdCTeMOTORISTA.AsInteger := GetCodigoMotorista(ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.moto[0].CPF);
        end;

        DMDados.cdCTeINDICADORLOTACAO.AsString := TpLotacaoToStr(ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.rodo.Lota);
        DMDados.cdCTeATUALIZADO.AsString := 'S';
        DMDados.cdCTeAUTORIZADO.AsString := 'S';

        if not GravarMaster(DMDados.cdCTe, true, 'Erro de gravação no CT-e.') then Abort;
        Result := True;

        // itemCTe

        Open_SQL(DMDados.cdGeral, Format('SELECT CT.ID AS ID FROM CT WHERE (CT.NUMERO = %D AND CT.FILIAL = %D)', [ACBrCTe.Conhecimentos.Items[I].CTe.ide.nCT, AFilial]));
        IdCTe := DMDados.cdGeral.FieldByName('ID').AsInteger;
        DMDados.cdGeral.Close;

        for j := 0 to (ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infDoc.infNFe.Count -1) do
        begin
          Open_SQL(DMDados.cdItemCTe, 'SELECT * FROM ITEMCT WHERE ITEMCT.CT IS NULL');
          DMDados.cdItemCTe.Append;
          DMDados.cdItemCTeCT.AsInteger := IdCTe;
          Open_SQL(DMDados.cdGeral, Format('SELECT MAX(ITEM) ITEM FROM ITEMCT WHERE (ITEMCT.CT = %D)', [DMDados.cdItemCTeCT.AsInteger]));
          DMDados.cdItemCTeITEM.AsInteger := DMDados.cdGeral.FieldByName('ITEM').AsInteger + 1;
          DMDados.cdGeral.Close;
          DMDados.cdItemCTeCHAVEACESSO.AsString := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.infDoc.infNFe[j].chave;
          if not GravarMaster(DMDados.cdItemCTe, true, 'Erro de gravação no Item CT-e.') then Abort;
        end;

        for j := 0 to (ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.cobr.dup.Count - 1) do
        begin
          Open_SQL(DMDados.cdOrdemCTe, 'SELECT * FROM ORDEMCT WHERE ORDEMCT.CT IS NULL');
          DMDados.cdOrdemCTe.Append;
          DMDados.cdOrdemCTeCT.AsInteger := IdCTe;
          DMDados.cdOrdemCTeORDEM.AsString  := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.cobr.dup.Items[j].nDup;
          DMDados.cdOrdemCTeVCTO.AsDateTime := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.cobr.dup.Items[j].dVenc;
          DMDados.cdOrdemCTeVALOR.AsFloat   := ACBrCTe.Conhecimentos.Items[I].CTe.infCTeNorm.cobr.dup.Items[j].vDup;
          if not GravarMaster(DMDados.cdOrdemCTe, true, 'Erro de gravação na Ordem CT-e.') then Abort;
        end;

      end;
    end;
  finally
    FreeAndNil(ACBrCTe);
  end;

end;

end.
