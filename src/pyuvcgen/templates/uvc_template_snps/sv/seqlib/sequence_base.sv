`ifndef {{ name | upper }}_SEQUENCE_BASE_SV
`define {{ name | upper }}_SEQUENCE_BASE_SV

class {{ name }}_sequence_base extends uvm_sequence #({{ name }}_sequence_item);

  `uvm_object_utils({{ name }}_sequence_base)

  extern function new(string name = "");

  extern virtual task body();

endclass : {{ name }}_sequence_base


function {{ name }}_sequence_base::new(string name = "");
  super.new(name);
endfunction : new


task {{ name }}_sequence_base::body();
    req = {{ name }}_sequence_item::type_id::create("req");
    start_item(req);
    if ( !req.randomize() ) begin
      `uvm_error(get_type_name(), "Failed to randomize transaction")
    end
    finish_item(req);
endtask : body

`endif // {{ name | upper }}_SEQUENCE_BASE_SV
