package Single_Cycle

import chisel3._
import chisel3.util._


class BranchALU extends Module {
  val io = IO(new Bundle {
    val in_A = Input(UInt(32.W))
    val in_B = Input(UInt(32.W))
    val fun3 = Input(UInt(4.W))
    val doBranch = Output(Bool())
    val isBtype = Input(Bool())
  })
  val Beq = io.in_A === io.in_B
  val blt = io.in_A < io.in_B
  val bgeu = io.in_A.asUInt() >= io.in_B.asUInt()
  val bltu = io.in_A.asUInt() < io.in_B.asUInt()

  when(io.isBtype === 1.B) {
    io.doBranch := Mux(io.fun3 === 0.U, Beq,
      Mux(io.fun3 === 1.U, !Beq,
        Mux(io.fun3 === (4.U), blt,
          Mux(io.fun3 === (5.U), (!blt || Beq),
            Mux(io.fun3 === (6.U), bltu,
              Mux(io.fun3 === (7.U), bgeu, 0.B))))))

  }
    .otherwise{
      io.doBranch :=0.B
    }

}
