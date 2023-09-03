package lab_6

import chisel3 . _
import chisel3 . util . _

class shift_register ( val init : Int = 0) extends Module {
  val io = IO (new Bundle {
    val in = Input ( UInt (4.W ))
    val out = Output ( UInt (4.W ) )
  })
  val state = RegInit ( init.U (4.W ) ) // register initialization
  // serial data in at LSB
  val nextState = ( state << 4).asUInt() | io.in.asUInt()

  state := nextState
  io.out := state
}