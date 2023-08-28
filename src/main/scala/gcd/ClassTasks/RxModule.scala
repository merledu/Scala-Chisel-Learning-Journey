package ClassTasks


import chisel3._
import chisel3.util._



class RxModule extends Module{
  val io = IO (new Bundle{
    val valid = Input(Bool())
    val data = Input(UInt(4.W))
    val busy = Input (Bool())
    val ready = Output(Bool())
  })

when (!io.busy){
  io.ready := true.B
}
  .otherwise{
    io.ready := false.B
  }
}