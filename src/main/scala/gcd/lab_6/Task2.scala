package lab_6
import chisel3 . _
import chisel3 . util . _

class counter_with_xor ( val max : Int) extends Module {
  val io = IO (new Bundle {
    val out = Output ( UInt (( log2Ceil ( max ) . W ) ) )
  })
  val counter = RegInit(0.U( log2Ceil ( max ) . W ) )
  val countbuffer = Mux(counter( (log2Ceil(max) -1 )) ^ 1.B ,counter + 1.U ,0.U )
  counter := countbuffer
  io.out := counter
// Start Coding here
  // End your code here
}
