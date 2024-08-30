package Pipelining

import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class controlTest extends FreeSpec with ChiselScalatestTester{
    "module1" in{
        test (new Control){ c =>
         c.io.opcode.poke("b0110011".U)
         c.clock.step(1)
         c.io.memwrite.expect(0.B)
         c.io.branch.expect(0.B)
         c.io.memRead.expect(0.B)
         c.io.regWrite.expect(1.B)
         c.io.memtoReg.expect(0.B)
         c.io.aLUoperation.expect(0.U)
         c.io.operand_A_sel.expect(0.U)
         c.io.operand_B_sel.expect(0.B)
         c.io.extend_sel.expect(0.U)
         c.io.next_pc_sel.expect(0.U)
        }
    }
}