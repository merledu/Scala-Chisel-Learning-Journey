package lab_2

import chisel3._
import chisel3.util._

class MuxLookup extends Module {
val io = IO (new Bundle {
val in0 = Input ( Bool () )
val in1 = Input ( Bool () )
val in2 = Input ( Bool () )
val in3 = Input ( Bool () )
val in4 = Input ( Bool () )
val in5 = Input ( Bool () )
val in6 = Input ( Bool () )
val in7 = Input ( Bool () )
val sel = Input ( UInt (3. W ) )
val out = Output ( Bool () )
})


io . out := MuxLookup ( io.sel(1) , false .B , Array (
    (0.U) -> MuxLookup(io.sel, false.B , Array (
        (0.U) -> io.in0,
        (1.U) -> io.in1,
        (2.U) -> io.in2,
        (3.U) -> io.in3)),
    (1.U) -> (MuxLookup(io.sel(0) , false.B , Array(
        (4.U) -> io.in4,
        (5.U) -> io.in5,
        (6.U) -> io.in6,
        (7.U) -> io.in7,
        )))
    )
)
}
