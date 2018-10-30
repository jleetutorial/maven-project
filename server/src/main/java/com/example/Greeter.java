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
   * Returns a message greeting someone.
   * @param someone The name of the person to whom the greeting is directed.
   * @return The greeting message.
   */
  public final String greet(final String someone) {
    return String.format("Hello, %s!", someone);
  }
}
