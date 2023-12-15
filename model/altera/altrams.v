// Adapted for Intel/Altera

`define RFDP(dpeth, width)    \
module rfdp``dpeth``x``width (					\
	output 		[width-1:0]				QA,     \
	input 		[$clog2(dpeth)-1:0] 	AA,     \
	input 								CLKA,   \
	input 								CENA,   \
	input 		[$clog2(dpeth)-1:0] 	AB,     \
	input 		[width-1:0] 			DB,     \
	input 								CLKB,   \
	input 								CENB    \
	);                                          \
    altera_syncram  altera_syncram_component (    \
                .address_a (AA),    \
                .address_b (AB),    \
                .clock0 (CLKA),    \
                .clock1 (CLKB),    \
                .clocken0 (CENA),    \
                .clocken1 (CENB),    \
                .data_a (data_a),    \
                .data_b (DB),    \
                .wren_a (1'b0),    \
                .wren_b (1'b1),    \
                .q_a (QA),    \
                .q_b (),    \
                .aclr0 (1'b0),    \
                .aclr1 (1'b0),    \
                .address2_a (1'b1),    \
                .address2_b (1'b1),    \
                .addressstall_a (1'b0),    \
                .addressstall_b (1'b0),    \
                .byteena_a (1'b1),    \
                .byteena_b (1'b1),    \
                .clocken2 (1'b1),    \
                .clocken3 (1'b1),    \
                .eccencbypass (1'b0),    \
                .eccencparity (8'b0),    \
                .eccstatus (),    \
                .rden_a (1'b1),    \
                .rden_b (1'b0),    \
                .sclr (1'b0)    \
	);    \
    defparam    \
        altera_syncram_component.address_reg_b  = "CLOCK1",    \
        altera_syncram_component.clock_enable_input_a  = "NORMAL",    \
        altera_syncram_component.clock_enable_input_b  = "NORMAL",    \
        altera_syncram_component.clock_enable_output_a  = "NORMAL",    \
        altera_syncram_component.clock_enable_output_b  = "NORMAL",    \
        altera_syncram_component.indata_reg_b  = "CLOCK1",    \
        altera_syncram_component.enable_force_to_zero  = "FALSE",    \
        altera_syncram_component.intended_device_family  = "Cyclone 10 GX",    \
        altera_syncram_component.lpm_type  = "altera_syncram",    \
        altera_syncram_component.numwords_a  = dpeth,    \
        altera_syncram_component.numwords_b  = dpeth,    \
        altera_syncram_component.operation_mode  = "BIDIR_DUAL_PORT",    \
        altera_syncram_component.outdata_aclr_a  = "NONE",    \
        altera_syncram_component.outdata_sclr_a  = "NONE",    \
        altera_syncram_component.outdata_aclr_b  = "NONE",    \
        altera_syncram_component.outdata_sclr_b  = "NONE",    \
        altera_syncram_component.outdata_reg_a  = "CLOCK0",    \
        altera_syncram_component.outdata_reg_b  = "CLOCK1",    \
        altera_syncram_component.power_up_uninitialized  = "FALSE",    \
        altera_syncram_component.read_during_write_mode_port_a  = "NEW_DATA_NO_NBE_READ",    \
        altera_syncram_component.read_during_write_mode_port_b  = "NEW_DATA_NO_NBE_READ",    \
        altera_syncram_component.widthad_a  = $clog2(dpeth),    \
        altera_syncram_component.widthad_b  = $clog2(dpeth),    \
        altera_syncram_component.width_a  = width,    \
        altera_syncram_component.width_b  = width,    \
        altera_syncram_component.width_byteena_a  = 1,    \
        altera_syncram_component.width_byteena_b  = 1;    \
endmodule



// `define RFDPWP(dpeth, width, wpwidth)    \
// module rfdp``dpeth``x``width``_wp``wpwidth (		\
// 	output 		[width-1:0]				QA,     \
// 	input 		[$clog2(dpeth)-1:0] 	AA,     \
// 	input 								CLKA,   \
// 	input 								CENA,   \
// 	input 		[$clog2(dpeth)-1:0] 	AB,     \
// 	input 		[width-1:0] 			DB,     \
// 	input 								CLKB,   \
// 	input 		[width/wpwidth-1:0]		WENB,	\
// 	input 								CENB	\
// 	);                                          \
// 	bhv_1w1r_sram_wp #(                         \
// 		.WWORD		(width),                    \
// 		.WADDR		($clog2(dpeth)),            \
// 		.DEPTH		(dpeth),                    \
// 		.WP			(wpwidth)                   \
// 		) u (                                   \
// 		.clka		(CLKA),                     \
// 		.aa			(AA),                       \
// 		.cena		(CENA),                     \
// 		.qa			(QA),                       \
// 		.clkb		(CLKB),                     \
// 		.ab			(AB),                       \
// 		.wenb		(WENB),                     \
// 		.cenb		(CENB),                     \
// 		.db			(DB));                      \
// endmodule


`RFDP(32,32)
`RFDP(32,64)
`RFDP(32,96)
`RFDP(8192,8)
`RFDP(8192,64)
`RFDP(12288, 64)
`RFDP(8,96)
`RFDP(512,96)
`RFDP(1024,96)
`RFDP(8,12)
`RFDP(16,12)
`RFDP(512,32)
`RFDP(512,36)
// `RFDPWP(2048,128,32)
// `RFDP(2048,128)
// `RFDP(256,32)
// `RFDP(512,32)
// `RFDP(1024,32)
// `RFDP(256,24)
// `RFDP(64,38)
// `RFDP(32,128)
// `RFDP(32,130)

// `RFDP(262144,8)
// `RFDP(143360,8)


