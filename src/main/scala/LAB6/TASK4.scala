package LAB6
import chisel3._
import chisel3.util._

class UDCounter ( val max : Int = 10) extends Module {
    val io = IO (new Bundle {
    val out = Output ( UInt ( log2Ceil ( max ) . W ) )
    val up_down = Input ( Bool () )
})
val count = RegInit(0.U(4.W))
val f = RegInit(0.U)
io.out := 0.B
when (count =/= max.asUInt && io.up_down === 1.B && f === 0.U){
    count := count + 1.U
}
.elsewhen(count === max.U){
    f := 1.U 
    count := count - 1.U
}
.elsewhen (count === 0.U){
    f := 1.U
}
.elsewhen(f === 1.U){
    count := count - 1.U
}
}