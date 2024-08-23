package LAB4
import chisel3._
import chisel3.util._

class LM_IO_Interface_BranchControl extends Bundle {
    val fnct3 = Input (UInt(4.W))
    val branch = Input (Bool())
    val x = Input (UInt(32.W))
    val y = Input (UInt(32.W))
    val out = Output (Bool())
}
object Br{
    val Br_beq = 0.U(4.W)
    val Br_bne = 1.U(4.W)
    val Br_blt = 2.U(4.W)
    val Br_bge = 3.U(4.W)
}
import Br._
class BranchControl extends Module {
    val io = IO (new LM_IO_Interface_BranchControl)
    io.out := 0.B
    when (io.branch === 1.B) {
        switch(io.fnct3){
            is (Br_beq){
              io.out := io.x === io.y  
            }
            is (Br_bne){
              io.out := io.x =/= io.y  
            }
            is (Br_blt){
              io.out := io.x <= io.y  
            }
            is (Br_bge){
              io.out := io.x >= io.y  
            }
        }
    }
    .otherwise{
        io.out := 0.U
    }
}
            