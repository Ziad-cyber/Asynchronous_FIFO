module FIFO #(
    parameter  Data_Width = 8
) (
    input wire Clk_Read,
    input wire Clk_write,
    input wire Rst,
    input wire [Data_Width-1:0] W_Data,
    output reg [Data_Width-1:0] R_Data
);

//Internal Wires
wire W_Rst_FIFO;
wire R_Rst_FIFO;
wire Full_Flag_FIFO;
wire W_Ptr_FIFO;
wire Empty_Flag_FIFO;
wire R_Ptr_FIFO;
wire Gray_W_Ptr_FIFO;
wire Gray_R_Ptr_FIFO;
wire Sync_Gray_W_Ptr_FIFO;
wire Sync_Gray_R_Ptr_FIFO;

//Instantiation
RST_SYNC U0 (
.RST(Rst),
.CLK(Clk_write),
.SYNC_RST(W_Rst_FIFO)
);

RST_SYNC U1 (
.RST(Rst),
.CLK(Clk_Read),
.SYNC_RST(R_Rst_FIFO)
);

Write_Ptr U0 (
.Clk_W (Clk_write),
.Rst (W_Rst_FIFO),
.Full_Flag_W (Full_Flag_FIFO),
.W_Ptr(W_Ptr_FIFO)
);

Read_Ptr U0 (
.Clk_R(Clk_Read),
.Rst(R_Rst_FIFO),
.Empty_Flag_R(Empty_Flag_FIFO),
.R_Ptr(R_Ptr_FIFO)
);

Bin2Gray U0(
.Binary_Ptr(W_Ptr_FIFO) ,
.Gray_Ptr(Gray_W_Ptr_FIFO)
);

Bin2Gray U1(
.Binary_Ptr(R_Ptr_FIFO) ,
.Gray_Ptr(Gray_R_Ptr_FIFO)
);

Bit_Sync U0 (
.ASYNC(Gray_W_Ptr_FIFO)  ,
.RST(R_Rst_FIFO),
.CLK(Clk_Read),
.SYNC(Sync_Gray_W_Ptr_FIFO)
);

Bit_Sync U1 (
.ASYNC(Gray_R_Ptr_FIFO),
.RST(W_Rst_FIFO),
.CLK(Clk_write),
.SYNC(Sync_Gray_R_Ptr_FIFO)
);

Full_Check U0 (
.W_Gray_Ptr(Gray_W_Ptr_FIFO),
.R_Sync_Gray_Ptr(Sync_Gray_R_Ptr_FIFO),
.Full_Flag(Full_Flag_FIFO)
);

Empty_Check U0 (
.R_Gray_Ptr (Gray_R_Ptr_FIFO),
.W_Sync_Gray_Ptr (Sync_Gray_W_Ptr_FIFO),
.Empty_Flag (Empty_Flag_FIFO)
);

module Queue (
.W_CLK (Clk_write),
.Rst (W_Rst_FIFO),
.W_Ptr (W_Ptr_FIFO),
.R_Ptr (R_Ptr_FIFO),
.W_Data (W_Data),
.Full_Flag (Full_Flag_FIFO),
.Empty_Flag(Empty_Flag_FIFO),
.R_Data(R_Data),
);

endmodule