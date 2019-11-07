package DWT_Compression;
 //import BSV already exiting files 
   import FIFO :: * ; 
   import Vector :: * ; 
   import RegFile :: * ;
//////////////////////////////////////

//import used defined modules

   import Haar_HP :: *;    //for High pass filter
   import Haar_LP :: * ;   //for Low pass filter
///////////////////////////////////////


(*synthesize*)
   module mkDWTComp();    //top module name
      //fucntion to generate low components if value
      //input is 16 bit and out put is 8 bit low value
   function low_pass_filter(Bit#(16) value);
       Bit#(8) a_0 = value[15:8];
       Bit#(8) a_1 = value[7:0];
       //$display(a_0);
       return (a_1/2 + a_0/2);
   endfunction
   //function to generate the high components value 
   //input 16 bit and out is 8 bit
   function high_pass_filter(Bit#(16) value);
       Bit#(8) a_0 = value[15:8];
       Bit#(8) a_1 = value[7:0];
       //$display(a_0);
       if (a_1 < a_0)
           return 0;
       else
          return (a_1/2 -a_0/2);
   endfunction
         Reg#(Bit#(8)) l_00 <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) l_01 <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) h_00 <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) h_01 <- mkReg(0);    //reg to store first element of row
         
         Reg#(Bit#(8)) ll <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) lh <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) hl <- mkReg(0);    //reg to store first element of row
         Reg#(Bit#(8)) hh <- mkReg(0);    //reg to store first element of row
         
         FIFO#(Bit#(8)) row_fifo_0 <- mkFIFO;    //fifo to store first element of row
         FIFO#(Bit#(8)) row_fifo_1 <- mkFIFO;    //fifo to store first element of row
        
         FIFO#(Bit#(8)) c_fifo_0 <- mkFIFO;    //two parallel fifo for low component
         FIFO#(Bit#(8)) c_fifo_1 <- mkFIFO;    
        
         FIFO#(Bit#(8)) c_fifo_h0 <- mkFIFO;    //two fifo for high componets
         FIFO#(Bit#(8)) c_fifo_h1 <- mkFIFO;    
         
         Reg#(Bit#(7)) ihl <- mkReg(0);    //reg to store i compression iteration
         Reg#(Bit#(7)) ilh <- mkReg(0);    //reg to store i compression iteration
         Reg#(Bit#(7)) ihh <- mkReg(0);    //reg to store i compression iteration
         Reg#(Bit#(7)) jhl <- mkReg(0);    //reg to store i compression iteration
         Reg#(Bit#(7)) jlh <- mkReg(0);    //reg to store i compression iteration
         Reg#(Bit#(7)) jhh <- mkReg(0);    //reg to store i compression iteration
         
         Reg#(Bit#(16)) address <- mkReg(0);     //address count
         Reg#(Bit#(16)) read_count <- mkReg(0);  
         Reg#(Bit#(16)) state <- mkReg(0);  
         RegFile#(Bit#(16), Bit#(8)) image <- mkRegFileLoad("image_text_file/lena256bw.txt", 0, 65535); //load
       //image from text(hex) file image (256*256)                                                       
         
         Haar_HP high_pass <- mkHP();
         Haar_LP low_pass <- mkLP();
         
         rule initial_push(address ==0 && state ==0); //inital push to the fifo
            row_fifo_0.enq(image.sub(address));  //push into first fifo
            row_fifo_1.enq(image.sub(address+1)); //push second data into second fifo
            c_fifo_0.enq(image.sub(address+256));
            c_fifo_1.enq(image.sub(address+256+1));
            address <= address+2;                // increment by two
            read_count <= read_count +2;
            state <= state+1;
         endrule
         rule push_till_last_address(address > 1); // && state==1);      //iterate till last value
            row_fifo_0.enq(image.sub(address));  //push into first fifo
            row_fifo_1.enq(image.sub(address+1)); //push second data into second fifo
            c_fifo_0.enq(image.sub(address+256));
            c_fifo_1.enq(image.sub(address+256+1));
            if (read_count == 254) begin
               address <= address +256+2;
               read_count <= 2;
            end
            else begin
               read_count <= read_count+2;
               address <= address+2;
             end
          // $display(address , read_count);
           // state <= state+1;
         endrule
         rule first_coefficient(address >3); //get the first Haar coefficient
            let concat_r = {row_fifo_0.first, row_fifo_1.first}; //conacte 16 bit together first row
            let concat_c = {c_fifo_0.first, c_fifo_1.first};     //second row two column
            c_fifo_0.deq;                                        //dequeue the each fifo
            c_fifo_1.deq;
            row_fifo_0.deq;
            row_fifo_1.deq;

           // $display(concat_value[7:0] , concat_value[15:8]);
           // $display((concat_value[7:0]/2+ concat_value[15:8]/2));
            l_00 <= low_pass_filter(concat_r);                  //pash to low and high pass filter
            l_01 <= low_pass_filter(concat_c);
            //$display(l);
            h_00 <= high_pass_filter(concat_r);
            //$display(l);
            h_01 <= high_pass_filter(concat_c);
            let concat_ll = {l_00, l_01};                       //for 2nd coefficient
            let concat_hh = {h_00, h_01};

            ll <= low_pass_filter(concat_ll);        //pass again for 2D wavelet
            lh <= high_pass_filter(concat_ll);
            hl <= low_pass_filter(concat_hh);
            hh <= high_pass_filter(concat_hh);
            
            //$display(ll, lh, hl, hh);                              //print and save each image coff
            state <= state+1;
            //$display(row_fifo_0.first,row_fifo_1.first);
            //$display(state);
         endrule
      
         rule compression_lh(state > 2);
            if (ilh <= 127)begin
               if(jlh <= 127) begin
                  if (lh > 1) begin           
                     $display(ilh," ",jlh, " ", lh);
                   end
                  jlh <= jlh+1;
               end
               if(jlh==127)
                   ilh <= ilh+1;
            end
         endrule
         rule compression_hl(state > 2);
            if (ihl <= 127)begin
               if(jhl <= 127) begin
                  if (hl > 1) begin           
                     $display(ihl," ", jhl, " " , hl);
                   end
                  jhl <= jhl+1;
               end
               if(jhl==127)
                   ihl <= ihl+1;
            end
         endrule
          rule compression_hh(state > 2);
            if (ihh <= 127)begin
               if(jhh <= 127) begin
                  if (hh > 1) begin           
                     $display(ihh, " ",jhh, " ",  hh);
                   end
                  jhh <= jhh+1;
               end
               if(jhh==127)
                   ihh <= ihh+1;
            end
         endrule
         
         rule finish(state ==(65535/4)+3);     // final rule to end the game
            //$display(l,h);
            $finish(0);
         endrule
   endmodule
endpackage
