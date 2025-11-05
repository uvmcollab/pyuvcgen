`ifndef TOP_TEST_VSEQ_SV
`define TOP_TEST_VSEQ_SV

class top_test_vseq extends uvm_sequence;

  `uvm_object_utils(top_test_vseq)
  `uvm_declare_p_sequencer(top_vsqr)

  //int unsigned  m_iter = 100;
  //spi_uvc_mode_e m_mode = SPI_UVC_MODE_0;

  extern function new(string name = "");

  extern task pre_start();
  extern function string signature();
  extern task {{ name }}_seq();
  extern task body();

endclass : top_test_vseq


function top_test_vseq::new(string name = "");
  super.new(name);
endfunction : new


task top_test_vseq::pre_start();
  // Variables
	// uvm_bitstream_t config_value;
  // string config_str;

  // Configuration for m_iter from config DB, use +uvm_set_config_int=*,m_iter,<value>
  // if (!uvm_config_db#(uvm_bitstream_t)::get(m_sequencer, "", "m_iter", config_value)) begin
  //   `uvm_info(get_type_name(), $sformatf("\nUsing default m_iter value %0d", m_iter), UVM_MEDIUM)
  // end else begin
  //   m_iter = config_value;
  //   `uvm_info(get_type_name(), $sformatf("\nm_iter set to %0d from config DB", m_iter), UVM_MEDIUM)
  // end
  
  // Configuration for m_mode from config DB, use +uvm_set_config_string=*,m_mode,<value>
  // if (!uvm_config_db#(string)::get(m_sequencer, "", "m_mode", config_str)) begin
  //   `uvm_info(get_type_name(), $sformatf("\nUsing default m_mode value %s", m_mode), UVM_MEDIUM)
  // end else begin
  //   `uvm_info(get_type_name(), $sformatf("\nm_mode set to %s from config DB", m_mode), UVM_MEDIUM)
  // end
endtask : pre_start


function string top_test_vseq::signature();
  string s = "";
  $sformat(s, {s, "\n"});
  $sformat(s, {s, "\n", " ##=============================================================================="});
  $sformat(s, {s, "\n", " ##===============================   SIGNATURE   ================================"});
  $sformat(s, {s, "\n", " ##=============================================================================="});
  $sformat(s, {s, "\n", " ## [Test]          top_test_vseq"});
  $sformat(s, {s, "\n", " ## [Project]       {{ name }}"});
  $sformat(s, {s, "\n", " ## [Author]        Ciro Bermudez"});
  $sformat(s, {s, "\n", " ## [Description]   Default test to be override by specific tests"});
  $sformat(s, {s, "\n", " ## [Status]        devel"});
  $sformat(s, {s, "\n", " ##=============================================================================="});
  $sformat(s, {s, "\n"});
  return s;
endfunction : signature


task top_test_vseq::{{ name }}_seq();
  // Write your sequence here
  // {{ name }}_sequence_base seq;
  // seq = {{ name }}_sequence_base::type_id::create("seq");
  // if (!seq.randomize()) begin
  //   `uvm_fatal(get_name(), "Failed to randomize sequence")
  // end
  // seq.start(p_sequencer.m_{{ vsqr_seq_name }}_sequencer);
endtask : {{ name }}_seq


task top_test_vseq::body();
  // Initial delay
  #(2000ns);

  // Main sequence
  repeat(10) begin
    {{ name }}_seq();
  end

  // Signature
  `uvm_info(get_type_name(), signature(), UVM_MEDIUM)

  // Drain time
  #(20000ns);
endtask : body

`endif // TOP_TEST_VSEQ_SV