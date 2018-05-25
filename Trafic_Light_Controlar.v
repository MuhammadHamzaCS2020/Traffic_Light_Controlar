module Trafic_Light_Controlar(
    input start_trafic,
    input clk,
    output reg red1,
    output reg green1,
    output reg yellow1,
    output reg red2,
    output reg green2,
    output reg yellow2
  );

wire A1;
wire A2;
wire A3;
wire A4;

reg [3:0]counter_input;
reg [3:0]counter_input2;
reg [3:0]counter_output;
reg [3:0]counter_output;
reg enable;

assign enable=start_trafic;

assign counter_input={A1,A2,A3,A4};
assign counter_input2={A1,A2,A3,A4};


always@(posedge clk, posedge enable)
begin
  if(counter_output==0)
    counter_output<=4'd9;
  else
      counter_output<=counter_output-1;       
 if (counter_input>0 & counter_input<3)
   yellow1=1'b1;
 else
    if (counter_input>=3 & counter_input<10)
      green1=1'b1;
    else
      if(counter_input>=3 & counter_input<10)
        begin
          red1=1'b1;
          enable=1'b0;
        end
 end
 
always@(posedge clk, negedge enable)
begin
      counter_input2<=counter_input2-1;       
 if (counter_input2>0 & counter_input2<3)
   yellow2=1'b1;
 else
    if (counter_input2>=3 & counter_input2<10)
      green2=1'b1;
    else
      if(counter_input2>=3 & counter_input2<10)
        begin
          red2=1'b1;
          enable=1'b1;
        end
 end 
 
 end
 end
 endmodule 
