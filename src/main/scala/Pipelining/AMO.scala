package Pipelining

import chisel3._
import chisel3.util._

class AtomicOperations extends Module {
    val io = IO(new Bundle {
<<<<<<< HEAD
        //val addr = Input(UInt(32.W))
=======
        val addr = Input(UInt(32.W))
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
        val DataIn = Input(SInt(32.W))
        val DataIn2 = Input(SInt(32.W))
        val atomic_op = Input(UInt(4.W))  
        val DataOut = Output(SInt(32.W))
        val execute = Input(Bool()) 
    })

    // val storedValue = RegInit(0.S(32.W))
    val newValue = WireInit(0.S)

    when(io.execute) {
        // dataMemory.io.mem_read := true.B
        // storedValue := dataMemory.io.DataOut
        switch(io.atomic_op) {
            is(0.U) { // AMOSWAP.W
<<<<<<< HEAD
                newValue := io.DataIn2
=======
                newValue := io.DataIn 
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
            }
            is(1.U) { // AMOADD.W
                newValue := io.DataIn + io.DataIn2
            }
            is(2.U) { // AMOAND.W
                newValue := io.DataIn & io.DataIn2
            }
            is(3.U) { // AMOOR.W
                newValue := io.DataIn | io.DataIn2
            }
            is(4.U) { // AMOXOR.W
                newValue := io.DataIn ^ io.DataIn2
            }
            is(5.U) { // AMOMAX.W
                newValue := Mux(io.DataIn > io.DataIn2, io.DataIn, io.DataIn2)
            }
            is(6.U) { // AMOMIN.W
                newValue := Mux(io.DataIn < io.DataIn2, io.DataIn, io.DataIn2)
            }
            is(7.U) { // AMOMAXU.W
                newValue := Mux(io.DataIn.asUInt > io.DataIn2.asUInt, io.DataIn, io.DataIn2)
            }
            is(8.U) { // AMOMINU.W
                newValue := Mux(io.DataIn.asUInt < io.DataIn2.asUInt, io.DataIn, io.DataIn2)
            }
        }
        // dataMemory.io.DataIn := newValue
        // dataMemory.io.mem_write := true.B 
    }

    // Output the final result after operation
    io.DataOut := newValue
}

