package LAB6
import chisel3._
import chisel3.util._

class SREG ( val init : Int = 1) extends Module {
    val io = IO (new Bundle {
        val in = Input (UInt(4.W))
        val out = Output(Bool())
})
    io.out := 0.B
    val state = RegInit (0.U(4.W)) 
    val f =  RegInit (0.U(4.W))

    when(f === 0.U){
        f := 1.U
        state := io.in
    }otherwise{
        io.out := state(0)
        state := state >> 1 
    }
}