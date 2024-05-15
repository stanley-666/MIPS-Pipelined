module thirty2thbitALU(DATAOUT ,A, B, Cin, Cout, ctl, less, SET);
	input A, B, Cin, less;	
	input [2:0] ctl;
	output Cout, DATAOUT, SET;
	wire Binvert ;
	wire TEMPAND, TEMPOR, TEMPSUM, TEMPSLT;
	
	and and1(TEMPAND,A,B);
	or or1(TEMPOR,A,B); 
	
	xor xor1(Binvert,B,ctl[2]);
	Full_Adder FA (  A, Binvert, Cin, TEMPSUM, Cout );
	
	// mux
	// and 000
	// or  001
	// add 010
	// sub 110
	// stl 111

	and and8(TEMPSLT,1'b1,less);
	
	m41 MUX41( .out(DATAOUT), .AND(TEMPAND), .OR(TEMPOR), .SUM(TEMPSUM), .SLT(TEMPSLT), .s0(ctl[1]), .s1(ctl[0]) ) ;
	// SET 
	assign SET = TEMPSUM ;
	
	
endmodule