package LAB1
import chisel3._
import chisel3.stage.ChiselStage

class MSBCounter ( counterBits : UInt ) extends Module{
    val io = IO (new Bundle {
        val result = Output(Bool()) 
    })
    val max = (0.U << counterBits) - 1.U
    val count = RegInit(0.U(4.W))

    when (count(3) === 1.B){
        count := 0.U
    }
    .otherwise {
        count := count + 1.U
    }
    io.result := count (3)

}