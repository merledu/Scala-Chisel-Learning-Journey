package lab_2
import chisel3._
import chisel3.util._

class task2 extends Module {
    val io = IO(new Bundle {
        val in: Vec[Bool] = Vec(4, Input(Bool()))
        val sel = Vec(2, Input(Bool()))
        val shift_type = Input(Bool())
        val out = Vec(4, Output(Bool()))
    })
    val select: UInt = Cat(io.sel(1), io.sel(0))

    val zero: Bool = 0.B

    io.out(0) := MuxLookup(select, false.B, Array(
        (0.U) -> io.in(0),
        (1.U) -> io.in(1),
        (2.U) -> io.in(2),
        (3.U) -> io.in(3))
    )
    io.out(1) := MuxLookup(select,false.B, Array(
        (0.U) -> io.in(1),
        (1.U) -> io.in(2),
        (2.U) -> io.in(3),
        (3.U) -> Mux(io.shift_type ,io.in(0) ,0.B)
    )
    )
    io.out(2) := MuxLookup(select, false.B, Array(
        (0.U) -> io.in(2),
        (1.U) -> io.in(3),
        (2.U) -> Mux(io.shift_type , io.in(0) , 0.B),
        (3.U) -> Mux(io.shift_type , io.in(1) , 0.B )
    )
    )
    io.out(3) := MuxLookup(select , false.B , Array(
        (0.U) -> io.in(3),
        (1.U) -> Mux(io.shift_type , io.in(0) , 0.B),
        (2.U) -> Mux(io.shift_type , io.in(1) , 0.B ),
        (3.U) -> Mux(io.shift_type , io.in(2) , 0.B )
    ))
    //changes





}

