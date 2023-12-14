import Foundation

public enum Constants {

    public enum PinMethod {
        case alamofire
        case customPolicyManager
        case NSURLSession
    }
    
    static let serverDomain = "iosr2-1-0.digital.kp.gov.pk"//stackoverflow.com"
    static let serverUrl = "https://" + serverDomain + ""
    static let certificateFileName = "stackoverflowWorking"
    static let certificateFileType = "cer"
}


