struct Chmod {
    func makeNumber(_ mod:Mod) -> Mod.Value {
        mod.value
    }
    func makeNumber(_ mods:[Mod]) -> Mod.Value {
        mods.map(\.value).reduce(0, |)
    }
    func makeMods(_ value:Mod.Value) -> [Mod] {
        guard (0...Mod.maxValue).contains(value) else {return []}
        var result = [Mod]()
        for mod in Mod.allCases {
            let modValue = value & mod.value
            if let _mod = Mod(modValue) {
                result.append(_mod)
            }
        }
        return result
        
    }
}

enum Mod:CaseIterable {
    static let maxValue = 7
    static let minValue = 1
    typealias Value = Int
    
    case
    read   ,
    write  ,
    execute
    
    var value:Value {
        switch self {
            case .read:         return 1 << 2  // 4
            case .write:        return 1 << 1  // 2
            case .execute:      return 1 << 0  // 1
        }
    }
    
    init?(_ value:Value) {
        guard let matchedMod = Mod.allCases.first (where:{$0.value == value}) else {
            return nil
        }
        self = matchedMod
    }
}
