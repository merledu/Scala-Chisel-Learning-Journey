package lab_5
import chisel3._
import chisel3.util._
//import chisel3 . iotesters .{ ChiselFlatSpec , Driver , PeekPokeTester }


// your code for Transaction_in class
class datapakbundle [ T <: Data ]( gen : T ) extends Bundle{
  val data = Input(gen)
  val address = Input(UInt(10.W))
}
// your code for Transaction_out class


class Router [ T <: Data ]( gen : T ) extends Module {
  val io = IO(new Bundle{
    val in  = Input(new datapakbundle(gen))
    val out  = Output(new datapakbundle(gen))
  })

  io.out := io.in
}
