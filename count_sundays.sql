
declare

start_date date:='01-SEP-19';
end_date date:='29-SEP-19';
counter number:=0;
day_check varchar2(1000);


begin

start_date:=next_day(start_date-1,'SUNDAY');

while (start_date<=end_date) loop


counter:=counter+1;
start_date:=start_date+7;



end loop;

dbms_output.put_line('Total sundays are '||counter);

end;