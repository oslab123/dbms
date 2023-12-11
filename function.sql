CREATE OR REPLACE FUNCTION calculate_net_salary (
    p_gross_salary IN NUMBER
) RETURN NUMBER
IS
    v_net_salary NUMBER;
    v_tax_rate NUMBER := 0.05; -- 5% tax rate
BEGIN
    -- Calculate net salary by reducing tax
    v_net_salary := p_gross_salary * (1 - v_tax_rate);

    -- Return the net salary
    RETURN v_net_salary;
END calculate_net_salary;
/
/*
how to  call  the  function//
DECLARE
    gross_salary NUMBER := 50000;
    net_salary NUMBER;
BEGIN
    net_salary := calculate_net_salary(gross_salary);
    DBMS_OUTPUT.PUT_LINE('Net Salary: ' || net_salary);
END;
/
*/
