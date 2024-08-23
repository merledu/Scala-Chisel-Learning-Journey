package LAB6
import chisel3._
import chisel3.util._

class ParalleloadSReg (val len : Int =1) extends Module {
    val io = IO (new Bundle {
        val out = Vec ( len , Output ( Bool () ) )
        val load_in = Vec ( len , Input ( Bool () ) )
        val in = Input ( Bool () )
        val load = Input ( Bool () )
})
io.out(0) := Mux(io.load, io.load_in(0), io.in)
io.out(1) := Mux(io.load, io.load_in(1), io.out(0))
io.out(2) := Mux(io.load, io.load_in(2), io.out(1))

}