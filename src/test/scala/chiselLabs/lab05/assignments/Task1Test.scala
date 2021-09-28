package chiselLabs.lab05.assignments

import chisel3._ 
import chiseltest._
import org.scalatest._ 

import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation

class Task1Test extends FreeSpec with ChiselScalatestTester {
    "Lab 05 - Adder Test" in {
        test(new Adder(32)).withAnnotations(Seq(VerilatorBackendAnnotation)){ c =>
            c.io.in0.poke(3.U)
            c.io.in1.poke(5.U)
            c.clock.step(1)
            c.io.sum.expect(8.U)
        }
    }
}