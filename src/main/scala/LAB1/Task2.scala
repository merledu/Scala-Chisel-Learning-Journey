package LAB1
import chisel3._
import chisel3.stage.ChiselStage

class counter_up_down(n:Int) extends Module {
    val io = IO (new Bundle {
       val out = Output ( Bool() )
})

val counter = RegInit (0.U (n.W) )
val max_count = RegInit (5.U (n.W) )
var f = RegInit(0.U)
   io.out := 0.B
dontTouch(counter)
when (counter =/= max_count && f === 0.U) {
     counter === counter + 1.U
}
.elsewhen( counter === max_count){
    f === 1.U
       counter === counter - 1.U
       io.out := 1.B
}
.elsewhen (counter === 0.U){
    f := 0.U
    counter === counter + 1.U
    io.out := 0.B
}
}