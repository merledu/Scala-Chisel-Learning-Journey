package LAB1
import chisel3._
import chisel3.stage.ChiselStage

class Counter ( counterBits : UInt ) extends Module {
  val io = IO (new Bundle {
    val result = Output ( Bool () )
  })
  val max = (1.S << counterBits) - 1.S
  val count = RegInit (1.S (16.W ) )
  // val count1 = count.asSInt 
  // val max1 = max.asSInt
  when ( count === max ) {
    count := 1.S
  }
  .otherwise {
    count := count + 1.S
  }
  io.result := count (0)  
}