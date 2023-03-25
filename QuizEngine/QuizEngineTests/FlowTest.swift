//
//  QuizEngineTests.swift
//  QuizEngineTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 22/3/23.
//

import XCTest
@testable import QuizEngine

final class FlowTest: XCTestCase {

    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: [])
        
        sut.start()
        
        XCTAssertEqual(router.rouredQuestionCount, 0)
    }
    
    func test_start_withNoQuestions_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Q1"])
        
        sut.start()
        
        XCTAssertEqual(router.rouredQuestionCount, 1)
    }
    
    func test_start_withNoQuestions_routesToCorrectQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Q1"])
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestion, "Q1")
    }
    
    class RouterSpy: Router {
        var rouredQuestionCount: Int = 0
        var routedQuestion: String? = nil
        
        func routeTo(question: String) {
            rouredQuestionCount += 1
            routedQuestion = question
        }
    }
}
