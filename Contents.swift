import UIKit

///*
//Bài 1, Các ứng dụng mobile thường được đánh số phiên bản kiểu 1.0.1, 1.0.11, tìm hiểu sơ bộ về cách đánh số phiên bản này, và viết một hàm để so sánh 2 phiên bản:
// - Tên hàm checkUpdate
// - Đầu vào currentVersion và version (optional), kiểu String
// - Cố gắng bắt hết các trường hợp có thể xảy ra để hàm chạy trơn tru mọi trường hợp
//
// Test case:
// a, 1.0.0 và 1.0.1
// b, 1.1.0 và 1.0.11
// c, 2.1 và 2.0.9
// d, 1.0.0 và ""
// c, 1.0.0 và nil
// d, 1.0.0.1.0 và 1.0.0.1.1
//
//Bài 2, Bài toán phân tích dữ liệu thông minh không dùng AI. Chúng ta sẽ có nhiều dữ liệu đầu vào dạng [String] như này:
//Mua gạo 200k
//Mua muối 10k
//Đi ăn nướng 500k
//Ăn lẩu 300k
//Uống trà sữa 100k
//Caffee 60k
//Lương 10tr
//Làm thêm 20tr
//Mẹ cho 1tr
//Cho Hoàng mượn 500k
//Cho Cường mượn 600k
//Đi chợ 400k
//Đi siêu thị 900k
//
//Nhiệm vụ của em là khi đưa vào 1 input nào đó, thì phải cho biết đấy là chi tiêu hay là thu nhập. Và sau khi nhập một số testcase vào thì phải tính được tổng thu và chi, số tiền còn lại. Sử dụng print để in một bảng ở đơn giản gồm 3 dòng và 2 cột, kiểu như này:
//——————————————
//| Chi tiêu. | 15.000.000đ |
//——————————————
//| Thu nhập | 15.000.000đ |
//——————————————
//| Còn lại. | 15.000.000đ |
//——————————————
//Format table vuông vức, size table theo size của nội dung chứ không print chay nhé
//
// Bài 3, Căn lề cho String
// Cho một chuỗi đầu vào:
// Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
//
// Viết một func để căn lề trái, phải hoặc giữa cho một chuỗi bất kì, tương tự trên word, excel,…
// - Hỗ trợ mỗi dòng 80 ký tự
// - Nếu hỗ trợ chia được nhiều cột nữa thì tốt, mỗi cột cách nhau 4 spaces
// - Xuống dòng theo từ
//*

// Bài 1:
func checkUpdate(currentVersion: String, verson: String?) {

    if verson == nil || verson == "" {
        print("Không có phiên bản nào khác")
    } else {
        var currentVersonNew = currentVersion.components(separatedBy: ".")
        var versonNew = verson!.components(separatedBy: ".")
        var ii = 0
        var jj = 0
        var result1 = 0
        for i in currentVersonNew {
            ii = Int(i)!
            for j in versonNew {
                jj = Int(j)!
            }
           result1 = ii - jj
            print(result1)
        }
        if result1 == 0 {
            print("\(verson!) Cùng phiên bản")
        } else {
            if result1 > 0 {
                print("\(verson!) là bản cũ hơn")
            } else if result1 < 0 {
                print("\(verson!) là bản mới update")
            }
        }
    }
}
checkUpdate(currentVersion: "1.0.0", verson: "1.0.1")

//extension String{
//    func checkUpdate(_ currentVersion: String?) -> ComparisonResult {
//        let versionDelimiter = "."
//        var versionComponents = self.components(separatedBy: versionDelimiter)
//        var currentVersionComponents = currentVersion!.components(separatedBy: versionDelimiter)
//
//        if currentVersion == nil || currentVersion == "" {
//            print("không có verson nào khác")
//        } else {
//
//            let zeroDiff = versionComponents.count - currentVersionComponents.count
//
//            if zeroDiff == 0 {
//
//                return self.compare(currentVersion!, options: .numeric)
//            } else {
//                let zeros = Array(repeating: "0", count: abs(zeroDiff))
//                if zeroDiff > 0 {
//                    currentVersionComponents.append(contentsOf: zeros)
//                } else {
//                    versionComponents.append(contentsOf: zeros)
//                }
//            }
//        }
//        return versionComponents.joined(separator: versionDelimiter)
//            .compare(currentVersionComponents.joined(separator: versionDelimiter), options: .numeric)
//    }
//
//}
//var result = "2.1" .checkUpdate("")
//if result == .orderedSame {
//    print("Cùng verson")
//} else if result == .orderedAscending {
//    print("Verson mới hơn")
//} else if result == .orderedDescending {
//    print("Verson cũ hơn")
//}

// Bài 2:
var string = ["Lương 10000k", "Làm thêm 20000k", "Mẹ cho 1000k", "Mua gạo 200k", "Mua muối 10k", "Đi ăn nướng 500k", "Ăn lẩu 300k", "Uống trà sữa 100k", "Caffee 60k", "Cho Hoàng mượn 500k", "Cho Cường mượn 600k", "Đi chợ 400k", "Đi siêu thị 900k"]
var tongThu: Int = 0
var tongChi: Int = 0
var strin = ""
func tinhTongThu(str: String) {
    var deleteSpace = str.split(separator: " ")
    var ss = deleteSpace.last
    var cc = ss?.split(separator: "k")
    var strcc = "\(cc?.first ?? "")"
    var int = Int(strcc)
    tongThu += (int ?? 0) * 1000
    print("Tổng thu nhập: \(tongThu)đ")
}
func tinhTongChi(str: String) {
    var deleteSpace = str.split(separator: " ")
    var ss = deleteSpace.last
    var cc = ss?.split(separator: "k")
    var strcc = "\(cc?.first ?? "")"
    var int = Int(strcc)
    tongChi += (int ?? 0) * 1000
    print("Tổng chi tiêu: \(tongChi)đ")
}
func tessCase(string: [String]) {

    for i in string {
        if strin.contains("Lương") || strin.contains("Mẹ cho") || strin.contains("Làm thêm") {
            strin = i
            print("\(strin) là thu nhập")
            tinhTongThu(str: strin)
        } else {
            strin = i
            print("\(strin) là chi tiêu")
            tinhTongChi(str: strin)
        }
    }
}
tessCase(string: string)

let dong1 = ["\n| Thu nhập", " |", "\(tongThu)đ", "|"]
let dong2 = ["\n| Chi tiêu", " |", "\(tongChi)đ", "|"]
let dong3 = ["\n| Con lại", " |", "1đ", "|"]
var sentence = ""

for i in dong1 {
    sentence += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
for i in dong2 {
    sentence += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
for i in dong3 {
    sentence += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
print(sentence)
//var rong = 4
//var dai = 10
//
//for i in 0..<rong {
//    for j in 0..<dai {
//        if i == 0 || i == rong - 1 || j == 0 || j == dai - 1 {
//            print("_", terminator: "")
//        } else {
//            print("*", terminator: "")
//        }
//
//    }
//    print("\(i + 1)")
//    print()
//}
//print()
//func formattedString(left: String, right: String, left1: String, width: Int = 12) -> String {
//
//      let filler = String(repeating: " ", count: max(0, width - left.count))
//      return left + filler + right + filler + left1
//}
//
//let result = formattedString(left: "| Thu nhập | ", right: "\(tongThu)đ", left1: " |") + "\n" + formattedString(left: "| Chi tiêu | ", right: "\(tongChi)đ", left1: " |") + "\n" + formattedString(left: "| Còn lại  | ", right: "1đ", left1: "  |")
//
//print(result)

// Bài 3:
extension String {
    subscript (_ index: Int) -> String {

        get {
             String(self[self.index(startIndex, offsetBy: index)])
        }

        set {
            if index >= count {
                insert(Character(newValue), at: self.index(self.startIndex, offsetBy: count))
            } else {
                insert(Character(newValue), at: self.index(self.startIndex, offsetBy: index))
            }
        }
    }
}
var stringB3 = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."

//while numberStr < string.count - 80 {
//    numberStr = numberStr + 81
//    while string[numberStr]
//    string[numberStr] = "\n"
//}

func numberString(charsPerLine: Int, _ str: String) -> String {
    var st = ""
    var idx = 0
    for char in str {
        st += "\(char)"
        idx = idx + 1
        if idx == charsPerLine {
            st += " \n"
            idx = 0
        }
    }
    return st
}
var newString = numberString(charsPerLine: 50, stringB3)
var str = newString.split(separator: " \n")
var arrString = [String]()
for i in stride(from: 0, to: str.count, by: 1) {
    arrString.append(str[i].trimmingCharacters(in: .whitespacesAndNewlines))
}

func leftAlign(inputArray: [String]) -> [String] {
    var newArray = inputArray
    return newArray
}
func rightAlign(inputArray: [String]) -> [String] {
    var newArray = inputArray
    var max = newArray[0].count
    for i in stride(from: 0, to: newArray.count - 1, by: 1) {
        if newArray[i + 1].count > newArray[i].count {
            max = newArray[i + 1].count
        }
    }

    for i in stride(from: 0, to: newArray.count, by: 1) {
        while (newArray[i].count < max) {
            newArray[i].insert(" ", at: newArray[i].startIndex)
        }
    }
    return newArray
}
func centerAlign(inputArray: [String]) -> [String] {
    var newArray = inputArray
    var max = newArray[0].count
    for i in stride(from: 0, to: (newArray.count - 1 ) , by: 1) {
        if newArray[i + 1].count > newArray[i].count {
            max = newArray[i + 1].count
        }
    }

    for i in stride(from: 0, to: newArray.count, by: 1) {
        var j = 0
        while j < max - newArray[i].count {
            newArray[i].insert(" ", at: newArray[i].startIndex)
            j += 1
        }
    }
    return newArray
}

var leftString = leftAlign(inputArray: arrString)
for i in stride(from: 0, to: leftString.count, by: 1) {
    print(leftString[i])
}
print()
var rightString = rightAlign(inputArray: arrString)
for i in stride(from: 0, to: rightString.count, by: 1) {
    print(rightString[i])
}
print()
var centerString = centerAlign(inputArray: arrString)
for i in stride(from: 0, to: centerString.count, by: 1) {
    print(centerString[i])
}
