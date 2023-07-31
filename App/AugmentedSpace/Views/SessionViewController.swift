//
//  SessionViewController.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import MultipeerConnectivity
import UIKit

class SessionViewController: UIViewController {
    private var sessionManager: SessionManager!

    init(sessionManager: SessionManager) {
        super.init(nibName: nil, bundle: nil)
        self.sessionManager = sessionManager
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let hostButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        hostButton.setTitle("Start Hosting", for: .normal)
        hostButton.setTitleColor(.blue, for: .normal)
        hostButton.addTarget(self, action: #selector(_startHosting), for: .touchDown)
        view.addSubview(hostButton)

        let joinButton = UIButton(frame: CGRect(x: 100, y: 250, width: 200, height: 100))
        joinButton.setTitle("Join Session", for: .normal)
        joinButton.setTitleColor(.blue, for: .normal)
        joinButton.addTarget(self, action: #selector(_joinSession), for: .touchDown)
        view.addSubview(joinButton)

        let sendButton = UIButton(frame: CGRect(x: 100, y: 450, width: 200, height: 100))
        sendButton.setTitle("Send Text", for: .normal)
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.addTarget(self, action: #selector(sendText), for: .touchDown)
        view.addSubview(sendButton)
    }

    @objc func _startHosting(_: AnyObject) {
        startHosting(action: UIAlertAction(title: "Start Hosting", style: .default))
    }

    func startHosting(action: UIAlertAction!) {
        sessionManager.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ifi-par", discoveryInfo: nil, session: sessionManager.mcSession)
        sessionManager.mcAdvertiserAssistant!.start()
        print("started hosting")
    }

    @objc func _joinSession(_: AnyObject) {
        joinSession(action: UIAlertAction(title: "Join Session", style: .default))
    }

    func joinSession(action: UIAlertAction!) {
        let mcBrowser = MCBrowserViewController(serviceType: "ifi-par", session: sessionManager.mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }

    @objc func sendText(_: AnyObject) {
        sessionManager.sendText(text: "Hello World!")
    }
}

extension SessionViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}
