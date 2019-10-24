package Ram_File;
  
   import FIFO :: * ; 
   import RegFile :: * ;

(*synthesize*)
   module mkImageLoad();
         FIFO#(Bit#(8)) row_fifo_0 <- mkFIFO;
         FIFO#(Bit#(8)) row_fifo_1 <- mkFIFO;
         Reg#(Bit#(16)) address <- mkReg(0);
         Reg#(Bit#(16)) read_count <- mkReg(0);
         RegFile#(Bit#(16), Bit#(8)) image <- mkRegFileLoad("image_text_file/lena256bw.txt", 0, 15);
      
      rule access_data(address < 15);
         row_fifo_0.enq(image.sub(address));
         row_fifo_1.enq(image.sub(address+1));
         address <= address+2;
      endrule
      rule finish_data(address%2 == 0);
         $display(row_fifo_0.first,row_fifo_1.first);
         row_fifo_0.deq;
         row_fifo_1.deq;
         read_count <= read_count +1;
      endrule
      rule finish(read_count ==(15/2));
         $finish(0);
      endrule
   endmodule
endpackage
