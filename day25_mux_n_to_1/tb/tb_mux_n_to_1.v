module tb_mux_n_to_1;
	parameter n = 4;
	parameter sel_len = $clog2(n);
	reg [n-1:0] in;
	reg [sel_len-1:0] sel;
	wire out;
	
	integer i;
	
	mux_n_to_1 uut ( .in(in), .sel(sel), .out(out) );
	
	initial begin 
	
    in = 4'b1010;

    for(i = 0; i < n; i = i + 1) begin
        sel = i;
        #10;
    end

       $finish;
	end
	
endmodule