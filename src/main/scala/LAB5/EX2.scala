package LAB5
import chisel3._
import chisel3.util._

class eMux [T <: Data ](gen : T) extends Bundle {
    val out = Output(gen)
    val in1 = Input(gen)
    val in2 = Input(gen)
    val sel = Input(Bool())
}
class AMux [T <: Data](gen : T) extends Module {
    val io = IO (new eMux(gen) )
        io.out := Mux2_to_1 (io.in1 , io.in2 , io.sel)

    def Mux2_to_1 [T <: Data](in_0 :T, in_1 :T, sel : Bool) :T = {
        Mux(sel , in_1 , in_0)
    }
}
