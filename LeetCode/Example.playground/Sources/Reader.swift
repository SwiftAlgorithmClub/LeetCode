import Foundation

var PLAYGROUND_FEATURE = true

public func readInt(x: Int = 0) -> Int {
    if PLAYGROUND_FEATURE {
        return x
    } else {
        return Int(readLine()!)!
    }
}

public func readChar(x: Character = Character("")) -> Character {
    if PLAYGROUND_FEATURE {
        return x
    } else {
        return readLine()!.first!
    }
}

public func readString(str: String = "") -> String {
    if PLAYGROUND_FEATURE {
        return str
    } else {
        return readLine()!
    }
}
