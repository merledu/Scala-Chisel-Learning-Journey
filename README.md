Scala Chisel Learning Journey
=======================

[![Join the chat at https://gitter.im/merledu/scala-chisel-learning-journey](https://badges.gitter.im/merledu/scala-chisel-learning-journey.svg)](https://gitter.im/merledu/scala-chisel-learning-journey?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


Start by setting up the working enviroment

### Dependencies

#### JDK 8 or newer

```bash
sudo apt-get install openjdk-11-jdk
sudo apt-get install openjdk-11-jre
```
#### SBT 

SBT is the most common built tool in the Scala community. You can download it [here](https://www.scala-sbt.org/download.html).  

#### VERILATOR
```bash
sudo apt-get install verilator
```

### How to get started

Fork this repository on your own individual profiles. After forking clone the repository and run:

```sh
sbt test
```

You should see a whole bunch of output that ends with something like the following lines
```
[info] Tests: succeeded 1, failed 0, canceled 0, ignored 0, pending 0
[info] All tests passed.
[success] Total time: 5 s, completed Dec 16, 2020 12:18:44 PM
```
If you see the above then...

### It worked!

You are ready to go. Next step is to go inside the `docs/` folder where you will find the labs to perform.

### For quick debugging
If you quickly want to see what verilog is being generated, go to this link  https://bit.ly/3u3zr0e and write Chisel here.
