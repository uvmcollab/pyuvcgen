`ifndef {{ name | upper }}_IF_SV
`define {{ name | upper }}_IF_SV

interface {{ name }}_if (
  input logic clk_i
);

  timeunit      1ns;
  timeprecision 1ps;


  import {{ name }}_pkg::*;

  // ================================= INPUTS ================================= //
  {%- for elem in inputs %}
  {%- set t = elem.type | default('logic') -%}
  {%- set w = elem.size | default(1) | int -%}
  {%- if w == 1 %}
  {{ "%-12s"|format(t) }} {{ elem.name }};
  {%- else %}
  {{ "%-5s"|format(t) }} [{{ "%2s"|format(w-1) }}:0] {{ elem.name }};
  {%- endif %}
  {%- endfor %}

  // ================================ OUTPUTS ================================= //
  {%- for elem in outputs %}
  {%- set t = elem.type | default('logic') -%}
  {%- set w = elem.size | default(1) | int -%}
  {%- if w == 1 %}
  {{ "%-12s"|format(t) }} {{ elem.name }};
  {%- else %}
  {{ "%-5s"|format(t) }} [{{ "%2s"|format(w-1) }}:0] {{ elem.name }};
  {%- endif %}
  {%- endfor %}

  // ============================= INITIAL VALUES ============================= //

  initial begin
    // Initialize signals here
  end

  // ============================ CLOCKING BLOCKS ============================= //
  
  clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
    {%- for elem in inputs %}
    output {{ elem.name }};
    {%- endfor %}
  endclocking : cb_drv

  clocking cb_drv_neg @(negedge clk_i);
    default input #1ns output #1ns;
    {%- for elem in inputs %}
    output {{ elem.name }};
    {%- endfor %}
  endclocking : cb_drv_neg

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon

  clocking cb_mon_neg @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon_neg

endinterface : {{ name }}_if

`endif // {{ name | upper }}_IF_SV
