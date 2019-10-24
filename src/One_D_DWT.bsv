package One_D_DWT;
 //import BSV already exiting files 
   import FIFO :: * ; 
   import RegFile :: * ;
//////////////////////////////////////

//import used defined modules

   import Haar_HP :: *;    //for High pass filter
   import Haar_LP :: * ;   //for Low pass filter
///////////////////////////////////////
(*synthesize*)
   module mkOneDDWT();    //top module name
         FIFO#(Bit#(8)) row_fifo_0 <- mkFIFO;    //fifo to store first element of row
         FIFO#(Bit#(8)) row_fifo_1 <- mkFIFO;    //fifo to store first element of row
        
         FIFO#(Bit#(8)) c_fifo_00 <- mkFIFO;    //fifo to store first element of row
         FIFO#(Bit#(8)) c_fifo_01 <- mkFIFO;    //fifo to store secong element of same row
        
         FIFO#(Bit#(8)) c_fifo_10 <- mkFIFO;    //fifo to store secong element of same row
         FIFO#(Bit#(8)) c_fifo_11 <- mkFIFO;    //fifo to store secong element of same row
         Reg#(Bit#(16)) address <- mkReg(0);     //address count
         Reg#(Bit#(16)) read_count <- mkReg(0);  
         Reg#(Bit#(16)) state <- mkReg(0);  
         RegFile#(Bit#(16), Bit#(8)) image <- mkRegFileLoad("image_text_file/lena256bw.txt", 0, 65535); //load
       //image from text(hex) file image (256*256)                                                       
         
         Haar_HP high_pass <- mkHP();
         Haar_LP low_pass <- mkLP();
         
         rule initial_push(address ==0 && state ==0);
            row_fifo_0.enq(image.sub(address));  //push into first fifo
            row_fifo_1.enq(image.sub(address+1)); //push second data into second fifo
            address <= address+2;
            state <= state+1;
         endrule
         rule access_data(address > 1  && state==1);      //iterate till last value
            row_fifo_0.enq(image.sub(address));  //push into first fifo
            row_fifo_1.enq(image.sub(address+1)); //push second data into second fifo
            address <= address+2;                // increment by two
            state <= state+1;
         endrule
         rule finish_data(state==2);
            let concat_value = {row_fifo_0.first, row_fifo_1.first};
            row_fifo_0.deq;
            row_fifo_1.deq;
    
            high_pass.input_two_value(concat_value);
            low_pass.input_two_value(concat_value);
            $display(high_pass.h_0, low_pass.h_0);
            //$display(row_fifo_0.first,row_fifo_1.first);
            //$display(read_count);
            read_count <= read_count+1;
            state <= 1;
         endrule
         rule finish(read_count ==(65535/2));
            $finish(0);
         endrule
   endmodule
endpackage
