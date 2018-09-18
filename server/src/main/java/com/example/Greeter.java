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
   * @param someone the string
   * @return string formated string
   */
  public final String greet(final String someone) {
    if ((list == null) && (list.size() == 0)) {     
      return null;
    }
    return String.format("Hello, %s!", someone);
  }



  
  
}




