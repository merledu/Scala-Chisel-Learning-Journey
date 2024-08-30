package LAB2
import chisel3 . _
import chisel3.util._

class Mux_2to1_IO extends Bundle {
    val in_A = Input(UInt(32.W))
    val in_B = Input(UInt(32.W))
    val sel = Input(Bool())
    val out = Output(UInt())
}
class Mux_2to1 extends Module {
    val io = IO (new Mux_2to1_IO)
    io.out := io.in_A & ~Fill(32, io.sel.asUInt) | io.in_B & Fill(32, io.sel.asUInt)
}