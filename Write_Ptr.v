module Write_Ptr # (
    parameter WIDTH = 4
)(
    input  wire Clk_W,
    input  wire Rst,
    input  wire Full_Flag_W,
    output reg  W_Ptr
);

always @ (posedge Clk_W or negedge Rst)
    if (!Rst)
        W_Ptr <= 'd0;
    else if (!Full_Flag_W)
        W_Ptr <= W_Ptr + 1'b1;
endmodule