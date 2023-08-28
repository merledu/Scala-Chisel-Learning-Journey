package ClassTasks


import chisel3._
import chisel3.util._


class Main extends Module{
  val io = IO ( new Bundle {
    val busy = Input(Bool())
    val tx = Input(Bool())
    val data = Output(UInt(4.W))
  })

  val rxmodule = Module(new RxModule)
  val txmodule = Module(new TxModule)

  txmodule.io.tx := io.tx
  rxmodule.io.busy := io.busy

  rxmodule.io.valid := txmodule.io.valid
  rxmodule.io.data := txmodule.io.data
  txmodule.io.ready := rxmodule.io.ready

  io.data := txmodule.io.data



}