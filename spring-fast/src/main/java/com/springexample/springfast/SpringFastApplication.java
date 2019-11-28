package com.springexample.springfast;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringFastApplication
{

	public static void main(String[] args)
	{

		BinarySearchImpl binarySearch = new BinarySearchImpl(new BubbleSortAlgorithm());
		int result = binarySearch.binarySearch(new int [] {12, 4, 5}, 3);
		System.out.println(result);
		SpringApplication.run(SpringFastApplication.class, args);
	}

}
