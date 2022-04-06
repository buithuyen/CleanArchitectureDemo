import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func handle(input: Input) -> Output
}
