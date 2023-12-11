
DECLARE
  v_column1 table_name.column1%TYPE; 
  v_column2 table_name.column2%TYPE; 
  
 
  CURSOR my_cursor IS
    SELECT column1, column2
    FROM table_name
    WHERE your_condition; 

BEGIN
  
  OPEN my_cursor;

 
  LOOP
    FETCH my_cursor INTO v_column1, v_column2;

   
    EXIT WHEN my_cursor%NOTFOUND;

  
    DBMS_OUTPUT.PUT_LINE('Column1: ' || v_column1 || ', Column2: ' || v_column2);
    
    

  END LOOP;

  
  CLOSE my_cursor;
  
END;
/
