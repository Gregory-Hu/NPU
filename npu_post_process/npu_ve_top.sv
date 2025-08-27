



// ------------------------------
// Vector Engine Designed for 
//          RVV 
//          AI Operator 


// Vector Decode & Sequencer 
//        1. rvv inst issue port 
//        2. NPU Post Process (Operator Sequence Queue)


// Vector EX Lane
//        Align with memory interface width, we implement 16 lane per Vector Engine (fp16 256 bits bus interface)

// Load Store
//    Global SRAM
//    Dedicated DDR interface
//    Coherence Memory