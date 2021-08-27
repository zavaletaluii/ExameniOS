//
//  Models.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import Foundation

// MARK: - CommentsPostResponse
struct CommentsPostResponse: Codable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Codable {
    let text: String
    let percetnage: Int
}
