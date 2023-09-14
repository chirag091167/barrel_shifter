module barrel(data,ctr,dir,out);

input [7:0] data;   //input data
input [2:0] ctr;    //number of bits have to be rotated
output reg[7:0] out;    // output after rotation
input dir;      //1'b0 = shift right and 1'b1=shift left

always@(*)
begin
if(!dir)        //shift right
begin
    case(ctr)
        3'b000: out = data;
        3'b001: out = {data[0],data[7:1]};
        3'b010: out = {data[1:0] , data[7:2]};
        3'b011: out = {data[2:0] , data[7:3]};
        3'b100: out = {data[3:0] , data[7:4]};
        3'b101: out = {data[4:0] , data[7:5]};
        3'b110: out = {data[5:0] , data[7:6]};
        3'b111: out = {data[6:0] , data[7]};
    // default out = {data[6:0], data[7]};
    endcase
end
else
begin
    case(ctr)       //shift left
        3'b000: out = data;
        3'b001: out = {data[6:0],data[7]};
        3'b010: out = {data[5:0] , data[7:6]};
        3'b011: out = {data[4:0] , data[7:5]};
        3'b100: out = {data[3:0] , data[7:4]};
        3'b101: out = {data[2:0] , data[7:3]};
        3'b110: out = {data[1:0] , data[7:2]};
        3'b111: out = {data[0] , data[7:1]};
    // default out = {data[6:0], data[7]};
    endcase
end
    end

endmodule