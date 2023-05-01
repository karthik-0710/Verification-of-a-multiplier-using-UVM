
class driver extends uvm_driver #(transaction);
`uvm_component_utils(driver)
transaction trans;
virtual add_if aif;

	function new(string name="driver",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		trans=transaction::type_id::create("trans");
		if(!uvm_config_db #(virtual add_if)::get(this,"","aif",aif)) // uvm_test_top.env.agent.drv
		`uvm_error("driver","unable to access config_db");
	endfunction

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		forever begin 
			seq_item_port.get_next_item(trans);
			aif.a<=trans.a;
			aif.b<=trans.b;
			`uvm_info("driver",$sformatf("a=%0d,b=%0d",trans.a,trans.b),UVM_NONE);
			seq_item_port.item_done();
			#10;				
		end
		phase.drop_objection(this);
	endtask	
endclass
