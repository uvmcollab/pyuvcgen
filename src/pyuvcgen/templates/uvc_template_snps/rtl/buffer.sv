module buffer #(
  parameter int Width = 8
)(
  input  logic             clk_i,
  input  logic             rst_i,
  input  logic [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

  always_ff @(posedge clk_i, posedge rst_i) begin
    if (rst_i) begin
      q_o <= '0;
    end else begin
      q_o <= d_i;
    end
  end

endmodule : buffer
