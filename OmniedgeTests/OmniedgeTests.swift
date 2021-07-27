//
//  OmniedgeTests.swift
//  OmniedgeTests
//
//  Created by samuel.song.bc@gmail.com on 2021/4/22.
//

import XCTest
import NetworkExtension
@testable import Omniedge

class OmniedgeTests: XCTestCase {
    private var engine: PacketTunnelEngine?;
    private var tunnel = PacketTunnelProvider();
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        engine = PacketTunnelEngine.init(provider: tunnel);
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("Omniedge: test done\n");
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        if let e = engine {
            let config = OmniEdgeConfig();
            e.start(config: config);
            
            //tun
            sleep(5);
            print("send tun\n");
            var hello = "hello from tun";
            var data = Data(hello.utf8)
            e.onTunData(data);
            
            #if false
            //udp
            sleep(10);
            print("send udp\n");
            hello = "hello from udp";
            data = Data(hello.utf8);
            e.sendEvent(event: .UDPEvent, data: data);
            
            //mgr
            sleep(10);
            print("send mgr\n");
            hello = "stop";
            data = Data(hello.utf8);
            e.sendEvent(event: .MgrEvent, data: data);
            #endif
            
            sleep(1000);
            print("test over\n");
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
