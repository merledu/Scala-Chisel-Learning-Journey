package LAB3
import chisel3._
import chisel3.util._

class LM_IO_Interface_BranchControl extends Bundle {
    val fnct3 = Input (UInt(3.W))
    val branch = Input (Bool())
    val arg_x = Input (UInt(32.W))
    val arg_y = Input (UInt(32.W))
    val br_taken = Output (Bool())
}
class BranchControl extends Module {
    val io = IO (new LM_IO_Interface_BranchControl)
    when (io.branch === 1.B) {
        when (io.fnct3 === 1.U){
            io.br_taken := io.arg_x === io.arg_y
        }
        .elsewhen (io.fnct3 === 2.U){
            io.br_taken := io.arg_x =/= io.arg_y
        }
        .elsewhen (io.fnct3 === 3.U){
            io.br_taken := io.arg_x < io.arg_y
        }
        .elsewhen (io.fnct3 === 4.U){
            io.br_taken := io.arg_x > io.arg_y
        }
        .elsewhen (io.fnct3 === 5.U){
            io.br_taken := io.arg_x <= io.arg_y
        }
        .elsewhen (io.fnct3 === 6.U){
            io.br_taken := io.arg_x >= io.arg_y
        }
        .otherwise{
            io.br_taken := 0.B
        }
    
}
    .otherwise{
        io.br_taken := 0.B
    }
}