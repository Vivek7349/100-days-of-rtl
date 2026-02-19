module tb_mux_4X1_con_assignment;
    reg a, b, c, d;
    reg [1:0] sel;
    wire y;

    mux_4X1_con_assignment dut (.A(a), .B(b), .C(c), .D(d), .Sel(sel), .Y(y));

    initial begin
      $monitor("Time=%0t | A=%b | B=%b | C=%b | D=%b | sel=%b | Y= %b", $time,a,b,c,d,sel,y);

      #10; a=1; b=0; c=1; d=0; sel=2'b00;
      #10; sel=2'b01;
      #10; sel=2'b10;
      #10; sel=2'b11;
	  #10;
    $finish;
    end
endmodule