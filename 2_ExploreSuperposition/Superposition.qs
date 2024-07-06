namespace ExploringSuperposition {
  open Microsoft.Quantum.Diagnostics;

  @EntryPoint()
  operation GenerateRandomBit() : Result {
    use q = Qubit();
    Message("Initialized qubit:");
    DumpMachine(); // First dump
    Message(" ");

    H(q);
    Message("Qubit after applying H:");
    DumpMachine(); // Second dump
    Message(" ");

    let randomBit = M(q);
    Message("Qubit after the measurement:");
    DumpMachine(); // Third dump
    Message(" ");

    Reset(q);
    Message("Qubit after resetting:");
    DumpMachine(); // Fourth dump
    Message(" ");

    return randomBit;
  }
}
