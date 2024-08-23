package practice
import chisel3._

class MUX extends Module{
    val io = IO(new Bundle{
        val s = Input(UInt(3.W))
        val a = Input(UInt(4.W))
        val b = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    when (io.s === 0.U){
        io.out := io.a + io.b
    }
     .elsewhen (io.s === 1.U){
        io.out := io.a - io.b
    }
     .elsewhen (io.s === 2.U){
        io.out := io.a | io.b
    }
     .elsewhen (io.s === 3.U){
        io.out := io.a & io.b
    }
    .elsewhen (io.s === 4.U){
        io.out := io.a ^ io.b
    }
    .otherwise{
        io.out := -(io.a ^  io.b)
    }

}
