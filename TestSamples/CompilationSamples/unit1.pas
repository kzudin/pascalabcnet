
unit unit1;

interface

procedure u1proc;

implementation

procedure u1proc;
var c : char;
    i : integer;
begin
 i := 17;
case i of
  0:writeln('zero');
 1,2,3..5,6,7..8,9:writeln('low');
 10,11,12..14,15,16..18:writeln('high');
 30,31,32,33,34,35 : writeln(i);
 -11,-10,-9 : writeln(i);
 else
  writeln('undefined');
 end;
 {case i of
  4 : writeln('low');
  5 : writeln('mid');
  6,7 : writeln('high');
 else
  writeln('undefined');
 end;}
 c := 'k';
 case c of
 'a','b','c' : writeln('abc');
 'i','j','k' : writeln('ijk');
 'x','y','z' : writeln('xyz');
 else writeln('udefined');
 end;
 System.console.writeline('u1proc');
end;

begin

end.