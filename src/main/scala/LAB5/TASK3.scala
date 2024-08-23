package LAB5
import chisel3._

class MUX3 [T <: Data ](gen : T) extends Module {
    val io = IO (new Bundle{
        val out = Output(gen)
        val in1 = Input(gen)
        val in2 = Input(Bool())
        val sel = Input(Bool())
    })
    io.out := Mux2_to_1 (io.in1 , io.in2 , io.sel)

    def Mux2_to_1 [T <: Data](in_0 :T, in_1 :T, sel : Bool) :T = {
        Mux(sel , in_1 , in_0)
    }
}