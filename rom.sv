module rom(
	input clk,
	input [5:0] addr,
	output logic [31:0] data
);

  logic [31:0] rom [0:34];

  always_comb begin
    data <= rom[addr];
  end
    
  initial begin 
	 rom[0] = 32'h00000044;//D
	 rom[1] = 32'h00000030;//i
	 rom[2] = 32'h00000030;//g
	 rom[3] = 32'h00000030;//i
	 rom[4] = 32'h00000030;//t
	 rom[5] = 32'h00000061;//a
	 rom[6] = 32'h0000006C;//l
	 rom[7] = 32'h00000020;//
	 rom[8] = 32'h00000020;//s
	 rom[9] = 32'h00000020;//y
	 rom[10] = 32'h00000020;//s	 
	 rom[11] = 32'h00000020;//t
	 rom[12] = 32'h00000020;//e
	 rom[13] = 32'h00000020;//m
	 rom[14] = 32'h00000020;//s
	 rom[15] = 32'h00000020;
	 rom[16] = 32'h00000073;//ignore
	 rom[17] = 32'h00000038;		//Change line
	 rom[18] = 32'h00000020;		//???
	 rom[19] = 32'h00000020;
	 rom[20] = 32'h00000020;	 
	 rom[21] = 32'h00000020;
	 rom[22] = 32'h0000002E;
	 rom[23] = 32'h0000002E;
	 rom[24] = 32'h0000002E;
	 rom[25] = 32'h0000002E;
	 rom[26] = 32'h00000020;
	 rom[27] = 32'h00000020;
	 rom[28] = 32'h00000020;
	 rom[29] = 32'h00000020;
	 rom[30] = 32'h00000020;	
	 rom[31] = 32'h00000020;
	 rom[32] = 32'h00000020;
	 rom[33] = 32'h00000020;
	 rom[34] = 32'h00000002;		//ChangeLine
  end

endmodule
