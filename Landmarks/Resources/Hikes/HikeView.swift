/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // 系统定义过渡
//        AnyTransition.slide
        // move 过渡
//        AnyTransition.move(edge: .trailing)
        // 复合过渡
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    // 使按钮和 detail 都拥有动画
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                    // 用来取消旋转动画
//                        .animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                    // 缩放动画
//                        .animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                // 过渡动画
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
