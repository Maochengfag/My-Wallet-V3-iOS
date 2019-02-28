//
//  AVCaptureMocks.swift
//  BlockchainTests
//
//  Created by Jack on 19/02/2019.
//  Copyright © 2019 Blockchain Luxembourg S.A. All rights reserved.
//

import Foundation

class CaptureSessionMock: CaptureSessionProtocol {
    var current: AVCaptureSession? = AVCaptureSession()
    
    var startRunningCallback: () -> Void = { }
    var startRunningCallCount: Int = 0
    func startRunning() {
        startRunningCallCount += 1
        startRunningCallback()
    }
    
    var stopRunningCallback: () -> Void = { }
    var stopRunningCallCount: Int = 0
    func stopRunning() {
        stopRunningCallCount += 1
        stopRunningCallback()
    }
    
    var addInputCallback: (CaptureInputProtocol) -> Void = { _ in }
    var inputsAdded: [CaptureInputProtocol] = []
    func add(input: CaptureInputProtocol) {
        inputsAdded.append(input)
        addInputCallback(input)
    }
    
    var addOutputCallback: (CaptureOutputProtocol) -> Void = { _ in }
    var outputsAdded: [CaptureOutputProtocol] = []
    func add(output: CaptureOutputProtocol) {
        outputsAdded.append(output)
        addOutputCallback(output)
    }
}

class DeviceInputMock: CaptureInputProtocol {
    var current: AVCaptureInput?
}

class QRCodeScannerDelegateMock: QRCodeScannerDelegate {
    var scanCompleteCalled: (NewResult<String, QRScannerError>) -> Void = { _ in }
    var scanCompleteResults: [NewResult<String, QRScannerError>] = []
    func scanComplete(with result: NewResult<String, QRScannerError>) {
        scanCompleteResults.append(result)
        scanCompleteCalled(result)
    }
    
    var didStartScanningCalled: () -> Void = { }
    var didStartScanningCallCount: Int = 0
    func didStartScanning() {
        didStartScanningCallCount += 1
        didStartScanningCalled()
    }
    
    var didStopScanningCalled: () -> Void = { }
    var didStopScanningCallCount: Int = 0
    func didStopScanning() {
        didStopScanningCallCount += 1
        didStopScanningCalled()
    }
}

class CaptureMetadataOutputMock: CaptureMetadataOutputProtocol {
    var metadataObjectTypes: [AVMetadataObject.ObjectType]! = []
    
    var setMetadataObjectsDelegateCalled: ((AVCaptureMetadataOutputObjectsDelegate?, DispatchQueue?)) -> Void = { _ in }
    var metadataObjects: [(AVCaptureMetadataOutputObjectsDelegate?, DispatchQueue?)] = []
    func setMetadataObjectsDelegate(_ objectsDelegate: AVCaptureMetadataOutputObjectsDelegate?, queue objectsCallbackQueue: DispatchQueue?) {
        metadataObjects.append((objectsDelegate, objectsCallbackQueue))
        setMetadataObjectsDelegateCalled((objectsDelegate, objectsCallbackQueue))
    }
    
    var current: AVCaptureOutput?
}
