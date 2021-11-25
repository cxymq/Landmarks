//
//  ModelData.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

// 加载本地 JSON 数据

import Foundation
/// Combine：函数响应框架，为处理随着时间变化的值的一种声明式框架。Combine 作用是将异步事件通过组合事件处理操作符进行自定义处理。关注如何处理变化的值，正是响应式编程的核心。
///Combine可以概述为一种声明式的函数响应式编程。https://blog.csdn.net/ctrip_tech/article/details/109375619
import Combine

// An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
final class ModelData: ObservableObject {
    // 发布者，将数据变化发送给订阅者
    @Published var landmarks: [LandMark] = load("landmarkData.json")
    
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default
    
    // 通过 category 进行分组
    var categories: [String: [LandMark]] {
        Dictionary (
            grouping: landmarks) { landmark in
                landmark.category.rawValue
            }
        // 官网示例（尾随闭包简写）
//        Dictionary (grouping: landmarks) { $0.category.rawValue }
    }
    
    var features: [LandMark] {
        landmarks.filter { landmark in
            landmark.isFeatured
        }
        
        // 官网示例（尾随闭包简写
//        landmarks.filter { $0.isFeatured }
    }
}


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
