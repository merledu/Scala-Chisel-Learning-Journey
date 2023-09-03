package lab_6
import chisel3 . _
import chisel3 . util . _
class shift_reg_with_parallel_load (val len : Int =2) extends Module {
  val io = IO (new Bundle {
    val out = Vec(len, Output(Bool()))
    val load_in = Vec(len, Input(Bool()))
    val in = Input(Bool())
    val load = Input(Bool())
  })

  val shfitreg = RegInit(0.U(len.W))
  io.out := shfitreg.asBools()

  when (io.load === 1.B){
    shfitreg := Cat(io.load_in.reverse)
  }
    .otherwise{
      val nextState = ( shfitreg << 1).asUInt() | io.in.asUInt()
      shfitreg := nextState
      io.out := shfitreg.asBools()
    }

}
