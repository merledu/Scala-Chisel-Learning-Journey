package LAB1
import chisel3._
import chisel3.stage.ChiselStage

class MaxCounter (size: Int, maxValue: Int) extends Module{
    val io = IO(new Bundle{
        val result = Output(Bool())
   
    })
     val maxValue1 = maxValue
    def genCounter (n: Int , max : Int ) = {
        val count = RegInit(0.U(n.W))
        val max1 = max.asUInt
        when (count === max1) {
            count := 0.U
        }
        .otherwise{
            count := count + 1.U
        }
        count
    }
    val Counter1 = genCounter(size, maxValue1)
    io.result := Counter1(size -1)
}
