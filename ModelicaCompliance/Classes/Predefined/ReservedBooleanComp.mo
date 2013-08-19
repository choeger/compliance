within ModelicaCompliance.Classes.Predefined;

model ReservedBooleanComp
  extends Icons.TestCase;

  Real Boolean = 3.0;

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = false, section = {"4.8"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Checks that it's illegal to declare an element with the name Boolean.</html>"));
end ReservedBooleanComp;
