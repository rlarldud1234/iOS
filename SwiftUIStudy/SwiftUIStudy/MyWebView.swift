//
//  MyWebView.swift
//  SwiftUIStudy
//
//  Created by 김기영 on 2021/10/01.
//

import SwiftUI
import WebKit


// uikit의 uiView를 사용할 수 있게 한다.
struct MyWebVIew: UIViewRepresentable {
    @State
    var urlToLoad: String
    
    //Ui view 그리기
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹 뷰 인스턴스 생성
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebVIew>) {
        
    }
    //update ui view
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View{
        MyWebVIew(urlToLoad: "https://www.naver.com")    }
}
