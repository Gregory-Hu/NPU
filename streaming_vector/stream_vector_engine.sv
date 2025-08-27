
module npu_stream_vector_engine #(
) (
  input wire clk,
  input wire reset_n,

  // rv core interface 
  input wire rvv_inst_vld_i,
  output wire rvv_inst_rdy_o,
  input wire [31:0] rvv_inst_data_i,
  input wire [`STREAM_VE_RVV_INST_INFO_W-1:0] rvv_inst_info_i,

  output wire rvv_inst_syn_done_o,
  output wire rvv_inst_result_data_o,
  output wire rvv_inst_flt_o,
  output wire rvv_inst_flt_info_o,
  
  // nn interface 
  input wire nn_ve_cmd_ds_vld_i,
  output wire nn_ve_cmd_ds_rdy_o,
  input wire [`NPU_CMD_ID_W-1:0] nn_ve_cmd_ds_id_i,
  input wire [`NPU_VE_CMD_W-1:0] nn_ve_cmd_ds_data_i,

  output wire nn_ve_cmd_done_o,
  output wire [`NPU_CMD_ID_W-1:0] nn_ve_cmd_id_done_o,

  input wire nn_post_data_in_vld_i,
  input wire [`NPU_CMD_ID_W-1:0] nn_post_cmd_id_early,
  input wire [`NPU_INTERNAL_ELEMENT_W*16-1:0] nn_post_data_in_i,



)

  assign ve_in_nn_post_mode = nn_post_data_in_vld_i;

  nn_ve_cmd_buffer #(.DEPTH(8)
  ) (
    .nn_ve_cmd_o(nn_ve_cmd[`NPU_VE_CMD_W-1:0])
  );

  // pre-load parameter from DDR to Scratch SRAM
  // the load parameter from Scratch SRAM to VRF
  generate
    for(generate i; i<)
  endgenerate 

// ---------------------------------------
// Vector Engine Decode and Sequencer 
  








// ---------------------------------------
// Streaming Vector Lanes 
  // 5 stream length would need 5 parameter 
  // to stream with nn core the per surface type would need more storage space 

  //      32            x    (2x8)     x   32 bits
  // channel parrallel     cube size     param size 

  // each lane need to store 2x16 elements for per surface/per data 

  generate
    for (genvar lane; lane<16; lane=lane+1) begin 
      
      // reg vrf or sram vrf
      stream_vector_sram #(
      ) u_stream_vector (

        .vrf_rd0_addr         (vrf_rd0_addr[lane][4:0]),
        .vrf_rd1_addr         (vrf_rd0_addr[lane][4:0]),
        
        .vrf_rd0_data         (vrf_rd0_data[lane][31:0]),
        .vrf_rd1_data         (vrf_rd1_data[lane][31:0])

      );
    
      assign rvv_data_in = vrf_rd0_data[lane][31:0];
      

      assign ve_lane_in_vld[lane] = ve_in_nn_post_mode ? nn_post_data_in_vld_i
                                                       : rvv_sequencer_lane_in_vld[lane];

      assign ve_lane_data0_in[lane][31:0] = ve_in_nn_post_mode ? nn_post_data_in_i[32*lane+:32] 
                                                               : rvv_data_in[lane][31:0];

      
      stream_vector_lane #(
      ) u_stream_vector_lane (
        .ve_lane_in_vld           (ve_lane_in_vld[lane]),
        .ve_lane_in_data0         (ve_lane_data0_in[lane][31:0]),
        .ve_lane_in_data1         (ve_lane_data1_in[lane][31:0]),
        .ve_lane_in_data2         (ve_lane_data2_in[lane][31:0]),
      );

    end 
  endgenerate 

// ---------------------------------------
// Fast Reduction Tree



endmodule 
