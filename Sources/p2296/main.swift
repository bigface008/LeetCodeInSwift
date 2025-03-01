import DequeModule

class Node {
    let ch: Character
    weak var prev: Node?
    var next: Node?

    init(_ ch: Character) {
        self.ch = ch
    }
}

class TextEditor {
    private var head = Node("h")
    private var tail  = Node("t")
    private var it: Node

    init() {
        it = head
        // head.next = tail
        // tail.prev = head
        head.next = nil
    }

    deinit {
        // ...
    }
    
    func addText(_ text: String) {
        for ch in text {
            let node = Node(ch)
            let next = it.next
            it.next = node
            node.next = next
            node.prev = it
            next?.prev = node
        }
    }
    
    func deleteText(_ k: Int) -> Int {
        var i = 0
        while i < k && it.prev != nil {
            let prev = it.prev
            let prevPrev = prev?.prev
            prevPrev?.next = it
            it.prev = prevPrev
            i += 1
        }
        return i
    }
    
    func cursorLeft(_ k: Int) -> String {
        var res = ""
        return res
    }
    
    func cursorRight(_ k: Int) -> String {
        var res = ""
        return res
    }
}

let solution = TextEditor()
print("Just we")
