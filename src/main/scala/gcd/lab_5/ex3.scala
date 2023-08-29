package lab_5
import chisel3._
import chisel3.util._

// class definition with function as parameter
class Operator [ T <:Data ]( n : Int , generic : T ) ( op : (T , T ) =>T ) extends Module {
  require ( n > 0) // " reduce only works on non - empty Vecs "
  val io = IO (new Bundle {
    val in = Input ( Vec (n , generic ) )
    val out = Output  ( Vec (n , generic ) )
  })
  val outputVec = Wire(Vec(n, generic))

  for (i <- 0 until n) {
    // Apply the 'op' function element-wise
    outputVec(i) := (io.in.reduce(op))
  }
  io.out := outputVec
}

// Implement addition operation
object UserOperator1 extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new Operator(2, UInt
  (16.W))(_+_)))
}

// Implement AND operation
object UserOperator2 extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new Operator(3, UInt
  (8.W))(_&_)))
}