uses

  Crt;

type

  XArray = array [1..50, 1..50] of real; {???????? ???? ??????? X}

var

  i, j, n, k, imax, jmax:integer;

  X: XArray; {????????????? ?????????? ???? ???? ??????? X ??? ???????? ?????????? X � ??????? ?????}

  Sum, Max: real;

begin

{ ???? ???????}

Write('??????? ?????? ?????????? ??????? X  n = '); Readln(n);

 

for i := 1 to n do {???? ?? i � ?? ??????? ???????}

       for j := 1 to n do {????????? ???? ?? j � ?? ???????? ???????}

  begin

    Write('??????? X[ ',i,', ',j,'] = ');

    Readln(X[i,j]);

  end;

 

{????? ???????}

Writeln(' ????????? ???????: ');

i:=1;

while i<=n do

  begin

  for j := 1 to n do

    Write(X[i, j]:6:2,' ');

  Writeln;

  i := i + 1;

  end;

{??????? ????? ?? ??????? ????????? ? ????? ????????????? ????????}

Max := X[1,1];

imax := 1;

jmax := 1;

Sum := 0;

for i := 1 to n do

  begin

    Sum := Sum + X[i,i];

    if Max < X[i,i] then

    begin

    Max:= X[i,i];

    imax:=i;

    jmax:=i;

    end;

  end;

{????? ??????????? ?????????? ?????????}

Writeln(' Xmax[ ',imax,', ',jmax,'] = ',Max:8:2);

Writeln(' ????? ????? ?? ??????? ?????????: ',Sum:8:2);

{???????? ??????? ??????? ????? ????????? ????????? � ??? ????????? ???????????}

Writeln(' ??????? ????? ??????? ??? ?????????? �');

Readln;

end.