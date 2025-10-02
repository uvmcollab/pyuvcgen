`ifndef TOP_SCOREBOARD_SV
`define TOP_SCOREBOARD_SV

class top_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(top_scoreboard)

  int m_num_passed;
  int m_num_failed;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

endclass : top_scoreboard


function top_scoreboard::new(string name, uvm_component parent);
  super.new(name, parent);
  m_num_passed = 0;
  m_num_failed = 0;
endfunction : new


function void top_scoreboard::build_phase(uvm_phase phase);
endfunction : build_phase


task top_scoreboard::run_phase(uvm_phase phase);
endtask : run_phase


function void top_scoreboard::report_phase(uvm_phase phase);
endfunction : report_phase

`endif // TOP_SCOREBOARD_SV
