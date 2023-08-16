package lab_3
import chisel3 . _
import chisel3 . util . _
class LM_IO_Interface_BranchControl extends Bundle {
  val fnct3 = Input ( UInt (3.W ) )
  val branch = Input ( Bool () )
  val arg_x = Input ( UInt (32.W ) )
  val arg_y = Input ( UInt (32.W ) )
  val br_taken = Output ( Bool () )
}
class Ltask1 extends Module {
  val io = IO (new LM_IO_Interface_BranchControl )

  io.br_taken := MuxLookup(io.fnct3 , false.B , Array(
    ("b000".U) -> (io.branch && (io.arg_x.asSInt() === io.arg_y.asSInt())),
    ("b001".U) -> (io.branch && (io.arg_x.asSInt() =/= io.arg_y.asSInt())),
    ("b100".U) -> (io.branch && (io.arg_x.asSInt() < io.arg_y.asSInt())),
    ("b101".U) -> (io.branch && (io.arg_x.asSInt() >= io.arg_y.asSInt())),
    ("b110".U) -> (io.branch && (io.arg_x < io.arg_y)),
    ("b101".U) -> (io.branch && (io.arg_x>= io.arg_y))
  ))
  }

