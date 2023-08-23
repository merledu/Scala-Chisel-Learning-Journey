package ClassTasks


import chisel3._
import chisel3.util._

class Tx extends Module {
  val io = IO(new Bundle {
    val tx = Input(Bool())
    val readyin = Input(Bool())
    val valido = Output(Bool())
    val datao = Output(UInt(4.W))
  })

  val State = RegInit(UInt(2.W))




}

class Rx extends Module{
  val io = IO (new Bundle{
    val validi = Input(Bool())
    val datai = Input(UInt(4.W))
    val busy = Input (Bool())
    val readyo = Output(Bool())
  })
}

class Main extends Module{
  val io = IO ( new Bundle {
    val busyin = Input(Bool())
    val txin = Input(Bool())
  })



}