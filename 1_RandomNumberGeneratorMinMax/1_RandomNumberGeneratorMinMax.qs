namespace QuantumRandomNumberGenerator {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Math;

  @EntryPoint()
  operation Main() : Int {
    let min = 50;
    let max = 100; 
    Message($"Sampling a random number between {min} and {max}: ");

    return GenerateRandomNumberInRange(min, max);
  }

  operation GenerateRandomNumberInRange(min : Int, max : Int) : Int {
    // Generate a random number in the 0..(max - min) range.
    let sample = GenerateRandomNumber(max - min);

    // Shift the random number to the min..max range.
    return sample + min;
  }

  /// Generates a random number between 0 and `max`.
  operation GenerateRandomNumber(max : Int) : Int {
    // Determine the number of bits needed to represent `max` and store it
    // in the `nBits` variable.
    let nBits = BitSizeI(max);
    
    // Then generate `nBits` random bits which will
    // represent the generated random number.
    mutable bits = [];
    for idxBit in 1..nBits {
        set bits += [GenerateRandomBit()];
    }
    let sample = ResultArrayAsInt(bits);

    // Return random number if it is within the requested range.
    // Generate it again if it is outside the range.
    return sample > max ? GenerateRandomNumber(max) | sample;
  }

  operation GenerateRandomBit() : Result {
    // Allocate a qubit, by default it is in zero state      
    use q = Qubit();  

    // We apply a Hadamard operation H to the state
    // It now has a 50% chance of being measured 0 or 1  
    H(q);      

    // Now we measure the qubit in Z-basis.
    let result = M(q);

    // Reset the qubit so it can be safely released.
    Reset(q);

    return result;
  }
}
