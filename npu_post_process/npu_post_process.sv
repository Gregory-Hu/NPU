

  // NN Cluster Interface 

  // FAST POST Process Pipeline 
  npu_fast_post_process #(
  ) u_npu_fast_post_process (

  );
  
  // Vector Engine Interface 

  npu_stream_vector_engine #(
  ) u_npu_fast_post_process (

  );

  // Data Transpose

  // Load Store
  //      Scratch SRAM 
  //      Dedicated Memory interface 
