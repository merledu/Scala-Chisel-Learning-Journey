package LAB2
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class Barrel_shiftTest extends FreeSpec with ChiselScalatestTester{
    "TASK 2" in {
        test(new Barrel_shift){ c =>
            c.io.in(0).poke(0.B)
            c.io.in(1).poke(1.B)
            c.io.in(2).poke(0.B)
            c.io.in(3).poke(1.B)          
            c.io.shift_type.poke(1.B)
            c.clock.step(10)
            c.io.sel(0).poke(1.B)
            c.io.sel(1).poke(0.B)
            c.io.out(0).expect(1.B)
            c.io.out(1).expect(0.B)
            c.io.out(2).expect(1.B)
            c.io.out(3).expect(0.B)
            
            
        }
    }
}