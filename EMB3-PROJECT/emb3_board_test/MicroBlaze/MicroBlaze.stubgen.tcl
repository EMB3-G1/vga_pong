cd /home/moro/Apuntes/Emb3/vga_pong/EMB3-PROJECT/emb3_board_test/MicroBlaze/
if { [ catch { xload xmp MicroBlaze.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0
