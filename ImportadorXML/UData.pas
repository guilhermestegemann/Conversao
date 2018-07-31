unit UData;

interface

type
  TData = class(TObject)
  private
    FValue: TDate;
  published
    public
      property Value : TDate read FValue write FValue;
      function AsString : String; overload;
      function AsQuotedFirebirdDate : String; overload;
      class function AsString(Value : TDate) : String; overload;
      class function AsQuotedFirebirdDate(Value : TDate) : String; overload;
      class function AsQuotedFirebirdDate(Value : String) : String; overload;
      class function DataValida(AData: String) : Boolean;
  end;

implementation

uses
  SysUtils, StrUtils, DateUtils;

{ TData }

function TData.AsQuotedFirebirdDate: String;
begin
  Result := QuotedStr(ReplaceStr(Self.AsString,'/','.'))
end;

class function TData.AsQuotedFirebirdDate(Value: TDate): String;
var
  AData: TData;
begin
  AData := TData.Create;
  try
    AData.Value := Value;
    Result := AData.AsQuotedFirebirdDate;
  finally
    AData.Free;
  end;
end;

function TData.AsString: String;
begin
  Result := FormatDateTime('dd/mm/yyyy',Value)
end;

class function TData.AsQuotedFirebirdDate(Value: String): String;
begin
  Result := TData.AsQuotedFirebirdDate(StrToDate(Value));
end;

class function TData.AsString(Value: TDate): String;
var
  AData: TData;
begin
  AData := TData.Create;
  try
    AData.Value := Value;
    Result := AData.AsString;
  finally
    AData.Free;
  end;
end;

class function TData.DataValida(AData: String): Boolean;
var
  ADia, AMes, AAno: Integer;
begin
  Result := False;
  if (Length(AData) = 10) then
  begin
    ADia := StrToIntDef(Copy(AData, 1, 2), 0);
    AMes := StrToIntDef(Copy(AData, 4, 2), 0);
    AAno := StrToIntDef(Copy(AData, 7, 4), 0);
    Result := IsValidDate(AAno, AMes, ADia);
  end;
end;

end.
