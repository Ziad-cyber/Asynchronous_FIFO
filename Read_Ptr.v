module Read_Ptr # (
    parameter WIDTH = 4
)(
    input  wire Clk_R,
    input  wire Rst,
    input  wire Empty_Flag_R,
    output reg  R_Ptr
);

always @ (posedge Clk_R or negedge Rst)
    if (!Rst)
        R_Ptr <= 'd0;
    else if (!Empty_Flag_R)
        R_Ptr <= R_Ptr + 1'b1;
endmodule