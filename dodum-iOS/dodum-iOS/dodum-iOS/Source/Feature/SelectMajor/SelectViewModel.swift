//
//  SelectVeiwModel.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

class SelectViewModel : ObservableObject{
    @Published var select_questions: [SelectModel] = [
        
    ]
    @Published var subjective_question : [SubjectiveModel] = [
        SubjectiveModel(num: 1, title: "yaho", input: "")
    ]
    
    @Published var select_map = [
        "서버, 네트워크, 데이터 흐름 같은 보이지 않는 부분이 흥미롭다.",
            "디버깅과 문제 원인 분석 과정이 즐겁다.",
            "혼자 깊이 몰입해 시스템 구조를 설계하는 것을 좋아한다.",
             "앱/웹의 외형보다 내부 로직(알고리즘, 아키텍처)에 더 관심이 간다.",
             "코드 효율성을 높이는 최적화 작업에 만족감을 느낀다.",
             "안정적인 시스템을 설계하고, 장애가 없도록 유지하는 데 관심이 많다.",
             "완벽하게 테스트된 코드를 선호하고, 예상치 못한 에러가 싫다.",
             "서버 로깅, 모니터링, 배포 자동화 같은 작업에 흥미가 있다.",
             "트래픽 급증 상황에서 병목 현상을 해결하는 상상을 자주 한다.",
             "API 문서 작성 및 버전 관리에 신경 쓰는 편이다.",
             "눈에 보이는 결과(UI/UX)가 바로 나오면 더 동기부여가 된다.",
             "사용자 경험(UX)을 개선하는 작업이 재미있다.",
             "빠르게 프로토타입을 만들어 시각적으로 확인하며 개선하는 것을 좋아한다.",
             "색상, 레이아웃, 디자인 디테일을 다듬는 데 시간을 쓰는 편이다.",
             "웹/모바일 화면이 반응형으로 잘 동작할 때 만족감을 느낀다.",
             "코드보다는 결과물이 얼마나 보기 좋은지가 더 중요하다.",
             "새로운 UI 프레임워크나 라이브러리를 시도해 보는 것을 좋아한다.",
             "다른 사람에게 내가 만든 화면을 보여주고 피드백 받는 걸 즐긴다.",
             "인터랙션(애니메이션, 트랜지션 등)으로 사용자 경험을 풍부하게 만드는 데 흥미가 있다.",
             "사용자가 편리하게 느끼는 UI를 만드는 것을 최우선으로 생각한다.",
             "데이터 수집/정리/분석 과정이 재밌다.",
             "직관적으로 시각화된 데이터를 보면 이해가 빠르다.",
             "수많은 로그를 분석해서 패턴을 찾는 것을 좋아한다.",
             "숫자로 성과를 측정하고 최적화하는 것에 관심이 있다.",
             "통계적 가설 검증을 통해 결론을 내리는 과정이 재밌다.",
             "데이터 시각화 대시보드를 설계하는 것에 흥미가 있다.",
             "문제 해결 시 '데이터로 증명'하려는 습관이 있다.",
             "데이터 전처리, ETL 같은 반복 작업도 견딜 수 있다.",
             "데이터 품질(정확성, 결측치, 이상치)을 꼼꼼히 점검하는 편이다.",
             "SQL, Pandas 같은 툴을 능숙하게 다루고 싶다.",
             "인공지능, 머신러닝 같은 지능형 시스템에 흥미가 있다.",
             "추천 시스템이나 챗봇 같은 AI 서비스를 만들고 싶다.",
             "데이터를 학습시켜 모델이 점점 똑똑해지는 과정을 보면 재미있다.",
             "AI 모델의 정확도를 높이기 위해 하이퍼파라미터 튜닝을 해보고 싶다.",
             "새로운 AI 논문이나 모델 아키텍처를 읽는 것을 시도해 보고 싶다.",
             "AI 윤리 문제(편향, 공정성, 개인정보)에도 관심이 있다.",
             "오픈소스 모델을 fine-tuning 해서 내 서비스에 적용하고 싶다.",
             "AI 모델의 추론 속도 최적화에도 흥미가 있다.",
             "데이터셋을 직접 만들어보고 싶다.",
             "AI 기능을 서비스에 실시간으로 적용하는 걸 상상하면 설렌다."
    ]
    @Published var subjective_map = [
        "A": "최근에 해결했던 가장 복잡한 기술적 문제는 무엇이었나요? 해결 과정도 설명해주세요.",
        "B": "사용자에게 더 편리한 화면을 만들기 위해 했던 시도나 고민을 적어주세요.",
        "C": "데이터 기반으로 의사결정을 내린 경험이 있다면 어떤 상황이었나요?",
        "D": "AI/ML을 활용한 아이디어가 있다면 구체적으로 적어주세요.",
        "E": "협업 시 본인이 가장 중요하게 생각하는 가치는 무엇인가요?"
    ]
    @Published var selectedArray : [Int] = []
    
//    func generateQuestions() {
//            // 객관식 18개 랜덤 선택
//            let selectedQuestions = question_map.shuffled().prefix(18)
//            questions = selectedQuestions.enumerated().map { index, title in
//                SelectModel(title: title, number: index + 1, selected: .none)
//            }
//            
//            // 주관식 2개 랜덤 선택
//            let selectedSubjectives = subjective_map.values.shuffled().prefix(2)
//            subjectives = selectedSubjectives.map { title in
//                Subjective(title: title, input: "")
//            }
//        }
    
    func GenerateSelect() {
        let select = select_map.shuffled().prefix(18)
        select_questions = select.enumerated().map { index, title in
            SelectModel(title: title, num: index + 1)
        }
    }
//    func GenerateSubjective() {
//        let subjective = subjective_map.shuffled().prefix(2)
//        subjective_question = subjective.enumerated().map { index, title in
//                SubjectiveModel(num: <#T##Int#>, title: <#T##String#>, input: <#T##String#>)
//        }
//    }
    
}
