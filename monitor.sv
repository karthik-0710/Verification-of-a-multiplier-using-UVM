
class monitor extends uvm_monitor #(transaction);
`uvm_component_utils(monitor)
transaction trans;
virtual add_if aif;

uvm_analysis_port #(transaction) send;
	
	function new(string name="monitor",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		trans=transaction::type_id::create("trans");
		send=new("send",this);
		if(!uvm_config_db #(virtual add_if)::get(this,"","aif",aif)) //uvm_test_top.e.a.mon
		`uvm_error("Monitor","unable to access interface")
	endfunction

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);		
		forever begin
		#10;
		trans.a=aif.a;
		trans.b=aif.b;
		trans.mul=aif.mul;
	  	`uvm_info("Monitor",$sformatf("a=%0d,b=%0d,mul=%0d",trans.a,trans.b,trans.mul),UVM_NONE)
		send.write(trans);
		end
		phase.drop_objection(this);
	endtask



endclass
