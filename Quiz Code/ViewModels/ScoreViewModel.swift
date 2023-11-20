//
//  ScoreViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-11-20.
//

import Combine
class ScoreViewModel: ObservableObject {
    @Published var scoreRepo = ScoreRepository.shared
    @Published var scoreList = [Score]()
    private var cancellables: Set<AnyCancellable> = []
    init(){
        self.scoreRepo.$list
            .assign(to: \.scoreList, on: self)
            .store(in: &cancellables)
    }
    func addScore(score:Score){
        scoreRepo.add(score)
    }
    func deleteScore(score: Score){
        scoreRepo.delete(score)
    }
    
}
