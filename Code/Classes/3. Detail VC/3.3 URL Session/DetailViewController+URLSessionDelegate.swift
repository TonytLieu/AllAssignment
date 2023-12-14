import Foundation

extension DetailViewController {
    func requestWithURLSessionDelegate(pinning: Bool) {
        guard let urlString = endpointTextfield.text,
              let url = URL(string: urlString) else {
            showResult(success: false)
            return
        }

        /// When not pinning, we simply skip setting our own delegate		
        let session = URLSession(configuration: .default, delegate: pinning ? self : nil, delegateQueue: nil)

        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                
                if let _ = error {
                    //self?.showResult(success: false, pinError: true)
                }
                else if let _ = response {
                    self?.showResult(success: true)
                }
            }
        })

        task.resume()
    }
}

extension DetailViewController: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard let trust = challenge.protectionSpace.serverTrust, SecTrustGetCertificateCount(trust) > 0 else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        if let serverCertificate = SecTrustGetCertificateAtIndex(trust, 0) {
            
            let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data
            if pinnedCertificates().contains(serverCertificateData) {
                completionHandler(.useCredential, URLCredential(trust: trust))
                return
            }
            else if let serverCertificateKey = publicKey(for: serverCertificate) {
                if pinnedKeys().contains(serverCertificateKey) {
                    completionHandler(.useCredential, URLCredential(trust: trust))
                    return
                } else {
                    completionHandler(.cancelAuthenticationChallenge, nil)
                    showResult(success: false, pinError: true)
                    return
                }
            }
        }
        completionHandler(.cancelAuthenticationChallenge, nil)
        showResult(success: false)
    }

    private func pinnedCertificates() -> [Data] {
        var certificates: [Data] = []
        if let pinnedCertificateURL = Bundle.main.url(forResource: Constants.certificateFileName, withExtension: Constants.certificateFileType) {
            do {
                let pinnedCertificateData = try Data(contentsOf: pinnedCertificateURL)
                certificates.append(pinnedCertificateData)
            } catch {
                fatalError()
            }
        }
        return certificates
    }

    private func pinnedKeys() -> [SecKey] {
        var publicKeys: [SecKey] = []
        if let pinnedCertificateURL = Bundle.main.url(forResource: Constants.certificateFileName, withExtension: Constants.certificateFileType) {
            do {
                let pinnedCertificateData = try Data(contentsOf: pinnedCertificateURL) as CFData
                if let pinnedCertificate = SecCertificateCreateWithData(nil, pinnedCertificateData), let key = publicKey(for: pinnedCertificate) {
                    publicKeys.append(key)
                }
            } catch {
                fatalError()
            }
        }
        return publicKeys
    }

    private func publicKey(for certificate: SecCertificate) -> SecKey? {
        var publicKey: SecKey?
        let policy = SecPolicyCreateBasicX509()
//        let policy = SecPolicyCreateSSL(true, Constants.serverDomain as CFString)
        var trust: SecTrust?
        let trustCreationStatus = SecTrustCreateWithCertificates(certificate, policy, &trust)
        if let trust = trust, trustCreationStatus == errSecSuccess {
            publicKey = SecTrustCopyPublicKey(trust)
        }
        return publicKey
    }
}
