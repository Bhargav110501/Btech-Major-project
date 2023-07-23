`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2023 15:19:12
// Design Name: 
// Module Name: tsc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tsc(yellow_a, green_a, red_a,yellow_b, green_b, red_b,yellow_c, green_c, red_c,yellow_d, green_d, red_d, clk,in) ;

input clk ;

output reg yellow_a, green_a, red_a ;
output reg yellow_b, green_b, red_b ;
output reg yellow_c, green_c, red_c ;
output reg yellow_d, green_d, red_d ;

reg [6:0]q7 ;
reg [5:0]q6 ;
reg [4:0]q5 ;
reg [3:0]q4 ;
reg [2:0]q3 ;
reg [1:0]q2 ;
input [7:0]in ;

/////////////////////////////////
//reg clkd;
//reg [4:0] div;
////////////////////////////////////


initial
    begin
        q7 <= 7'b1000000 ;
        q6 <= 6'b100000 ;
        q5 <= 5'b10000 ;
        q4 <= 4'b1000 ;
        q3 <= 3'b100 ;
        q2 <= 2'b10 ;
    end
/////////////////////////////////////  
// always @(posedge clk)
// begin
// div <= div + 1;
// clkd <= div[2];
 
// end
 ////////////////////////////////
   
always @(posedge clk)
    begin
       q7 <= {q7[0], q7[6:1]} ;
       q6 <= {q6[0], q6[5:1]} ;
       q5 <= {q5[0], q5[4:1]} ;
       q4 <= {q4[0], q4[3:1]} ;
       q3 <= {q3[0], q3[2:1]} ;
       q2 <= ~q2 ;
       
/////////////////// Traffic only in all directions ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        if ( (in == 8'b_11_11_11_11) || (in == 8'b_01_01_01_01) || (in == 8'b_10_10_10_10) )
            begin
            
                yellow_a = q4[3] ;
                green_a <= q4[2] ;
                red_a <= ( (!q4[3]) && (!q4[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q4[2] ;
                green_b <= q4[1] ;
                red_b <= ( (!q4[2]) && (!q4[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q4[1] ;
                green_c <= q4[0] ;
                red_c <= ( (!q4[1]) && (!q4[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q4[0] ;
                green_d <= q4[3] ;
                red_d <= ( (!q4[0]) && (!q4[3]) ) ? 1'b1 : 1'b0 ;
        
        
            end
            
/////////////////// Traffic only in directions A, B & C ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_01_01_00) || (in == 8'b_10_10_10_00) )
            begin
               
                yellow_a <= q3[2] ;
                green_a <= q3[1] ;
                red_a <= ( (!q3[2]) && (!q3[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q3[1] ;
                green_b <= q3[0] ;
                red_b <= ( (!q3[1]) && (!q3[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q3[0] ;
                green_c <= q3[2] ;
                red_c <= ( (!q3[0]) && (!q3[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 
            
        else if ( (in == 8'b_11_11_11_01) || (in == 8'b_11_11_11_10) )
            begin
               
                yellow_a = q7[6] ;
                green_a <= q7[5] || q7[4] ;
                red_a <= ( (!q7[6]) && (!q7[5]) && (!q7[4]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q7[5] || q7[4] ;
                green_b <= q7[3] || q7[2] ;
                red_b <= ( (!q7[5]) && (!q7[4]) && (!q7[3]) && (!q7[2])  ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q7[3] || q7[2] ;
                green_c <= q7[1] || q7[0] ;
                red_c <= ( (!q7[3]) && (!q7[2]) && (!q7[1]) && (!q7[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q7[1] || q7[0] ;
                green_d <= q7[6] ;
                red_d <= ( (!q7[1]) && (!q7[0]) && (!q7[6]) ) ? 1'b1 : 1'b0 ;
               
            end             
           
            
/////////////////// Traffic only in directions A, B & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_01_00_01) || (in == 8'b_10_10_00_10) )
            begin
               
                yellow_a <= q3[2] ;
                green_a <= q3[1] ;
                red_a <= ( (!q3[2]) && (!q3[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q3[1] ;
                green_b <= q3[0] ;
                red_b <= ( (!q3[1]) && (!q3[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;              
                
                yellow_d <= q3[0] ;
                green_d <= q3[2] ;
                red_d <= ( (!q3[0]) && (!q3[2]) ) ? 1'b1 : 1'b0 ;
               
            end
            
        else if ( (in == 8'b_11_11_01_11) || (in == 8'b_11_11_10_11) )
            begin
               
                yellow_a = q7[6] ;
                green_a <= q7[5] || q7[4] ;
                red_a <= ( (!q7[6]) && (!q7[5]) && (!q7[4]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q7[5] || q7[4] ;
                green_b <= q7[3] || q7[2] ;
                red_b <= ( (!q7[5]) && (!q7[4]) && (!q7[3]) && (!q7[2])  ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q7[3] || q7[2] ;
                green_d <= q7[1] || q7[0] ;
                red_d <= ( (!q7[3]) && (!q7[2]) && (!q7[1]) && (!q7[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q7[1] || q7[0] ;
                green_c <= q7[6] ;
                red_c <= ( (!q7[1]) && (!q7[0]) && (!q7[6]) ) ? 1'b1 : 1'b0 ;
               
            end
            
            
/////////////////// Traffic only in directions A, C & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_00_01_01) || (in == 8'b_10_00_10_10) )
            begin
               
                yellow_a <= q3[2] ;
                green_a <= q3[1] ;
                red_a <= ( (!q3[2]) && (!q3[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= q3[1] ;
                green_c <= q3[0] ;
                red_c <= ( (!q3[1]) && (!q3[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q3[0] ;
                green_d <= q3[2] ;
                red_d <= ( (!q3[0]) && (!q3[2]) ) ? 1'b1 : 1'b0 ;               
               
            end
        
        else if ( (in == 8'b_11_01_11_11) || (in == 8'b_11_10_11_11) )
            begin
               
                yellow_a = q7[6] ;
                green_a <= q7[5] || q7[4] ;
                red_a <= ( (!q7[6]) && (!q7[5]) && (!q7[4]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q7[5] || q7[4] ;
                green_c <= q7[3] || q7[2] ;
                red_c <= ( (!q7[5]) && (!q7[4]) && (!q7[3]) && (!q7[2])  ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q7[3] || q7[2] ;
                green_d <= q7[1] || q7[0] ;
                red_d <= ( (!q7[3]) && (!q7[2]) && (!q7[1]) && (!q7[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q7[1] || q7[0] ;
                green_b <= q7[6] ;
                red_b <= ( (!q7[1]) && (!q7[0]) && (!q7[6]) ) ? 1'b1 : 1'b0 ;
               
            end
            
/////////////////// Traffic only in directions B, C & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_00_01_01_01) || (in == 8'b_00_10_10_10) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= q3[2] ;
                green_b <= q3[1] ;
                red_b <= ( (!q3[2]) && (!q3[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q3[1] ;
                green_c <= q3[0] ;
                red_c <= ( (!q3[1]) && (!q3[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q3[0] ;
                green_d <= q3[2] ;
                red_d <= ( (!q3[0]) && (!q3[2]) ) ? 1'b1 : 1'b0 ;
               
            end
        
        else if ( (in == 8'b_01_11_11_11) || (in == 8'b_10_11_11_11) )
            begin
               
                yellow_b = q7[6] ;
                green_b <= q7[5] || q7[4] ;
                red_b <= ( (!q7[6]) && (!q7[5]) && (!q7[4]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q7[5] || q7[4] ;
                green_c <= q7[3] || q7[2] ;
                red_c <= ( (!q7[5]) && (!q7[4]) && (!q7[3]) && (!q7[2])  ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q7[3] || q7[2] ;
                green_d <= q7[1] || q7[0] ;
                red_d <= ( (!q7[3]) && (!q7[2]) && (!q7[1]) && (!q7[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q7[1] || q7[0] ;
                green_a <= q7[6] ;
                red_a <= ( (!q7[1]) && (!q7[0]) && (!q7[6]) ) ? 1'b1 : 1'b0 ;
               
            end
           
/////////////////// Traffic only in directions A & B ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_01_00_00) | (in == 8'b_10_10_00_00) )
            begin
               
                yellow_a <= q2[1] ;
                green_a <= q2[0] ;
                red_a <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q2[0] ;
                green_b <= q2[1] ;
                red_b <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

        else if ( (in == 8'b_11_11_01_01) | (in == 8'b_11_11_10_10) )
            begin
               
                yellow_a = q6[5] ;
                green_a <= q6[4] || q6[3] ;
                red_a <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q6[4] || q6[3] ;
                green_b <= q6[2] || q6[1] ;
                red_b <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q6[2] || q6[1] ;
                green_c <= q6[0] ;
                red_c <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[0] ;
                green_d <= q6[5] ;
                red_d <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
/////////////////// Traffic only in directions A & C ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_00_01_00) || (in == 8'b_10_00_10_00) )
            begin
               
                yellow_a <= q2[1] ;
                green_a <= q2[0] ;
                red_a <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= q2[0] ;
                green_c <= q2[1] ;
                red_c <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

        else if ( (in == 8'b_11_01_11_01) || (in == 8'b_11_10_11_10) )
            begin
               
                yellow_a = q6[5] ;
                green_a <= q6[4] || q6[3] ;
                red_a <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q6[4] || q6[3] ;
                green_c <= q6[2] || q6[1] ;
                red_c <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q6[2] || q6[1] ;
                green_b <= q6[0] ;
                red_b <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[0] ;
                green_d <= q6[5] ;
                red_d <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
/////////////////// Traffic only in directions A & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_01_00_00_01) || (in == 8'b_10_00_00_10) )
            begin
                
                yellow_a <= q2[1] ;
                green_a <= q2[0] ;
                red_a <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= q2[0] ;
                green_d <= q2[1] ;
                red_d <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                                
            end 

        else if ( (in == 8'b_11_01_01_11) || (in == 8'b_11_10_10_11) )
            begin
                
                yellow_a = q6[5] ;
                green_a <= q6[4] || q6[3] ;
                red_a <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[4] || q6[3] ;
                green_d <= q6[2] || q6[1] ;
                red_d <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q6[2] || q6[1] ;
                green_b <= q6[0] ;
                red_b <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q6[0] ;
                green_c <= q6[5] ;
                red_c <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
                                
            end 
            
/////////////////// Traffic only in directions B & C ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_00_01_01_00) || (in == 8'b_00_10_10_00) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= q2[1] ;
                green_b <= q2[0] ;
                red_b <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q2[0] ;
                green_c <= q2[1] ;
                red_c <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

        else if ( (in == 8'b_01_11_11_01) || (in == 8'b_10_11_11_10) )
            begin
               
                yellow_b = q6[5] ;
                green_b <= q6[4] || q6[3] ;
                red_b <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q6[4] || q6[3] ;
                green_c <= q6[2] || q6[1] ;
                red_c <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q6[2] || q6[1] ;
                green_a <= q6[0] ;
                red_a <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[0] ;
                green_d <= q6[5] ;
                red_d <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
/////////////////// Traffic only in directions B & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_00_01_00_01) || (in == 8'b_00_10_00_10) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= q2[1] ;
                green_b <= q2[0] ;
                red_b <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= q2[0] ;
                green_d <= q2[1] ;
                red_d <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
               
            end

        else if ( (in == 8'b_01_11_01_11) || (in == 8'b_10_11_10_11) )
            begin
               
                yellow_b = q6[5] ;
                green_b <= q6[4] || q6[3] ;
                red_b <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[4] || q6[3] ;
                green_d <= q6[2] || q6[1] ;
                red_d <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q6[2] || q6[1] ;
                green_a <= q6[0] ;
                red_a <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q6[0] ;
                green_c <= q6[5] ;
                red_c <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
               
            end
            
/////////////////// Traffic only in directions C & D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        else if ( (in == 8'b_00_00_01_01) || (in == 8'b_00_00_10_10) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= q2[1] ;
                green_c <= q2[0] ;
                red_c <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q2[0] ;
                green_d <= q2[1] ;
                red_d <= ( (!q2[1]) && (!q2[0]) ) ? 1'b1 : 1'b0 ;
               
            end

        else if ( (in == 8'b_01_01_11_11) || (in == 8'b_10_10_11_11) )
            begin
               
                yellow_c = q6[5] ;
                green_c <= q6[4] || q6[3] ;
                red_c <= ( (!q6[5]) && (!q6[4]) && (!q6[3]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q6[4] || q6[3] ;
                green_d <= q6[2] || q6[1] ;
                red_d <= ( (!q6[4]) && (!q6[3]) && (!q6[2]) && (!q6[1])  ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q6[2] || q6[1] ;
                green_a <= q6[0] ;
                red_a <= ( (!q6[2]) && (!q6[1]) && (!q6[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q6[0] ;
                green_b <= q6[5] ;
                red_b <= ( (!q6[1]) && (!q6[0]) && (!q6[5]) ) ? 1'b1 : 1'b0 ;
               
            end

/////////////////// Traffic only in direction A ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
        else if ( (in == 8'b_01_00_00_00) || (in == 8'b_10_00_00_00) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b1 ;
                red_a <= 1'b0 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

         else if ( (in == 8'b_11_01_01_01) || (in == 8'b_11_10_10_10) )
            begin
               
                yellow_a = q5[4] ;
                green_a <= q5[3] || q5[2] ;
                red_a <= ( (!q5[4]) && (!q5[3]) && (!q5[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q5[3] || q5[2] ;
                green_b <= q5[1] ;
                red_b <= ( (!q5[3]) && (!q5[2]) && (!q5[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q5[1] ;
                green_c <= q5[0] ;
                red_c <= ( (!q5[1]) && (!q5[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q5[0] ;
                green_d <= q5[4] ;
                red_d <= ( (!q5[0]) && (!q5[4]) ) ? 1'b1 : 1'b0 ;
               
            end 
           
/////////////////// Traffic only in direction B ///////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        else if ( (in == 8'b_00_01_00_00) || (in == 8'b_00_10_00_00) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b1 ;
                red_b <= 1'b0 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

        else if ( (in == 8'b_01_11_01_01) || (in == 8'b_10_11_10_10) )
            begin
               
                yellow_b = q5[4] ;
                green_b <= q5[3] || q5[2] ;
                red_b <= ( (!q5[4]) && (!q5[3]) && (!q5[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q5[3] || q5[2] ;
                green_a <= q5[1] ;
                red_a <= ( (!q5[3]) && (!q5[2]) && (!q5[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q5[1] ;
                green_c <= q5[0] ;
                red_c <= ( (!q5[1]) && (!q5[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q5[0] ;
                green_d <= q5[4] ;
                red_d <= ( (!q5[0]) && (!q5[4]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
/////////////////// Traffic only in direction C ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        else if ( (in == 8'b_00_00_01_00) || (in == 8'b_00_00_10_00) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b1 ;
                red_c <= 1'b0 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;
               
            end 

        else if ( (in == 8'b_01_01_11_01) || (in == 8'b_10_10_11_10) )
            begin
               
                yellow_c = q5[4] ;
                green_c <= q5[3] || q5[2] ;
                red_c <= ( (!q5[4]) && (!q5[3]) && (!q5[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q5[3] || q5[2] ;
                green_a <= q5[1] ;
                red_a <= ( (!q5[3]) && (!q5[2]) && (!q5[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q5[1] ;
                green_b <= q5[0] ;
                red_b <= ( (!q5[1]) && (!q5[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_d <= q5[0] ;
                green_d <= q5[4] ;
                red_d <= ( (!q5[0]) && (!q5[4]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
/////////////////// Traffic only in direction D ///////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        else if ( (in == 8'b_00_00_00_01) || (in == 8'b_00_00_00_10) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b1 ;
                red_d <= 1'b0 ;
               
            end 

        else if ( (in == 8'b_01_01_01_11) || (in == 8'b_10_10_10_11) )
            begin
               
                yellow_d = q5[4] ;
                green_d <= q5[3] || q5[2] ;
                red_d <= ( (!q5[4]) && (!q5[3]) && (!q5[2]) ) ? 1'b1 : 1'b0 ;
                
                yellow_a <= q5[3] || q5[2] ;
                green_a <= q5[1] ;
                red_a <= ( (!q5[3]) && (!q5[2]) && (!q5[1]) ) ? 1'b1 : 1'b0 ;
                
                yellow_b <= q5[1] ;
                green_b <= q5[0] ;
                red_b <= ( (!q5[1]) && (!q5[0]) ) ? 1'b1 : 1'b0 ;
                
                yellow_c <= q5[0] ;
                green_c <= q5[4] ;
                red_c <= ( (!q5[0]) && (!q5[4]) ) ? 1'b1 : 1'b0 ;
               
            end 
            
//No traffic in all directions
        else if ( (in == 8'b_00_00_00_00) )
            begin
               
                yellow_a <= 1'b0 ;
                green_a <= 1'b0 ;
                red_a <= 1'b1 ;
                
                yellow_b <= 1'b0 ;
                green_b <= 1'b0 ;
                red_b <= 1'b1 ;
                
                yellow_c <= 1'b0 ;
                green_c <= 1'b0 ;
                red_c <= 1'b1 ;
                
                yellow_d <= 1'b0 ;
                green_d <= 1'b0 ;
                red_d <= 1'b1 ;  
                
            end            
       end
endmodule



