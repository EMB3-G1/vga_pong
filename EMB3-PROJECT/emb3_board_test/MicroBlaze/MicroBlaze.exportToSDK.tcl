proc exportToSDK {} {
  cd /home/moro/Apuntes/Electronics/vga_pong/EMB3-PROJECT/emb3_board_test/MicroBlaze
  if { [ catch { xload xmp MicroBlaze.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

exit $result
