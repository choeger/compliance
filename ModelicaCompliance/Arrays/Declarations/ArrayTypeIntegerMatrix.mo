within ModelicaCompliance.Arrays.Declarations;

model ArrayTypeIntegerMatrix
  extends Icons.TestCase;

  Integer x[2,3] = [ 1,2,3 ; 4,5,6 ] ;
equation
  assert(x[1, 1] == 1.0, "x[1, 1] was not set correctly.");
  assert(x[1, 2] == 2.0, "x[1, 2] was not set correctly.");
  assert(x[1, 3] == 3.0, "x[1, 3] was not set correctly.");
  assert(x[2, 1] == 4.0, "x[2, 1] was not set correctly.");
  assert(x[2, 2] == 5.0, "x[2, 2] was not set correctly.");
  assert(x[2, 3] == 6.0, "x[2, 3] was not set correctly.");

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"10.1"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests that it's possible to declare arrays of type Integer matrix.</html>"));
end ArrayTypeIntegerMatrix;
