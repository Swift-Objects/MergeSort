//
//  ViewController.swift
//  MergeSort
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//  递归数组排序

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mergeSort([7, 2, 6, 3, 9]))
        print(mergeSort(["e", "u", "d", "j", "k", "o", "a", "x"]))
        
    }
    
    // 1. 分解
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
         guard array.count > 1 else { return array }
         let middleIndex = array.count / 2
         let leftArray = mergeSort(Array(array[0..<middleIndex]))
         let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
         
         // here
         return merge(leftArray, rightArray)
    }
    
    // 2. 排序
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIdex = 0
        
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIdex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIdex]
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if (leftElement > rightElement) {
                orderedArray.append(rightElement)
                rightIdex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIdex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIdex < right.count {
            orderedArray.append(right[rightIdex])
            rightIdex += 1
        }
        
        return orderedArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

