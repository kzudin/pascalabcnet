// �������������� ������������ <-> ������
var 
  s: string;
  r: real;

begin
  // �������������� ������ � ������
  r := 3.1415;
  s := FloatToStr(r);
  writelnFormat('�����: {0}. ����� �������������� � ������: ''{1}''',r,s);
  
  // �������������� ������ � ����� (����� ��������� ����������)
  s := '3.1415';
  r := StrToFloat(s);
  writelnFormat('������: ''{0}''. ����� �������������� � ������: {1}',s,r);
end.