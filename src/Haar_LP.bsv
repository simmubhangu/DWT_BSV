package Haar_LP;
      
      interface Haar_LP;
           method Action input_two_value(Bit#(16) value );
           method ActionValue #(Bit#(8)) h_0(); 
      endinterface

      (*synthesize*)

      module mkLP(Haar_LP);
   
         Reg#(Bit#(8)) out <- mkReg(0);
 
         method Action input_two_value(Bit#(16) value );
               Bit#(8) a_0 = value[15:8];
               Bit#(8) a_1 = value[7:0];
               out <= (a_1 +a_0)/2;
         endmethod
   
         method ActionValue #(Bit#(8)) h_0(); 
               return out;
         endmethod

      endmodule

endpackage

