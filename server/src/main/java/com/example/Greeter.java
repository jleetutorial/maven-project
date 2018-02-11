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

  /**
  * @prama someone the name
  * @return greeting string
  */
  public final String greet(final String someone) {
    return String.format("Hello, %s!", someone);
  }
}
