package com.example;

import java.util.Arrays;
import java.util.Scanner;

public class Sorting {
    public static void main(String[] args) {
        int [] myArray = new int[5];
        Scanner scanner = new Scanner(System.in);
        for(int i = 0; i < 5; ++i) {
            myArray[i] = scanner.nextInt();
        }
        Arrays.sort(myArray);
        for(Integer element : myArray) {
            System.out.print(element + ", ");
        }
    }
}
