import LinkedList

public class Deque<T: Equatable>: CustomStringConvertible {
  public init() {}
  private var list = LinkedList<T>()
  private var size = 0
  public var description: String {
    return self.list.description
  }

  public var isEmpty: Bool {
    return self.size > 0
  }

  public var count: Int {
    return self.size
  }

  public func enqueue(_ element: T) {
    do {
      try self.list.insert(item: element, atIndex: self.size)
      self.size += 1
    }
    catch {
      print("This will not catch since atIndex == list.size")
    }
  }

  public func enqueueFront(_ element: T) {
    do {
      try self.list.insert(item: element, atIndex: 0)
      self.size += 1
    }
    catch {
      print("This will not throw since index 0 always exists")
    }
  }

  public func dequeue() -> T? {
    do {
      let value = list[0]
      try self.list.remove(atIndex: 0)
      self.size -= 1
      return value
    }
    // Catches if queue is empty
    catch {
      return nil
    }
  }

  public func dequeueBack() -> T? {
    do {
      let value = self.list[self.size-1]
      try self.list.remove(atIndex: self.size-1)
      self.size -= 1
      return value
    }
    // Catches if queue is empty
    catch {
      return nil
    }
  }

 public func peekFront() -> T? {
   return self.list[0]
 }

 public func peekBack() -> T? {
   return self.list[size-1]
 }
}
