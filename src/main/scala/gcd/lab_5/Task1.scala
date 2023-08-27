package Lab5

import chisel3._
import chisel3.util._

class Adder(Width: Int) extends Module {
  require(Width >= 0)

  // Define the IO ports
  val io = IO(new Bundle {
    val in0 = Input(UInt(Width.W))
    val in1 = Input(UInt(Width.W))
    val sum = Output(UInt(Width.W))
  })

  // Create the adder logic
  io.sum := io.in0 + io.in1
}