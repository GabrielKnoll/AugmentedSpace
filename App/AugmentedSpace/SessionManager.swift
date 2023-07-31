//
//  SessionManager.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import MultipeerConnectivity

class SessionManager: NSObject {
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant?
    var serviceAdvertiser: MCNearbyServiceAdvertiser?
    var serviceBrowser: MCNearbyServiceBrowser?
    weak var state: AppState?

    init(state: AppState) {
        self.state = state
    }

    func startSession() {
        guard let state = state, !state.name.isEmpty && !state.partnerName.isEmpty else {
            print("SessionManager can't launch, infos are missing")
            return
        }

        initSession(name: state.name)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "ifi-par")
        serviceAdvertiser?.delegate = self
        serviceAdvertiser?.startAdvertisingPeer()
    }

    func joinSession() {
        guard let state = state, !state.name.isEmpty else {
            print("SessionManager can't launch, infos are missing")
            return
        }

        initSession(name: state.name)
        serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: "ifi-par")
        serviceBrowser?.delegate = self
        serviceBrowser?.startBrowsingForPeers()
    }

    private func initSession(name: String) {
        peerID = MCPeerID(displayName: name)
        mcSession = MCSession(peer: peerID)
        mcSession.delegate = self
    }

    func sendText(text: String) {
        if !mcSession.connectedPeers.isEmpty {
            do {
                try mcSession.send(text.data(using: .utf8)!, toPeers: mcSession.connectedPeers, with: .reliable)
            } catch let error as NSError {
                print("MCSessionError: \(error)")
            }
        } else {
            print("no peers")
        }
    }
}

extension SessionManager: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost peer: \(peerID.displayName)")
    }

    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        print("ServiceBrowser found peer: \(peerID)")
        browser.invitePeer(peerID, to: mcSession, withContext: nil, timeout: 10)
    }
}

extension SessionManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("didReceiveInvitationFromPeer: \(peerID)")
        guard peerID.displayName == state?.partnerName else {
            print("wrong invitation from unknown \(peerID)")
            invitationHandler(false, mcSession)
            return
        }
        invitationHandler(true, mcSession)
    }
}

extension SessionManager: MCSessionDelegate {
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("received stream")
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("didStartReceivingResource")
    }

    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?,
                 withError error: Error?) {
        print("didFinishReceivingResource")
    }

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case MCSessionState.connected:
            print("Connected: \(peerID.displayName)")

        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")

        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")

        @unknown default:
            print("Wow, API Change!")
        }
    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        state?.mcText = String(data: data, encoding: .utf8)!
    }
}