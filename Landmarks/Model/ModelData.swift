//
//  ModelData.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

// 加载本地 JSON 数据
import Foundation

var landmarks: [LandMark] = load("landmarkData.json")

// 范型<T: Decodable>，不返回指定类型，使用更宽泛，也可返回其他模型
// https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html，讲述了 swift 引入的 opaque type
// https://zhuanlan.zhihu.com/p/140483376 opaque type 和范型区别
// Generic 让调用者决定参数或者返回值的类型；Opaque Type 是让方法本身决定返回的类型
func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    // guard 类似于 if，不过 guard 总有 else 伴随
    // https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html，搜索 guard
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("无\(fileName)文件")
    }
    
    // 如果不加 try catch，编译器会提醒
    // Swift 中处理错误的方法有四种
    // 1. throws 用于函数，表明要抛出错误，配合 guard 使用，有错误时可以立刻抛出。调用时，需要用 do-catch、try?、try!、或者继续传递给调用者
    // 2. do-catch 用于代码块，在 do 中抛出错误，并匹配 catch，抛出指定错误。如果 catch 有 condition， 最后要使用 catch 兜底错误情况，否则调用方也需要兜底，不然会有运行时错误。
    // 3. 可选值，使用 try? 处理会抛出一场的函数，如果抛出异常，则返回 nil
    // 4. try!，确定不会抛出异常，可使用。
    // https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html，搜索 Do-Catch
    do {
        try data = Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    let decoder = JSONDecoder()
    do {
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
