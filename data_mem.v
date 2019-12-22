module data_mem (memRead, memWrite,address, write_data, read_data);
		    
    input            memRead, memWrite;
    input    [31:0]  address, write_data;

    output   [31:0]  read_data;

    parameter        size = 64;	// data mem size
    integer          i;

    wire     [31:0]  index;
    reg      [31:0]  register_memory [0:size-1];

    assign index = address >> 2;  

    initial
    begin
        for (i = 0; i < size; i = i + 1)
          //  register_memory[i] = 32'b0;
	   $readmemb("data_mem.mem", register_memory);
    end

    always @ (memWrite, write_data)
    begin
        if (memWrite == 1'b1) begin
            register_memory[index] = write_data;
        end
    end

 assign read_data = (memRead == 1'b1)?register_memory[index]:32'b0;

endmodule
