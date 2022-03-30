`timescale 1ns / 1ps

module mux1to4(
    input Ai,
    input Bi,
    input Ci,
    input Di,
    output Y,
    input S1,
    input S2
    );
    
    wire nS1, nS2, nY;
    wire A, B, C, D;
    wire [ 3 : 0 ] nvar_tmp;
    wire [ 1 : 0 ] nres1;
    wire [ 1 : 0 ] nres2;
        
    assign A = Ai;
    assign B = Ci;
    assign C = Bi;
    assign D = Di;
    
    nor( nS1, S1, S1 );   
    nor( nS2, S2, S2 );
    
    nor( nvar_tmp[ 0 ], A, S1 );
    nor( nvar_tmp[ 1 ], B, nS1 );
    nor( nvar_tmp[ 2 ], C, S1 );
    nor( nvar_tmp[ 3 ], D, nS1 );
        
    nor ( nres1 [ 0 ], nvar_tmp [ 0 ], nvar_tmp [ 1 ] );
    nor ( nres1 [ 1 ], nvar_tmp [ 2 ], nvar_tmp [ 3 ] );
    
    nor ( nres2 [ 0 ], nres1 [ 0 ], S2 );
    nor ( nres2 [ 1 ], nres1 [ 1 ], nS2 );
    
    nor ( Y, nres2 [ 0 ], nres2 [ 1 ] );
    
endmodule
