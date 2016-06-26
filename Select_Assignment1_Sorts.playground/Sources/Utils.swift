import Foundation

public class Utils {
    public static func swap(inout firstVariable: Int, inout lastVariable: Int) {
        let temp = firstVariable
        firstVariable = lastVariable
        lastVariable = temp
    }
}