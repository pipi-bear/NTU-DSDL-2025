`ifndef ADDERS
`define ADDERS
`include "gates.v"

// half adder, gate level modeling
module HA(output C, S, input A, B);
	XOR g0(S, A, B);
	AND g1(C, A, B);
endmodule

// full adder, gate level modeling
module FA(output CO, S, input A, B, CI);
	wire c0, s0, c1, s1;
	HA ha0(c0, s0, A, B);
	HA ha1(c1, s1, s0, CI);
	assign S = s1;
	OR or0(CO, c0, c1);
endmodule

// adder without delay, register-transfer level modeling
module adder_rtl(
	output C3,       // carry output
	output[2:0] S,   // sum
	input[2:0] A, B, // operands
	input C0         // carry input
	);
	assign {C3, S} = A+B+C0;
endmodule

//  ripple-carry adder, gate level modeling
//  Do not modify the input/output of module
module rca_gl(
	output C3,       // carry output (C3 is the output of the MSB adder)
	output[2:0] S,   // sum (S is the 3-bit sum, where S[2] is the MSB and S[0] is the LSB)
	input[2:0] A, B, // operands
	input C0         // carry input
	);


	// TODO:: Implement gate-level RCA
	
	wire c0, c1, c2, c3;
	assign c0 = C0;
	assign C3 = c3;
	
	// First consider the least significant bit (LSB)
	// We add the inputs A[0], B[0] along with the C_in (C0)
	// then we get the sum of this bit S[0] and the carry C1 to the next adder
	FA fa_0(c1, S[0], A[0], B[0], c0);
	// middle bit
	FA fa_1(c2, S[1], A[1], B[1], c1);
	// most significant bit (MSB)
	FA fa_2(c3, S[2], A[2], B[2], c2);

endmodule

// carry-lookahead adder, gate level modeling
// Do not modify the input/output of module
module cla_gl(
	output C3,       // carry output
	output[2:0] S,   // sum
	input[2:0] A, B, // operands
	input C0         // carry input
	);

	// TODO:: Implement gate-level CLA
	
	// aim: First calculate the generate and propagate for each bit
	wire G0, G1, G2, P0, P1, P2;		// G is the generate, P is the propagate, both 3 bits
	// Note: cannot use: assign G0 = A[0] & B[0]; since we are required to use gate level moduling
	// Check LAB-01.pdf p.33 for the formula
	// G_i = A_i & B_i
	AND g_0(G0, A[0], B[0]);
	AND g_1(G1, A[1], B[1]);
	AND g_2(G2, A[2], B[2]);
	// P_i = A_i + B_i
	OR or_0(P0, A[0], B[0]);
	OR or_1(P1, A[1], B[1]);
	OR or_2(P2, A[2], B[2]);
	
	// aim: Then calculate the carry for each bit
	wire Cin_0, Cin_1, Cin_2, Cout_2;			// store the precomputed carries
	assign Cin_0 = C0;							// C0 is the initial carry input
	
	// explain: the following equations are using notations in LAB-01.pdf p.33
	// intxy represents the y-th intermediate term in equation of C_x
	// subaim: C_1 = G_0 + P_0 & C_0
	wire p0c0;
	AND int11(p0c0, P0, Cin_0);
	OR c_1(Cin_1, G0, p0c0);
	
	// subaim: C_2 = G_1 + P_1 & C_1
	wire g0p1, c0p0p1;
	AND int21(g0p1, G0, P1);
	AND int22(c0p0p1, p0c0, P1);
	// note: we add 0 since we only need to OR 3 terms, but we need to choose from OR and OR4
	OR4 c_2(Cin_2, G1, g0p1, c0p0p1, 1'b0);

	// subaim: C_3 = G_2 + P_2 & C_2
	wire g1p2, g0p1p2, c0p0p1p2;
	AND int31(g1p2, G1, P2);
	AND int32(g0p1p2, g0p1, P2);
	AND int33(c0p0p1p2, c0p0p1, P2);
	OR4 c_3(Cout_2, G2, g1p2, g0p1p2, c0p0p1p2);

	// aim: Calculate the result of each full adder
	// note: the carries are stored in Di (dummy), since we've already precomputed them, and these Di would not be used later
	wire D0, D1, D2;			
	FA fa_0(D0, S[0], A[0], B[0], Cin_0);
	FA fa_1(D1, S[1], A[1], B[1], Cin_1);
	FA fa_2(D2, S[2], A[2], B[2], Cin_2);
endmodule

`endif
