//
//  NetworkError.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

enum NetworkError: Error {
    case emptyResponse
    case requestError(ErrorResponse)
    case encodingFailed(Error)
    case parameterizingFailed(Error)
}
