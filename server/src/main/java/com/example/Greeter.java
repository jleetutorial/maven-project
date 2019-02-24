package com.example;
/**
 * This is a class.
 */
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
public class Greeter {
  /**
   * This is a constructor.
   */
  static Logger logger = LogManager.getLogger(Greeter.class);
  public Greeter() {
    logger.debug("This is debug message");
    logger.info("This is info message");
    logger.warn("This is warn message");
    logger.fatal("This is fatal message");
    logger.error("This is error message");
    System.out.println("Logic executed successfully....");
  }
  /**
   * @param someone the name of a person
   * @return greeting string
   */
  public final String greet(final String someone) {
    return String.format("Hello, %s!", someone);
  }
}
