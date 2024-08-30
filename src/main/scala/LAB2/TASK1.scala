package LAB2
import chisel3._
import chisel3.util._

class TASK1 extends Module{
    val io = IO (new Bundle {
        val in0 = Input(Bool())
        val in1 = Input(Bool())
        val in2 = Input(Bool())
        val in3 = Input(Bool())
        val in4 = Input(Bool())
        val sel = Input(UInt(3.W))
        val out = Output(Bool())
})
    io.out := MuxCase (false .B ,Array(
    (io.sel === "b000".U) -> 0.U,
    (io.sel === "b001".U) -> 8.U,
    (io.sel === "b010".U) -> 16.U,
    (io.sel === "b011".U) -> 24.U,
    (io.sel === "b111".U) -> 32.U)
    )
}
