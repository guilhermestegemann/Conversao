unit UFerramentas;

interface

uses
  System.Classes;

  function BooleanToStr (p : Boolean) : String;
  function AdjustRight(st: string;tam:integer;ch:char):string;
  function AjustaData(Data : String) : String;
  function Numericos(st: string):string;
  function StrSplit(st: String; dl: char): TStrings;


implementation

uses
  System.SysUtils;

function BooleanToStr(p: Boolean): String;
begin
  Result := QuotedStr('N');
  if p then
    Result := QuotedStr('S');
end;

function AdjustRight(st: string; tam: integer; ch: char): string;
begin
     while Length(st) < tam do st:= ch+st;
     result := st;
end;

function AjustaData(Data: String): String;
begin
  Result := 'NULL';
  if Length(Data) = 10 then
    Result := QuotedStr(StringReplace(Data, '/', '.', [rfReplaceAll]));

end;

function Numericos(st: string): string;
const
     Nums = ['0'..'9'];
var
   i: integer;
   r: String;
begin
     r:= '';
     If length(st) > 0 then
        For i := 0 to length(st) do
            if CharInSet(st[i],Nums) then r := r + st[i];

     result := r;
end;

function StrSplit(st: String; dl: char): TStrings;
var
  ret : TStringList;
  r: String;
  i: integer;
begin
  ret := TStringList.Create;
  r:= '';
  if length(st) > 0 then
    For i := 0 to length(st) do
    begin
      if st[i] = dl then
      begin
         ret.Add(r);
         r := '';
      end else
         r := r + st[i];
    end;
  result := ret;
end;

end.
