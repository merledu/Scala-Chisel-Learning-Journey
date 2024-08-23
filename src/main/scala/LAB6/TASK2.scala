package LAB6
import chisel3._
import chisel3.util._
class COUNTX ( val max : Int = 1) extends Module {
    val io = IO (new Bundle {
    val out = Output (UInt (4.W))
})
val countx = RegInit (2.U (4.W))
io.out := countx
when (countx (3) ^ max.B){
    countx := countx + 1.U
}
.otherwise {
    countx := 0.U
}
}