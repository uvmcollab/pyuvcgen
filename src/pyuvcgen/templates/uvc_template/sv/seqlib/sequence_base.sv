`ifndef {{ name | upper }}_SEQUENCE_BASE_SV
`define {{ name | upper }}_SEQUENCE_BASE_SV

class {{ name }}_sequence_base extends uvm_sequence #({{ name }}_sequence_item);

  `uvm_object_utils({{ name }}_sequence_base)
  
  // rand {{ name }}_sequence_item m_trans;

  extern function new(string name = "");

  extern virtual task body();

endclass : {{ name }}_sequence_base


function {{ name }}_sequence_base::new(string name = "");
  super.new(name);
  //m_trans = {{ name }}_sequence_item::type_id::create("m_trans");
endfunction : new


task {{ name }}_sequence_base::body();
  // Version 1: Randomize directly from sequence
  {{ name }}_sequence_item
  req = {{ name }}_sequence_item::type_id::create("req");
  start_item(req);
  if ( !req.randomize() ) begin
    `uvm_error(get_type_name(), "Failed to randomize transaction")
  end
  finish_item(req);

  // Version 2: Randomize inline from virtual sequence task
  // start_item(m_trans);
  // finish_item(m_trans);
endtask : body

`endif // {{ name | upper }}_SEQUENCE_BASE_SV
