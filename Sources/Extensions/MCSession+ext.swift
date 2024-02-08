import MultipeerConnectivity

extension MCSessionState {
    public func description() -> String {

        switch self {
            case .connecting:   return "connecting"
            case .connected:    return "connected"
            case .notConnected: return "notConnected"
            @unknown default:   return "unknown"
        }
    }

    public func icon() -> String {
        
        switch self {
            case .connecting:   return "❓"
            case .connected:    return "🤝"
            case .notConnected: return "⁉️"
            @unknown default:   return "‼️"
        }
    }
}
