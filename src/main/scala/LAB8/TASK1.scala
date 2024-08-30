package LAB8
import chisel3._
import chisel3.util._

class Memory_assignment extends Module {
    val io = IO (new Bundle {
        val memory_out = Vec (4 , Output (UInt (32.W)))
        val requestor = Vec (4 , Flipped (Decoupled(UInt(32.W))))
        val Readaddr = Input (UInt (5.W))
        val Writeaddr = Input (UInt (5.W))
    })
val arb_priority = Module (new Arbiter (UInt() ,4))
val mem = SyncReadMem (1024 , Vec(4,UInt (32.W)))

val queue0 = Queue (io.requestor(0)) 
val queue1 = Queue (io.requestor(1)) 
val queue2 = Queue (io.requestor(2)) 
val queue3 = Queue (io.requestor(3)) 

arb_priority.io.in(0) <> queue0
arb_priority.io.in(1) <> queue1
arb_priority.io.in(2) <> queue2
arb_priority.io.in(3) <> queue3

arb_priority.io.out.ready := 1.B

val data = Reg(Vec(4,UInt(32.W)))

when(io.requestor(0).valid === 1.B){
    data(0) := arb_priority.io.out.bits
    data(1) := 0.U
    data(2) := 0.U
    data(3) := 0.U
    mem.write (io.Writeaddr, data)
}
.elsewhen(io.requestor(1).valid === 1.B){
    data(0) := 0.U
    data(1) := arb_priority.io.out.bits
    data(2) := 0.U
    data(3) := 0.U
    mem.write (io.Writeaddr, data)
}
.elsewhen(io.requestor(2).valid === 1.B){
    data(0) := 0.U
    data(1) := 0.U
    data(2) := arb_priority.io.out.bits
    data(3) := 0.U
    mem.write (io.Writeaddr, data)
}
.elsewhen(io.requestor(3).valid === 1.B){
    data(0) := 0.U
    data(1) := 0.U
    data(2) := 0.U
    data(3) := arb_priority.io.out.bits
    mem.write (io.Writeaddr, data)
}
io.memory_out := mem.read(io.Readaddr)
}