package Single_Cycle
import chisel3 . _
import chisel3 . util . _


class PC extends Module {
  val io = IO(new Bundle {
    val nextaddr = Output(UInt(32.W))

  })
  val counter = RegInit(0.U(32.W))


    counter := counter + 4.U
    io.nextaddr := counter


}
