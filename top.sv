
// CB


module cb_top 
  #(
    parameter IN=2,
    parameter OUT=1,
    parameter DWIDTH=32,
    parameter BWIDTH=3
  ) 
  (
    input bit clk,
    input bit rstn,
    input bit [DWIDTH-1:0] data[IN],
    input bit Ireq[IN],
    output reg Oresp[IN],
    input bit Oreq[OUT],
    output bit Iresp[OUT]
  );

  parameter BUFF_DEPTH = 2^(BWIDTH);
  
  typedef enum bit                    {REQ, nREQ}   req_t;
  typedef enum bit                    {RESP, nRESP} resp_t;
  typedef enum bit [3:0]              {START, }     fsm_t;
  
  typedef      reg [BUFF_DEPTH-1:0]                 ptr_t;
  typedef      reg [DWIDTH-1:0]                     buff_t;
  
  buff_t  buff [BUFF_DEPTH];
  fsm_t   fsm;
  ptr_t   wr_ptr, rd_ptr;
  
  always@(posedge clk)begin
    if(!rstn)begin
      foreach(Oreq[i])begin
        Oreq[i] <= nREQ;
      end
      foreach(Oresp[i])begin
        Oresp[i] <= nRESP;
      end
      FSM <= START;
      wr_ptr <= 0;
      rd_ptr <= 0;
    end else begin
      
    end
  end
  
endmodule
