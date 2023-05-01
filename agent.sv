
class agent extends uvm_agent;
`uvm_component_utils(agent)
monitor m;
driver d;
//sequence1 s;

uvm_sequencer #(transaction) seqr;

	function new(string name="agent",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//s=sequence1::type_id::create("s");
		m=monitor::type_id::create("m",this);
		d=driver::type_id::create("d",this);
		//seqr=new("seqr",this);
		seqr=uvm_sequencer#(transaction)::type_id::create("seqr",this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		d.seq_item_port.connect(seqr.seq_item_export);
	endfunction
endclass
