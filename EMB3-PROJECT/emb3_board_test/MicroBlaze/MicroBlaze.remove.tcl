cd /home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze
if { [ catch { xload xmp MicroBlaze.xmp } result ] } {
  exit 10
}
xset intstyle default
save proj
exit 0
