DECLARE
  TYPE fooType IS TABLE OF VARCHAR2(42);
  foo fooType := new fooType('Strawberry', 'Apple', 'Banana');
  i PLS_INTEGER;
BEGIN
  foo.DELETE(2);                                -- The collection is now sparse
  i := foo.FIRST;

  WHILE (i IS NOT NULL)                         -- Compliant - works as expected
  LOOP
    DBMS_OUTPUT.PUT_LINE(i || ' = ' || foo(i));
    i := foo.NEXT(i);
  END LOOP;
END;
/
