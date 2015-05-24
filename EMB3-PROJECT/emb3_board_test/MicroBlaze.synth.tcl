proc pnsynth {} {
  cd /home/moro/Apuntes/Electronics/vga_pong/EMB3-PROJECT/emb3_board_test/MicroBlaze
  if { [ catch { xload xmp MicroBlaze.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
