extension Int {
    func floorDiv(_ rhs: Int) -> Int {
        assert(rhs > 0)
        if self >= 0 {
            return self / rhs
        } else {
            return (self - rhs + 1) / rhs
        }
    }

    func floorMod(_ rhs: Int) -> Int {
        assert(rhs > 0)
        return ((self % rhs) + rhs) % rhs
    }
}
