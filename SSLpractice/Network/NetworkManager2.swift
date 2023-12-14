//
//  NetworkManager2.swift
//  SSLpractice
//
//  Created by Tony Lieu on 12/6/23.
//

import Foundation
struct CertificateHandler {
    static let certificates: [Data] = {
        if let url = Bundle.main.url(forResource: "certificate", withExtension: "der"),
           let data = try? Data(contentsOf: url) {
            return [data]
        }
        return []
    }()
}
final class NetworkManager {
    
    private let urlSession: URLSession
    
    init() {
        urlSession = URLSession(configuration: .default,
                                delegate: UrlSessionDelegateHandler(),
                                delegateQueue: nil)
    }
}

final class UrlSessionDelegateHandler: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // Check for certificates count in serverTrust if it's >0 then only proceed
        guard let trust = challenge.protectionSpace.serverTrust, SecTrustGetCertificateCount(trust) > 0 else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        // Get the certificates from SecTrustCopyCertificateChain and extract first certificate
        guard let certificates = SecTrustCopyCertificateChain(trust) as? [SecCertificate],
              let certificate = certificates.first else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        // Convert certificate to Data
        let data = SecCertificateCopyData(certificate) as Data
        
        // Check if our certificate list contains data
        if CertificateHandler.certificates.contains(data) {
            completionHandler(.useCredential, URLCredential(trust: trust))
            return
        } else {
            // Cancel the Authentication Challenge
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
    }
}
