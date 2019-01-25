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

/** @param someone name of someone
 *  @return greeting string
 */

  public final String greet(final String someone, final int day) {
    return String.format("Hello, %s!", someone + " Day: ", day);
  }
}
