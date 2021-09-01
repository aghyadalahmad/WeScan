//
//  File.swift
//  
//
//  Created by Aghyad Alahmad on 01/09/2021.
//
import UIKit

class Logger: NSObject {
    static let sharedInstance: Logger = Logger()
    
    private override init() { }

    
    var originalPoints = "";
    var redefinedPoints = "";
    
    func format(topLeft: CGPoint, topRight: CGPoint, bottomRight: CGPoint, bottomLeft: CGPoint) -> String {
        let p1A:[Int] = [Int(topLeft.x), Int(topLeft.y)]
        let p2A:[Int] = [Int(topRight.x), Int(topRight.y)]
        let p3A:[Int] = [Int(bottomRight.x), Int(bottomRight.y)]
        let p4A:[Int] = [Int(bottomLeft.x), Int(bottomLeft.y)]
        
        var allPoints = [[Int]]();
        
        allPoints.append(p1A)
        allPoints.append(p2A)
        allPoints.append(p3A)
        allPoints.append(p4A)
        
        
        return json(from: allPoints) ?? ""

    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
