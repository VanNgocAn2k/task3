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
// ???: Version không phải verson
func checkUpdate(currentVersion: String, version: String?) {

    // FIXME: Dùng if let hoặc guard let
    guard let version = version else {
        print("Không có phiên bản nào khác")
        return
    }
    if version == "" {
        print("Không có phiên bản nào khác")
    } else {
        var currentVersonNew = currentVersion.components(separatedBy: ".")
        // FIXME: Dùng if let xong thì bỏ force optional đi, không nên dùng
        var versionNew = version.components(separatedBy: ".")
        var currentVersionInt = 0
        var versionInt = 0
        var result = 0
        for i in currentVersonNew {
            // FIXME: Cấm force kiểu này
            currentVersionInt = (Int(i) ?? 0)
            // ???: Chưa hiểu logic chỗ này lắm, em mổ tả kỹ nhé
            // Sau khi lấy được các phần tử của mảng currentVersionNew và versionNew thì em sẽ ép kiểu từ String -> Int rồi em lấy từng phần tử currentVersionInt trừ cho từng phần tử versionInt . sau đó em sẽ biết được là nếu kết quả bằng nhau thì là cùng version, nếu kết quả > 0 thì là version cũ, nếu kết quả < 0 thì là version mới update
            for j in versionNew {
                versionInt = (Int(j) ?? 0)
            }
            // FIXME: Chú ý format code cho đúng
            result = currentVersionInt - versionInt
            print(result)
        }
        if result == 0 {
            print("\(version) Cùng phiên bản")
        } else if result > 0 {
            
            print("\(version) là bản cũ hơn")
            
        } else {
            print("\(version) là bản mới update")
        }
    }
}
checkUpdate(currentVersion: "1.0.0", version: "1.0.1")

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
var spendingList = ["Lương 10000k", "Làm thêm 20000k", "Mẹ cho 1000k", "Mua gạo 200k", "Mua muối 10k", "Đi ăn nướng 500k", "Ăn lẩu 300k", "Uống trà sữa 100k", "Caffee 60k", "Cho Hoàng mượn 500k", "Cho Cường mượn 600k", "Đi chợ 400k", "Đi siêu thị 900k"]
var tongThu: Int = 0
var tongChi: Int = 0
func tinhTongThu(str: String) {
    // FIXME: Đặt tên biến chả có chút ý nghĩa gì hết vậy em? sửa lại nhé
    var deleteSpace = str.split(separator: " ")
    var lastStr = deleteSpace.last
    var deleteLast = lastStr?.split(separator: "k")
    var strInt = "\(deleteLast?.first ?? "")"
    var int = Int(strInt)
    tongThu += (int ?? 0) * 1000
    print("Tổng thu nhập: \(tongThu)đ")
}
func tinhTongChi(str: String) {
    var deleteSpace = str.split(separator: " ")
    var lastStr = deleteSpace.last
    var deleteLast = lastStr?.split(separator: "k")
    var strInt = "\(deleteLast?.first ?? "")"
    var int = Int(strInt)
    tongChi += (int ?? 0) * 1000
    print("Tổng chi tiêu: \(tongChi)đ")
}
func tessCase(string: [String]) {
    // ???: Chỗ này sao không dùng i luôn mà lại phải dùng một biến ngoài?
    // chỗ này em không nghĩ rằng i có thể chấm contains được
    for i in string {
        if i.contains("Lương") || i.contains("Mẹ cho") || i.contains("Làm thêm") {
            print("\(i) là thu nhập")
            tinhTongThu(str: i)
        } else {
            print("\(i) là chi tiêu")
            tinhTongChi(str: i)
        }
    }
}
tessCase(string: spendingList)

let dong1 = ["\n| Thu nhập", " |", "", "|"]
let dong2 = ["\n| Chi tiêu", " |", "\(tongChi)đ", "|"]
let dong3 = ["\n| Con lại", " |", "\(tongThu - tongChi)đ", "|"]
var table = ""

// ???: length=11, bỏ đi chữ đ là còn 10, max là được bao nhiêu? Ngoài ra em còn chưa format tongThu & tongChi
// Max là được 11
for i in dong1 {
    table += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
for i in dong2 {
    table += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
for i in dong3 {
    table += i.padding(toLength: 11, withPad: " ", startingAt: 0)
}
print(table)

func formattedString(left: String, right: String, left1: String, width: Int = 13) -> String {

      let filler = String(repeating: " ", count: max(0, width - left.count))
      return left + filler + right + filler + left1
}

let dong11 = formattedString(left: "| Thu nhập |",
                right: " \(tongThu)đ",
                left1: " |")
let dong12 = formattedString(left: "| Chi tiêu | ",
                             right: "\(tongChi)đ",
                             left1: " |")
let dong33 = formattedString(left: "| Còn lại  | ",
                             right: "1đ",
                             left1: "  |")
let result2 = dong11 + "\n" + dong12 + "\n" + dong33

print(result2)

// Bài 3:
// FIXME: Xuống dòng theo từ em nhé, hiện tại em đang cắt luôn từ ra, như vậy là chưa đúng yêu cầu đâu
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

func numberString(charsPerLine: Int, _ str: String) -> String {
    var string = str
    var idx = 0
    while idx < string.count - charsPerLine {
        idx += (charsPerLine + 1)
        while string[idx] != " " {
            idx += 1
        }
        string[idx] = "\n"
    }
    return string
}
var newString = numberString(charsPerLine: 50, stringB3)

var str = newString.split(separator: "\n")
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
