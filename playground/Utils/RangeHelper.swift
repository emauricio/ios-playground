//
//  Magnitude.swift
//  playground
//
//  Created by Efren Mauricio on 2021/03/07.
//

import Foundation

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double> where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let hight = ranges.lazy.map { $0.upperBound }.max()!
    return low..<hight
}
