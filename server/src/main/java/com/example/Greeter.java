package com.example;

/**
 * This is a class.
 */
public class Greeter {

  /**
   * This is a constructor.
   */
  public Greeter() {

  }

  //TODO: Add javadoc comment
  public String greet(String someone) {
    return String.format("Hello, %s!", someone);
  }

//TODO: Add javadoc comment
  public String fairwell(String someone) {
    return String.format("Goodbye, %s!", someone);
  }
}
