module Bit_Sync #(
parameter BUS_WIDTH =4
)(
input  wire [BUS_WIDTH-1:0] ASYNC ,
input  wire RST,
input  wire CLK,
output reg  [BUS_WIDTH-1:0] SYNC
);

genvar i ;

  generate
    for ( i=0 ; i< BUS_WIDTH ; i = i + 1 )
	  begin
        Sync U0 (.ASYNC_S(ASYNC[i]), .RST_S(RST) , .CLK_S(CLK), .SYNC_S(SYNC[i])) ;
	  end
  endgenerate

endmodule