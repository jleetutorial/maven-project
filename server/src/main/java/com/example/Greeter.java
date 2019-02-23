package com.example;
import org.apache.log4j.Logger;

/**
 * This is a class.
 */
public class Greeter {
  /**
   * This is a constructor.
   */
  static Logger logger = Logger.getLogger(Greeter.class);
  public Greeter() {
  }
  /**
   * @param someone the name of a person
   * @return greeting string
   */
  public final String greet(final String someone) {
    return String.format("Hello, %s!", someone);
    logger.debug("This is debug message");
    logger.info("This is info message");
  }
}
