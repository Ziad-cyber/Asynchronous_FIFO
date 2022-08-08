//RST Sync
module Multi_Flop #(
parameter NUM_STAGES=2
)(
input  wire CLK_M,
input  wire RST_M,
output reg  SYNC_RST_M
);

reg [NUM_STAGES-1:0] synchronizer;
integer ii;

always @ (posedge CLK_M or negedge RST_M)
begin
    ii=0;
    if (!RST_M)
        synchronizer <= 'd0;
    else 
        begin
            synchronizer [NUM_STAGES-1] <= 1'b1 ;
            SYNC_RST_M <= synchronizer [0];
            for (ii=NUM_STAGES-1;ii>0; ii=ii-1)
                begin
                synchronizer [ii-1] <= synchronizer [ii];
                end
        end
end

endmodule
