
class test extends uvm_test;
`uvm_component_utils(test)
	
	sequence1 seq;
	env e;

	function new(string name="test",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		seq=sequence1::type_id::create("seq");
		e=env::type_id::create("e",this);
	endfunction

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		seq.start(e.a.seqr);
		phase.drop_objection(this);
	endtask

endclass
