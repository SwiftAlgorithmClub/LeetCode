//
//  ViewController.swift
//  LeetCode
//
//  Created by tskim on 2019/10/26.
//  Copyright © 2019 assin. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Solution().findMinMoves([1,0,5]))
    }
}

class Solution {
    func findMinMoves(_ machines: [Int]) -> Int {
        var total = 0
        
        for clothes in machines {
            total += clothes
        }
        
        if (total % machines.count) != 0 {
            return -1
        }
        
        let avg = total / machines.count
        var maxRunningBalance = 0
        var maxOffLoad = 0
        var runningBalance = 0
        
        for clothes in machines {
             let offload = clothes - avg
            runningBalance += offload;
            maxRunningBalance = max(maxRunningBalance, abs(runningBalance));
            maxOffLoad = max(maxOffLoad, offload);
        }
        
        return max(maxOffLoad, maxRunningBalance)
    }
}


