module Bin_to_gray (
    input wire [3:0] Bin_ptr,
    output reg [3:0] gray_ptr
);

reg [3:0] shft_Bin_ptr;

always @(*) 
    begin
        shft_Bin_ptr=Bin_ptr>>1;
        gray_ptr=Bin_ptr ^ shft_Bin_ptr;
    end

endmodule