// Up - down counter example
package lab_6
import chisel3 . _
import chisel3 . util . _
class up_down_counter ( val max : Int = 10) extends Module {
  val io = IO (new Bundle {
    val out = Output ( UInt ( log2Ceil ( max ) . W ) )
    val up_down = Input ( Bool () )
  })

  var counter = RegInit(0.U(max.W))
  // val max_count = RegInit (6.U ( n.W ) )
  val flag = RegInit(1.U)
  //dontTouch(flag)

  when(counter =/= max.asUInt && io.up_down === 1.B && flag === 1.U) {
    counter := counter + 1.U
  }.elsewhen(counter === max.asUInt) {
    counter := counter - 1.U
    flag := 0.U
  }.elsewhen(counter === 0.U) {
    flag := 1.U
  }.elsewhen(flag === 1.U) {
    counter := counter - 1.U
  }
  io.out := counter
  // End your code here

}
