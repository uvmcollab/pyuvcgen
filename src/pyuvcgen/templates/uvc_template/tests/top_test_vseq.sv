`ifndef TOP_TEST_VSEQ_SV
`define TOP_TEST_VSEQ_SV

class top_test_vseq extends uvm_sequence;

  `uvm_object_utils(top_test_vseq)
  `uvm_declare_p_sequencer(top_vsqr)

  extern function new(string name = "");

  extern task {{ name }}_seq();
  extern task body();

endclass : top_test_vseq


function top_test_vseq::new(string name = "");
  super.new(name);
endfunction : new


task top_test_vseq::{{ name }}_seq();
  // Write your sequence here
  // {{ name }}_sequence_base seq;
  // seq = {{ name }}_sequence_base::type_id::create("seq");
  // if (!seq.randomize()) begin
  //   `uvm_fatal(get_name(), "Failed to randomize sequence")
  // end
  // seq.start(p_sequencer.m_{{ vsqr_seq_name }}_sequencer)
endtask : {{ name }}_seq


task top_test_vseq::body();
  fork
    {{ name }}_seq();
  join
endtask : body

`endif // TOP_TEST_VSEQ_SV