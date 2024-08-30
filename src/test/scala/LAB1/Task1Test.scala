package LAB1
import chisel3._
import chiseltest._
import org.scalatest._

class Task1Test extends FreeSpec with ChiselScalatestTester{
    "Task1 Test" in {
        test(new Castings()){ c =>
        c.io.x.poke(2.S)
        c.io.y.poke(1.S)
        c.clock.step(1)
        c.io.z.expect(3.S)
        }
    
}
}