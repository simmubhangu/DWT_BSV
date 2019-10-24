package Haar_HP;
      
      interface Haar_HP;
           method Action input_two_value(Bit#(16) value );
           method ActionValue #(Bit#(8)) h_0(); 
      endinterface

      (*synthesize*)

      module mkHP(Haar_HP);
   
       //  Reg#(Bit#(8)) a_0 <- mkReg(0);
       //  Reg#(Bit#(8)) a_1 <- mkReg(0);
         Reg#(Bit#(8)) out <- mkRegU;
         
         method Action input_two_value(Bit#(16) value );
               Bit#(8) a_0 = value[15:8];
               Bit#(8) a_1 = value[7:0];
              //$display(a_0);
              if (a_1 < a_0)
                 out <=0;
              else
               out <= (a_1 -a_0)/2;
         endmethod
   
         method ActionValue #(Bit#(8)) h_0(); 
           // $finish(0);   
            return out;
         endmethod

      endmodule

endpackage

