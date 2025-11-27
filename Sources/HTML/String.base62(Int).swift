//internal let base62Characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
//internal let base62Length = base62Characters.count
//
//extension String {
//    public static func base62(length: Int) -> String {
//        var result = ""
//        var generator = SystemRandomNumberGenerator()
//        for _ in 0..<length {
//            let randomIndex = Int.random(in: 0..<base62Length, using: &generator)
//            let randomCharacter = base62Characters[
//                base62Characters.index(base62Characters.startIndex, offsetBy: randomIndex)
//            ]
//            result.append(randomCharacter)
//        }
//        return result
//    }
//}
