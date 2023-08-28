package ClassTasks


import chisel3._
import chisel3.util._

class TxModule extends Module {
  val io = IO(new Bundle {
    val tx = Input(Bool())
    val ready = Input(Bool())
    val valid = Output(Bool())
    val data = Output(UInt(4.W))
  })

  val idle :: txState :: validState :: Nil = Enum(3)

  val currentState = RegInit(idle)
val readyI = RegInit(0.B)
  readyI := io.ready
io.valid := io.tx
  io.data := 0.U
  switch(currentState) {
    is(idle) {
      when(reset.asBool()) {
        currentState := idle
      }.otherwise {
        currentState := txState
      }
    }
    is(txState) {
      when(io.tx) {
        currentState := validState
        io.valid := true.B
      }
    }
    is(validState) {
      //      when(io.tx || io.busy) {
      //        currentState := txState
      //      }
      // Transfer
      when(readyI && io.valid) {
        io.data := 10.U
        currentState := txState

      }
//      io.valid := false.B
    }
  }
}
