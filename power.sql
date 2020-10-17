create or replace procedure power_of_num (n in number,p in number) as


ans number(30):=1;
begin

for i in 1..p loop
ans:=ans*n;
--dbms_output.put_line(ans);

--i:=i+1;
end loop;
dbms_output.put_line(n||' raised to the power '||p|| ' is '||ans);

end;
/
execute power_of_num(2,5);