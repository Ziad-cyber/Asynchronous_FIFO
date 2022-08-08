module Bin2Gray # (
    parameter WIDTH = 4 
) (
    input  wire [WIDTH-1:0] Binary_Ptr ,
    output reg  [WIDTH-1:0] Gray_Ptr
);

reg [WIDTH-1:0]  Shift_Binary_Ptr ;

always @ (*)
    begin
        Shift_Binary_Ptr = Binary_Ptr >> 1;
        Gray_Ptr = Shift_Binary_Ptr ^ Binary_Ptr;
    end

endmodule