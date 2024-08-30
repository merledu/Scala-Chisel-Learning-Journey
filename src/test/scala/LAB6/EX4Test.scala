package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class My_QueueTest extends FreeSpec with ChiselScalatestTester{
    "EX4Test" in{
        test(new My_Queue){c =>
            c.io.in.bits.poke(4.U)
            c.io.in.valid.poke(1.B)
            c.clock.step(5)
            c.io.out.bits.expect(4.U)
        }
    }
}

 class timer () extends Module {
    val io = IO (new Bundle {
        val out = Output ( Bool() )
        val out1 = Output ( Bool() )
})
val timer_count = RegInit (0.U (4.W ) )
val value = RegInit (4.U (4.W ) )

val timer_count1 = RegInit (0.U (4.W ) )
val value1 = RegInit (4.U (4.W ) )

val f = RegInit(0.U)
val f1 = RegInit(0.U)

io.out := 0.B
io.out1 := 0.B
dontTouch(timer_count)

when (timer_count =/= value && f === 0.U) {
      timer_count := timer_count + 1.U
}.elsewhen(timer_count === value) {
      f := 1.U
      timer_count := timer_count - 1.U
}.elsewhen(timer_count === 0.U) {
      f := 0.U
      io.out := 1.B
}.elsewhen(f === 1.U) {
      timer_count := timer_count - 1.U
      io.out := 0.B
}

when (timer_count1 =/= value1 && f1 === 0.U) {
      timer_count1 := timer_count1 + 1.U
}.elsewhen(timer_count1 === value1) {
      f1 := 1.U
      timer_count1 := timer_count1 - 1.U
}.elsewhen(timer_count1 === 0.U) {
      f1 := 0.U
      io.out1 := 1.B
}.elsewhen(f1 === 1.U) {
      timer_count1 := timer_count1 - 1.U
      io.out1 := 0.B
}}