package Testbench_Haar;

   import Haar_HP :: *; 
   import Haar_LP :: *;

   (*synthesize*)

   module mkTestbenchHaar ();

      Haar_HP high_pass <- mkHP();
      Haar_LP low_pass <- mkLP();
      Reg#(Bit#(8)) state <- mkReg(0);

      rule send_data(state ==0);
            high_pass.input_two_value(12345);
            low_pass.input_two_value(12345);
            state <= 1;
      endrule
      
      rule out_data(state ==1);
            $display(high_pass.h_0(),low_pass.h_0());
            state <= 2;
      endrule
      rule finish(state ==2);
            $finish(0);
      endrule
   endmodule
endpackage
