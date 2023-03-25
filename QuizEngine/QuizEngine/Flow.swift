//
//  Flow.swift
//  QuizEngine
//
//  Created by Alvarez de Lorenzana, Guillermo on 25/3/23.
//

import Foundation

protocol Router {
    func routeTo(question: String)
}

class Flow {
    let router: Router
    let questions: [String]
    
    init(router: Router, questions: [String]) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        
        if let question = questions.first {
            router.routeTo(question: question)
        }
    }
}
