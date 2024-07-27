namespace ExploringSuperposition {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;

    @EntryPoint()
    operation GenerateRandomNumber() : Int {
        use qubits = Qubit[3];
        ApplyToEach(H, qubits);
        Message("The qubit register in a uniform superposition: ");
        DumpMachine();
        mutable results = [];
        for q in qubits {
            Message(" ");
            set results += [M(q)];
            DumpMachine();
        }
        Message(" ");
        Message("Your random number is: ");
        ResetAll(qubits);
        return BoolArrayAsInt(ResultArrayAsBoolArray(results));
    }
}
