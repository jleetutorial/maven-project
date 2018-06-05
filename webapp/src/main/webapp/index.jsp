Hello, 
For many projects the beginning of "work" in the Pipeline would be the "build" stage. Typically this stage of the Pipeline
will be where source code is assembled, compiled, or packaged. The Jenkinsfile is not a replacement for an existing build
tool such as GNU/Make, Maven, Gradle, etc, but rather can be viewed as a glue layer to bind the multiple phases of a project’s
development lifecycle (build, test, deploy, etc) together. Jenkins has a number of plugins for invoking practically any build
tool in general use, but this example will simply invoke make from a shell step (sh). The sh step assumes the system is Unix/Linux-based,
for Windows-based systems the bat could be used instead.