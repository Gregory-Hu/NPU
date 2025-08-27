
module stream_vector_lane #(
) (
  
);

  // Int Streaming


  // Source Operand Netword & dst regs 

  // do we need more general purpose int functional unit
  ve_lane_int_alu #(
  ) u_ve_lane_int_alu0 (
  )
  
  ve_lane_int_alu #(
  ) u_ve_lane_int_alu1 (
  )

  ve_lane_int_mul #(
  ) u_ve_lane_int_mul0 (
  )

  ve_lane_int_mul #(
  ) u_ve_lane_int_mul1 (
  )

  ve_lane_int_intp #(
  ) u_ve_lane_int_intp

  // FP Streaming
  ve_lane_fp_add #(
  ) u_ve_lane_fp_alu0 (
  )
  
  ve_lane_int_alu #(
  ) u_ve_lane_fp_alu1 (
  )

  ve_lane_int_mul #(
  ) u_ve_lane_fp_mul0 (
  )

  ve_lane_int_mul #(
  ) u_ve_lane_fp_mul1 (
  )

  ve_lane_fp_pwl #(
  ) u_ve_lane_fp_pwl(

  );


  // DST Operand Netword & dst regs 

  // fast sigmoid and tanh LUT table 



endmodule 