
class env extends uvm_env;
`uvm_component_utils(env)
scoreboard sc;
agent a;
	
	function new(string name="env",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sc=scoreboard::type_id::create("sc",this);
		a=agent::type_id::create("a",this);	
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		a.m.send.connect(sc.rec);
	endfunction
endclass
