`timescale 1ns / 1ps

module mux_test;
    reg S1i, S2i;
    reg Ai, Bi, Ci, Di;
    wire Y_out;
    
    mux1to4 mux_test1 (
        .A(Ai),
        .B(Bi),
        .C(Ci),
        .D(Di),
        .Y(Y_out),
        .S1(S1i),
        .S2(S2i)
    );
    
    integer i;
    reg [ 5 : 0 ] test_val;
    reg expected_val;
        
    initial begin
            
        for ( i = 0; i < 64; i = i + 1 ) begin
            
            test_val = i;
            S1i = test_val[ 0 ];
            S2i = test_val[ 1 ];
            Ai = test_val[ 2 ];
            Bi = test_val[ 3 ];
            Ci = test_val[ 4 ];
            Di = test_val[ 5 ];
            expected_val = S1i & Bi & Ci | S1i & ~S2i & Bi | ~S1i & Ai & Di | ~S1i & ~S2i & Ai | ~S1i & S2i & Di | S1i & S2i & Ci ;
                
            #10
                
            if ( 
                Y_out == expected_val
            ) begin
                $display( "The demux output is correct!!! S1i=%b, S2i = %b, Ai = %b, Bi = %b, Ci = %b, Di = %b, Y_out = %b", S1i, S2i, Ai, Bi, Ci, Di, Y_out );
            end else begin
                $display( "The demux output is incorrect!!! S1i=%b, S2i = %b, Ai = %b, Bi = %b, Ci = %b, Di = %b, Y_out = %b, expected_val = %b", S1i, S2i, Ai, Bi, Ci, Di, Y_out, expected_val ); 
            end
        end
            
        #10 $stop;
    end

endmodule
