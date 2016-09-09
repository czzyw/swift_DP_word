//
//  main.swift
//  swift_sf
//
//  Created by 程志志 on 16/9/3.
//  Copyright © 2016年 程志志. All rights reserved.
//

import Foundation


func wordDistance(wordA:String,_ wordB:String)->Int{
    let aChars = [Character](wordA.characters)
    let bChars = [Character](wordB.characters)
    let aLen = aChars.count
    let bLen = bChars.count
    
    var dp = Array(count:aLen + 1,repeatedValue:(Array(count:bLen + 1,repeatedValue:0)))
    
    for i in 0...aLen{
        for j in 0...bLen {
            //
            if i == 0{
                dp[i][j] = j
            }
            else if j==0{
                dp[i][j]=i
            }
            else if aChars[i-1] == bChars[j-1]{
                dp[i][j] = dp[i-1][j-1]
            }
            else{
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j],dp[i][j-1]) + 1
            }
            
        }
    }
    
    return dp[aLen][bLen]
}

print("Hello, World!")

print(wordDistance("p", "x"))

