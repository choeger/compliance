within ModelicaCompliance.Algorithms.If;

model TwoBranchesNoElseSelectSecond
  extends Icons.TestCase;

  Real x;
  parameter Integer i = 5;
algorithm
  if i > 10 then
    x := 3.0;
  elseif i < 20 then
    x := 4.0;
  end if;

  assert(Util.compareReal(x, 4.0), "x was not set correctly.");

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true)),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests that an if-statement can have two branches but no
        else-branch, where the second branch should be selected.</html>"));
end TwoBranchesNoElseSelectSecond;
