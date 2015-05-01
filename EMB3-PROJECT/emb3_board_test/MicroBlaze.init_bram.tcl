cd /home/moro/Apuntes/Emb3/vga_pong/EMB3-PROJECT/emb3_board_test/MicroBlaze
if { [ catch { xload xmp MicroBlaze.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
