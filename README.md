Scala Chisel Learning Journey
=======================
[![Gitter](https://badges.gitter.im/Learning-Journey-MERL/CHSEL-FP-SCALA.svg)](https://gitter.im/Learning-Journey-MERL/CHSEL-FP-SCALA?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


Start by setting up the working enviroment

### Dependencies

#### JDK 8 or newer

We recommend LTS releases Java 8 and Java 11. You can install the JDK as recommended by your operating system, or use the prebuilt binaries from [AdoptOpenJDK](https://adoptopenjdk.net/).

#### SBT 

SBT is the most common built tool in the Scala community. You can download it [here](https://www.scala-sbt.org/download.html).  


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
