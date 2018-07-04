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
	 * @param someone
	 * @return
	 */
	public String greet(String someone) {
		return String.format("Hello, welcome %s!", someone);
	}
}
