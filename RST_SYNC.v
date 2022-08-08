module RST_SYNC (
input  wire RST,
input  wire CLK,
output reg SYNC_RST
);

Multi_Flop #(.NUM_STAGES(2)) U1 (,
.CLK_M(CLK),
.RST_M(RST),
.SYNC_RST_M(SYNC_RST)
);

endmodule