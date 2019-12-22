module register_mips(regwrite,read_adr1,read_adr2,dst_adr,write_data,readout1,readout2);

    input regwrite; //register wite mode?
    input [4:0] read_adr1,read_adr2,dst_adr; // read register address
    input [31:0] write_data; //wirte data

    output [31:0] readout1, readout2; //register output data


    reg[31:0] register_memory [31:0]; //32 x 32 register memory

    parameter size=32;
    integer i=0;

    initial begin
        for (i = 0; i < size; i = i + 1)
            register_memory[i] = 32'b0;
    end

    always @ (regwrite, write_data)
    begin
        if (regwrite == 1'b1) begin
            register_memory[dst_adr] = write_data;
        end
    end

    assign readout1 = register_memory[read_adr1];
    assign readout2 = register_memory[read_adr2];
    


endmodule