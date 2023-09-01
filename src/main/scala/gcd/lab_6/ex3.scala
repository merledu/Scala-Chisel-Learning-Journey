package lab_6
import chisel3 . _
import chisel3 . util . _

  class twoshot extends Module {
    val io = IO(new Bundle {
      //val relode = Input(Bool())
      val din = Input(UInt(4.W))
      val out = Output(UInt(4.W))
    })


    val timer_count = RegInit(0.U(8.W))
    val shots_remaining = RegInit(2.U(2.W)) // Initialize to 2 for a two-shot counter
    val done = timer_count === 0.U
    val next = RegInit(0.U)

    when(done) {
      next := io.din
      shots_remaining := 2.U
    }.elsewhen(!done && shots_remaining > 0.U) {
      next := timer_count - 1.U
    }.elsewhen(!done){
      shots_remaining := shots_remaining - 1.U
    }
    io.out := timer_count

    timer_count := next
  }