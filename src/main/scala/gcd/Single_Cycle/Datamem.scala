package Single_Cycle

import chisel3 . _
import chisel3 . util . _
class Datamem extends Module {
  val io = IO(new Bundle {
    val Wen = Input(Bool())
    val addr = Input(UInt(32.W))
    val datain = Input(SInt(32.W))
    val dataout = Output(SInt(32.W))
    val fun3 = Input(UInt(3.W))
  })

  val memory = SyncReadMem(1024, Vec(4, SInt(8.W)))
  val mask = Wire(Vec(4, Bool()))
  val tempstore = Wire(Vec(4, SInt(8.W)))
  val tempread = Wire(Vec(4, SInt(8.W)))

  io.dataout := 0.S

  tempstore(0) := io.datain(7, 0).asSInt()
  tempstore(1) := io.datain(15, 8).asSInt()
  tempstore(2) := io.datain(23, 16).asSInt()
  tempstore(3) := io.datain(31, 24).asSInt()

  mask(0) := 0.B
  mask(1) := 0.B
  mask(2) := 0.B
  mask(3) := 0.B

  when(io.Wen) {
    when(io.fun3 === 0.U) { //SB
      when(io.addr(1, 0) === 0.U) {
        mask(0) := 1.B
        mask(1) := 0.B
        mask(2) := 0.B
        mask(3) := 0.B
      }.elsewhen(io.addr(1, 0) === 1.U) {
        mask(0) := 0.B
        mask(1) := 1.B
        mask(2) := 0.B
        mask(3) := 0.B

        tempstore(1) := io.datain(7, 0).asSInt()


      }.elsewhen(io.addr(1, 0) === 2.U) {
        mask(0) := 0.B
        mask(1) := 0.B
        mask(2) := 1.B
        mask(3) := 0.B

        tempstore(2) := io.datain(7, 0).asSInt()


      }.elsewhen(io.addr(1, 0) === 3.U) {
        mask(0) := 0.B
        mask(1) := 0.B
        mask(2) := 0.B
        mask(3) := 1.B

        tempstore(3) := io.datain(7, 0).asSInt()
      }

    }
      .elsewhen(io.fun3 === 1.U) { // SH
        when(io.addr(1, 0) === 0.U) {
          mask(0) := 1.B
          mask(1) := 1.B
          mask(2) := 0.B
          mask(3) := 0.B

        }.elsewhen(io.addr(1, 0) === 1.U) {
          mask(0) := 0.B
          mask(1) := 1.B
          mask(2) := 1.B
          mask(3) := 0.B

          tempstore(1) := io.datain(7, 0).asSInt()
          tempstore(2) := io.datain(15, 8).asSInt()


        }.elsewhen(io.addr(1, 0) === 2.U) {
          mask(0) := 0.B
          mask(1) := 0.B
          mask(2) := 1.B
          mask(3) := 1.B

          tempstore(2) := io.datain(7, 0).asSInt()
          tempstore(3) := io.datain(15, 8).asSInt()


        }.elsewhen(io.addr(1, 0) === 3.U) {
          mask(0) := 0.B
          mask(1) := 0.B
          mask(2) := 0.B
          mask(3) := 1.B

          tempstore(3) := io.datain(7, 0).asSInt()
        }

      }
      .elsewhen(io.fun3 === 2.U) { // SW
        mask(0) := 1.B
        mask(1) := 1.B
        mask(2) := 1.B
        mask(3) := 1.B

      }

    memory.write(io.addr(31, 2), tempstore, mask)
    tempread := memory.read(io.addr(31, 2), 1.B)
    //io.dataout := Cat(tempread(3), tempread(2), tempread(1), tempread(0)).asSInt()

  }
  tempread := memory.read(io.addr(31, 2), 1.B)
  when(io.fun3 === 0.U) {
    io.dataout := Cat(Fill(24, tempread(0)(7)), tempread(0)).asSInt()
  }.elsewhen(io.fun3 === 1.U) {
    io.dataout := Cat(Fill(16, tempread(1)(7)), tempread(1), tempread(0)).asSInt()
  }.elsewhen(io.fun3 === 2.U) {
    io.dataout := Cat(tempread(3), tempread(2), tempread(1), tempread(0)).asSInt()
  }
}

