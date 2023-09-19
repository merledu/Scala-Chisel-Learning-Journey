package Single_Cycle
import chisel3 . _
import chisel3 . util . _
import chisel3 . util . experimental . loadMemoryFromFile
import scala . io .Source._


class InstMem ( initFile : String ) extends Module {
  val io = IO (new Bundle{
    val addr = Input(UInt(32.W))
    val inst = Output(UInt(32.W))
  } )

  val imem = Mem ( 1024, UInt( 32.W ) )
  loadMemoryFromFile ( imem , initFile )
  io . inst := imem ( io . addr>>2)
}
