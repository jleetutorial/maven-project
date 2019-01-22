# maven-project
Source code for James Lee's Jenkins course.

Check out our Latest DevOps PDF book.

https://www.level-up.one/devops-pdf-book

-----------------------------------------------

Maven pom.xml file =>
Describe the software project being built, including -
- The dependencies on other external modules
- The directory structures
- The required plugins
- The predefined targets for performing certain tasks such as compilation and packaging

Different phases in Maven Build Lifecycle -
- validate = Validate the project is correct and all necessary information is available
- compile = Compile the source code of the project
- test = Test the compiled source code using a suitable unit testing framework
- package = Take the compiled code and package it in its distributable format
- verify = Run any chacks on results of integration tests to ensure quality criteria are met
- install = Install the package into the local repository, for use as a dependency in other projects locally
- deploy = Copy the final package to the remote repository for sharing with other developers and projects
