package lab_2
import chisel3._
import chisel3.util._
class LM_IO_Interface extends Bundle {
    val s0 = Input ( Bool () )
    val s1 = Input ( Bool () )
    val s2 = Input ( Bool () )
    val out = Output (UInt (32.W))
}
class Task1 extends Module {
    val io = IO (new LM_IO_Interface )

    //Start code here 

    val select = Cat (io.s2,io.s1,io.s0)
    def opCode_BEQ = BitPat("b1??")
   io.out := MuxCase(1.U, Array(
        (select === opCode_BEQ )-> 32.U,
        (select === "b000".U) -> 0.U,
        (select === "b001".U) -> 8.U,
        (select === "b010".U) -> 16.U,
        (select === "b011".U) -> 24.U
    ) )

    //End your code here 
}
