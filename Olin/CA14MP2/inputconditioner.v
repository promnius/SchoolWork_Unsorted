module inputconditioner(clk, noisysignal, conditioned, positiveedge, negativeedge);
output reg conditioned = 0;
output reg positiveedge = 0;
output reg negativeedge = 0;
input clk, noisysignal;

parameter counterwidth = 3;
parameter waittime = 3;

reg[counterwidth-1:0] counter =0;
reg synchronizer0 = 0;
reg synchronizer1 = 0;

always @(posedge clk) begin
    if(conditioned == synchronizer1) begin
        counter <= 0;
        // edge detection reset
        positiveedge <= 0;
        negativeedge <= 0;
        // end
    end
    else begin
        if (counter == waittime) begin
            counter <= 0;
            conditioned <= synchronizer1;
            // our added code for edge detection
            if (synchronizer1 == 1) 
                positiveedge <= 1;
            else
                negativeedge <= 1;
            // end our code
        end
        else 
            counter <= counter+1;
    end
    synchronizer1 = synchronizer0;
    synchronizer0 = noisysignal;
end
endmodule


module inputconditioner_breakable(clk, noisysignal, conditioned, positiveedge, negativeedge, faultactive);
output reg conditioned = 0;
output reg positiveedge = 0;
output reg negativeedge = 0;
input clk, noisysignal, faultactive;

parameter counterwidth = 3;
parameter waittime = 3;

reg[counterwidth-1:0] counter =0;
reg synchronizer0 = 0;
reg synchronizer1 = 0;

always @(posedge clk) begin
    if(conditioned == synchronizer1) begin
        counter <= 0;
        // edge detection reset
        positiveedge <= 0;
        negativeedge <= 0;
        // end
    end
    else begin
        if (counter == waittime) begin
            counter <= 0;
            conditioned <= synchronizer1;
            // our added code for edge detection
            if (synchronizer1 == 1) 
                positiveedge <= 1;
            else
                negativeedge <= 1;
            // end our code
        end
        else 
            counter <= counter+1;
    end
    synchronizer1 = synchronizer0;
    synchronizer0 = noisysignal;
end
endmodule


module testConditioner;
wire conditioned;
wire rising;
wire falling;
reg pin, clk;
reg ri;
always @(posedge clk) ri=rising;
inputconditioner dut(clk, pin, conditioned, rising, falling);

initial clk=0;
always #10 clk=!clk;    // 50MHz Clock

initial begin
// Your Test Code
// Be sure to test each of the three things the conditioner does:
// Synchronize, Clean, Preprocess (edge finding)
pin=0; #50
pin=1; #5
pin=0; #10
pin=1; #10
pin=0; #200
pin=1; #200
pin=0; #200;

end
endmodule
