/*
  Author : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Encoding the states of a Finite State machine in verilog
*/

module encode (
              clk,
              rst,
              mem,
              a,
              out1
              );
  // input port
  input clk;
  input rst;
  input mem;
  input a;
  // output port
  output out1;
  
  // state machine
  integer state;
  
  always @ (posedge clk)
    begin
      if (rst)
        begin
          out1 <=0;
          state <=0;
        end
      else
        begin
          case (state)
            0:
              begin
                if (mem)
                  begin
                    state <=1;
                  end 
                end 
            1:
              begin
                state <=2;
              end
            2:
              begin
                state <=3;
              end 
            3:
              begin
                state <=4;
              end
            4:
              begin
                state <=5;
              end
            5:
              begin
                if (a)
                  begin
                    state <= 1;
                  end
                else
                  begin
                    state <=6;
                  end 
              end
            6:
              begin
                state <=7;
              end
            7:
              begin
                state <= 0;
              end 
          endcase
        end 
    end 
 
   always @ (negedge clk)
     begin
       case (state)
         0:
           begin
             out1 <=0;
           end
         1:
           begin
             out1 <=0;
           end
         2:
           begin
             out1 <=0;
           end
         3:
           begin
             out1 <=0;
           end
         4:
           begin
             out1 <=0;
           end 
         5:
           begin
             out1 <=0;
           end
         6:
           begin
             out1 <=1;
           end
         7:
           begin
             out1 <=1;
           end 
       endcase
     end 
  
endmodule

/*


module tb_1(

    );
  // input port
  reg clk;
  reg rst;
  reg mem;
  reg a;
  // output port
  wire out1;
  
encode  uut (
              clk,
              rst,
              mem,
              a,
              out1
              );
  initial
    begin
      clk =0;
      rst =1;
      a= 0;
      mem =1;
      #10 
      rst =0;
    end 
    
  always 
    begin
      #5 clk = ! clk;
    end 

endmodule

*/
