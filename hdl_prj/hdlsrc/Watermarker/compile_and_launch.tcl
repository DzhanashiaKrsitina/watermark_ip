proc vsimulink {args} {
  lappend sllibarg -foreign \{simlinkserver \{C:/Program Files/MATLAB/R2022a/toolbox/edalink/extensions/modelsim/windows64/liblfmhdls_gcc450vc12.dll\}
  if {[catch {lsearch -exact $args -socket} idx]==0  && $idx >= 0} {
    set socket [lindex $args [expr {$idx + 1}]]
    set args [lreplace $args $idx [expr {$idx + 1}]]
    append socketarg " \; -socket " "$socket"
    lappend sllibarg $socketarg
  }
  set runmode "GUI"
  if { $runmode == "Batch" || $runmode == "Batch with Xterm"} {
    lappend sllibarg " \; -batch"
  }
  lappend sllibarg \}
  set args [linsert $args 0 vsim]
  lappend args [join $sllibarg]
  uplevel 1 [join $args]
}
proc vsimmatlab {args} {
  lappend mllibarg -foreign \{matlabclient \{C:/Program Files/MATLAB/R2022a/toolbox/edalink/extensions/modelsim/windows64/liblfmhdlc_gcc450vc12.dll\}
  lappend mllibarg \}
  lappend mlinput 
  lappend mlinput [join $args]
  lappend mlinput [join $mllibarg]
   set mlinput [linsert $mlinput 0 vsim]
  uplevel 1 [join $mlinput]
}
proc wrapverilog {args} {

  error "wrapverilog has been removed. HDL Verifier now supports Verilog models directly, without requiring a VHDL wrapper."}

proc vsimmatlabsysobj {args} {
  lappend sllibarg -foreign \{matlabsysobjserver \{C:/Program Files/MATLAB/R2022a/toolbox/edalink/extensions/modelsim/windows64/liblfmhdls_gcc450vc12.dll\}
  if {[catch {lsearch -exact $args -socket} idx]==0  && $idx >= 0} {
    set socket [lindex $args [expr {$idx + 1}]]
    set args [lreplace $args $idx [expr {$idx + 1}]]
    append socketarg " \; -socket " "$socket"
    lappend sllibarg $socketarg
  }
  set runmode "GUI"
  if { $runmode == "Batch" || $runmode == "Batch with Xterm"} {
    lappend sllibarg " \; -batch"
  }
  lappend sllibarg \}
  set args [linsert $args 0 vsim]
  lappend args [join $sllibarg]
  uplevel 1 [join $args]
}
vlib work
vcom Bit_Divider_Inner.vhd
vcom Bit_Divider_Outer.vhd
vcom Index_Definer.vhd
vcom ROM_Template_0.vhd
vcom ROM_Template_1.vhd
vcom SimpleDualPortRAM_singlebit.vhd
vcom Indexing.vhd
vcom watermarking.vhd
vsimulink -coverage -voptargs=+acc  work.watermarking
add wave  /watermarking/clk
add wave  /watermarking/rstx
add wave  /watermarking/clk_enable
add wave  /watermarking/pixel_in
add wave  /watermarking/mes_in
add wave  /watermarking/ce_out
add wave  /watermarking/pixel_out
set UserTimeUnit ns
puts ""
puts "Ready for cosimulation..."

