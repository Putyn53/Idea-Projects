package com.springexample.springfast;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BinarySearchImpl
{
    public BinarySearchImpl(SortAlgorithm sortAlgorithm) {
        this.sortAlgorithm = sortAlgorithm;
    }

    private SortAlgorithm sortAlgorithm;
    //Sorting an array
    //Search the array
    //return the result
    public int binarySearch(int[] numbers, int numberToSearchFor)
    {
        int [] sorted = this.sortAlgorithm.sort(numbers);
        return 3;
    }

}
