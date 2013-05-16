within ModelicaCompliance.Operators.Overloading;

model OverloadedRelationalOperation
  extends Icons.TestCase;

  operator record _Complex_
    Integer re;
    Integer im;

    operator 'constructor'  " Constructor"
      function fromInteger "Construct _Complex_ from Integer"
        input Integer re ;
        input Integer im = 1 ;
        output _Complex_ result;
      algorithm
        result.re := re;
        result.im := im;
      end fromInteger;
    end 'constructor';
    
    operator function '==' "Test whether two _Complex_ records are identical"
      input _Complex_ c1 ;
      input _Complex_ c2 ;
      output Boolean result ;
    algorithm
      result := c1.re == c2.re and c1.im == c2.im;
    end '==';

  end _Complex_;
  
  _Complex_ a = _Complex_(42);
  _Complex_ b = _Complex_(42);
equation
  assert(a == b, "Overloaded '==' not matched properly.");
  
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true)),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html> Tests whether relational operator overloading is resolved properly.</html>"));

end OverloadedRelationalOperation;
