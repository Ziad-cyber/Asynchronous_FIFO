module Sync #(
parameter NUM_STAGES=2
)(
input  wire ASYNC_S ,
input  wire RST_S,
input  wire CLK_Dst,
output reg  SYNC_S
);

reg [NUM_STAGES-1:0] Synchronizer;
integer ii;

always @ (posedge CLK_Dst or negedge RST_S)
    begin
        ii=0;
		if (!RST_S)
			begin
                Synchronizer <= 'd0;
            end
        else 
            begin
                Synchronizer [NUM_STAGES-1] <= ASYNC_S ;
                SYNC_S <= Synchronizer [0];
                for (ii=NUM_STAGES-1;ii>0; ii=ii-1)
                    begin
                    Synchronizer [ii-1] <= Synchronizer [ii];
                    end
            end
    end
endmodule