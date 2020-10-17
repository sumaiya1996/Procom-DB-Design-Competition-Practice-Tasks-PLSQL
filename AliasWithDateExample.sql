/*create table scott.t ( x date, bal number );

insert into t values ( sysdate, 10 );
*/

declare

v_bal t.bal%type;
rc SYS_REFCURSOR;
 d date := sysdate;
begin

  open :rc for 'select bal bal_'||to_char(d,'ddmm')||' from t where x = :1' using d;
 fetch rc into v_bal;
 dbms_output.put_line(v_bal);

end;