package com.example;
/**
 * This is a class test for Jenkins
 */
public class Greeter {

  /**
   * This is a constructor.
   */
  public Greeter() {

  }
/**
  * @param someone the name of the person
  * @return greeting string
  */
  public final String greet(final String someone) {
    return String.format("Hello, %s!", someone);
  }
}
