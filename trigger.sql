CREATE TABLE employee(
  emp_id INT,
  name VARCHAR(25),
  department VARCHAR(25),
  city VARCHAR(25),
  last_modified TIMESTAMP
);

INSERT INTO employee VALUES(1, 'ajay', 'testing', 'mumbai', NULL);

CREATE OR REPLACE TRIGGER trig_name
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
  :NEW.last_modified := SYSTIMESTAMP;
END;
/

UPDATE employee SET department = 'ab' WHERE emp_id = 1;
select*from employee;
