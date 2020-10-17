-------------------------BASIC LOOPS--------------------------
declare
v_counter number(2) := 1;
begin
  loop
  --  dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
if mod(v_counter,2) = 0 then
      dbms_output.put_line( v_counter);
    --  exit;
    end if;
    exit when v_counter > 20;
  end loop;
end;
