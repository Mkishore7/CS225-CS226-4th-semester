module tlight(clk,reset,red,yellow,green);  
    output red,yellow,green;
    input reset,clock;
    reg[1:0] state;
    reg[1:0] next_state;
    parameter [1:0]FIRST=2'b00;
    parameter [1:0]SECOND=2'b01;
    parameter [1:0]THIRD=2'b10;
    parameter [1:0]FOURTH=2'b11;
    
    always@(posedge clock)
    begin
        if(reset) state <= FIRST;
        else state <= next_state;
    end
    // if(reset)
    // assign state=FIRST;
    // else
    // begin
        always@*
        begin
            case(state)
            FIRST:  if(reset)
                    next_state=FIRST;
                    else next_state=SECOND;
            SECOND: if(reset)
                    next_state=FIRST;
                    else next_state=THIRD;
            THIRD:  if(reset)
                    next_state=FIRST;
                    else next_state=FOURTH;
            FOURTH: if(reset)
                    next_state=FIRST;
                    else next_state=FIRST;
            endcase
        end
    // end
    assign red=(FIRST==state | SECOND==state);
    assign yellow=(FOURTH==state | SECOND==state);
    assign green=(THIRD==state);
endmodule 

module tb();
    wire yellow,green,red;
    reg reset;
    reg clck=0;
    
    always #5 clck = ~clck;
    tlight traffic(red,yellow,green,reset,clck);
    
    initial
    begin
        reset=1'b1;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0; 
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b0;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b1;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        reset=1'b1;
        #5;
        // $display("red=%b, yellow=%b , green=%b, reset= %b,time= %t\n",red,yellow,green,reset,$time);
        $finish;
    end
    initial 
    begin
        $monitor("red=%b, yellow=%b , green=%b, reset= %b,clock=%b ,time= %t\n",red,yellow,green,reset,clck,$time);
    end
    
endmodule
