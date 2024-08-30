package LAB6
import chisel3._
import chisel3.util._

class My_Queue extends Module {
    val io = IO (new Bundle {
    val in = Flipped (Decoupled(UInt (8 .W))) 
    val out = Decoupled ( UInt (8. W ) ) 

})
val queue = Queue (io.in , 5) 
val q1 = Queue (queue, 5)
io.out <> q1
}
