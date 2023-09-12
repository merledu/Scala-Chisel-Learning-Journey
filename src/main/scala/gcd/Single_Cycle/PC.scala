package Single_Cycle
import chisel3 . _
import chisel3 . util . _


class PC extends Module {
  val io = IO(new Bundle {
    val branched = Input(SInt(32.W))
    val nextaddr = Output(SInt(32.W))

  })
  val counter = RegInit(0.S(32.W))

    io.nextaddr := counter
    counter := io.branched



}
