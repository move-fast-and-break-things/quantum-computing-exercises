namespace ExploringSuperposition {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation GenerateSpecificState() : Result {
        use q = Qubit();
        let P = 0.333333; // P is 1/3
        Ry(2.0 * ArcCos(Sqrt(P)), q);
        Message("The qubit is in the desired state.");
        Message("");
        DumpMachine(); // Dump the state of the qubit 
        Message("");
        Message("Your skewed random bit is:");
        let skewedrandomBit = M(q);
        Reset(q);
        return skewedrandomBit;
    }
}
