DECLARE
  TYPE fooType IS TABLE OF VARCHAR2(42);
  foo fooType := new fooType('Strawberry', 'Apple', 'Banana');
BEGIN
  foo.DELETE(2);                                -- The collection is now sparse

  FOR i IN 1 .. foo.COUNT                       -- Noncompliant - leads to ORA-01403: no data found
  LOOP
    DBMS_OUTPUT.PUT_LINE(i || ' = ' || foo(i));
  END LOOP;
END;
/

