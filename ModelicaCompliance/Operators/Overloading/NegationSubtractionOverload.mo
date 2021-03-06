within ModelicaCompliance.Operators.Overloading;

model NegationSubtractionOverload
  extends Icons.TestCase;

  encapsulated package P
    operator record _Complex_ 
      Integer re ;
      Integer im ;
      
      encapsulated operator 'constructor'  " Constructor"
        import ModelicaCompliance.Operators.Overloading.NegationSubtractionOverload.P._Complex_;

        function fromInteger "Construct _Complex_ from Integer"
          input Integer re;
          input Integer im = 1;
          output _Complex_ result;
        algorithm
          result.re := re;
          result.im := im;
        end fromInteger;
      end 'constructor';

      encapsulated operator '-' "Unary and binary minus"
        import ModelicaCompliance.Operators.Overloading.NegationSubtractionOverload.P._Complex_;

        function negate 
          input _Complex_ c1 ;
          output _Complex_ c2 ;
        algorithm
          c2 := _Complex_(-c1.re, -c1.im);
        end negate;
      
        function subtract "Subtract two _Complex_ numbers"
          input _Complex_ c1 ;
          input _Complex_ c2 ;
          output _Complex_ c3 ;
        algorithm
          c3 := _Complex_(c1.re - c2.re, c1.im - c2.im);
        end subtract;
    end '-';

    end _Complex_;
  end P;

  import ModelicaCompliance.Operators.Overloading.NegationSubtractionOverload.P._Complex_;

  _Complex_ a = _Complex_(2,3);
  _Complex_ b = -a;
  _Complex_ c = b - 1;
equation
  assert(b.re == -2, "Overloaded unary '-' not matched properly.");
  assert(b.im == -3, "Overloaded unary '-' not matched properly.");
  assert(c.re == -3, "Overloaded binary '-' not matched properly.");
  assert(c.im == -4, "Overloaded binary '-' not matched properly.");

  
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"14.5"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html> Tests whether proper overload of '-' for binary and unary overloads.</html>"));

end NegationSubtractionOverload;

