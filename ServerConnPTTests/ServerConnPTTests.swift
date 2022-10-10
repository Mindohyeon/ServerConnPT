//
//  ServerConnPTTests.swift
//  ServerConnPTTests
//
//  Created by 민도현 on 2022/10/06.
//

import XCTest
@testable import ServerConnPT

final class ServerConnPTTests: XCTestCase {
    
    var sut: SignUpValidator!

    //정의
    override func setUpWithError() throws {
        sut = SignUpValidator()
    }

    //해제
    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
    }
    
    func testSignUpValidator_whenValidEmailProvided_shouldReturnFalsej() {
        
        let user = SignUpModel(email: "", password: "")
        
        let isValidEmail = sut.isValidEmail(email: user.email)
        
        XCTAssertTrue(isValidEmail, "이메일 칸이 비어있으면 안됨")
    }
    
    func testSignUpValidator_whenValidPasswordPrivided_shouldReturnFalse() {
        
        let user = SignUpModel(email: "", password: "")
        
        let isValidPassword = sut.isValidPassword(password: user.password)
        
        XCTAssertTrue(isValidPassword, "비밀번호 칸이 비어있으면 안됨")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
