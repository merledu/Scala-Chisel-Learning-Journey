package LAB2
import chisel3._
import chisel3.util._

class Barrel_shift extends Module {
    val io = IO (new Bundle {
        val in = Vec (4 , Input (Bool () ) )
        val sel = Vec (2 , Input ( Bool () ) )
        val shift_type = Input ( Bool () )
        val out = Vec (4 , Output (Bool()))
})
val select = Cat(io.sel(1), io.sel(0)).asUInt
io.out(0) := MuxCase(false.B,Array(
    (select === 0.U)  -> io.in(0),
    (select === 1.U) -> io.in(1),
    (select === 2.U) -> io.in(2),
    (select === 3.U) -> io.in(3)
))
io.out(1):= MuxCase(false.B, Array(
    (select === 0.U) -> io.in(1),
    (select === 1.U) -> io.in(2),
    (select === 2.U) -> io.in(3),
    (select === 3.U) -> Mux(io.shift_type, io.in(0), 0.U) 
))
io.out(2):= MuxCase(false.B, Array(        
    (select === 0.U) -> io.in(2),
    (select === 1.U) -> io.in(3),
    (select === 2.U) -> Mux(io.shift_type, io.in(0), 0.U) ,
    (select === 3.U) -> Mux(io.shift_type,io.in(1),0.U)
))
io.out(3):=MuxCase(false.B,Array(
    (select === 0.U) -> io.in(3),
    (select === 1.U) -> Mux(io.shift_type, io.in(0), 0.U) ,
    (select === 2.U) -> Mux(io.shift_type,io.in(1),0.U),
    (select === 3.U)  -> Mux(io.shift_type,io.in(2),0.U)
))
}
