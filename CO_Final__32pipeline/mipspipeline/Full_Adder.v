module Full_Adder( A, B, Cin, Sum, Cout );

    input A, B, Cin;
    output Cout;
	output Sum ;
    wire W1, W2, W3,W4;
	xor xor1( W1, A, B );
	xor xor2( Sum, W1, Cin );
	
	or or1( W2, A, B );
	and and1( W3, W2, Cin );
	and and2( W4, A, B );
	or or2( Cout, W3, W4 );

endmodule