CREATE OR REPLACE PROCEDURE update_salary (
    p_employee_id IN NUMBER,
    p_new_salary OUT NUMBER
)
IS
    v_current_salary NUMBER;
BEGIN
   
    SELECT salary INTO v_current_salary
    FROM employees
    WHERE employee_id = p_employee_id;

   
    p_new_salary := v_current_salary * 1.10;

    
    UPDATE employees
    SET salary = p_new_salary
    WHERE employee_id = p_employee_id;

   
    COMMIT;
    
    
    DBMS_OUTPUT.PUT_LINE('Employee ' || p_employee_id || ' - Updated Salary: ' || p_new_salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ' || p_employee_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END update_salary;
/
//how to  call
/*DECLARE
    new_salary NUMBER;
BEGIN
    update_salary(p_employee_id => 101, p_new_salary => new_salary);
    
    -- Display the updated salary
    DBMS_OUTPUT.PUT_LINE('Updated Salary: ' || new_salary);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
