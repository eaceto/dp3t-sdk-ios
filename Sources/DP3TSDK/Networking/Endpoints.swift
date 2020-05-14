/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 */

import Foundation

/// An endpoint for exposed people
struct ExposeeEndpoint {
    /// The base URL to derive the url from
    let baseURL: URL
    /// A version of the API
    let version: String
    /// Initialize the endpoint
    /// - Parameters:
    ///   - baseURL: The base URL of the endpoint
    ///   - version: The version of the API
    init(baseURL: URL, version: String = "v1") {
        self.baseURL = baseURL
        self.version = version
    }

    /// A versionned base URL
    private var baseURLVersionned: URL {
        baseURL.appendingPathComponent(version)
    }

    /// Get the URL for the exposed people endpoint at a day for GAEN
    /// - Parameter batchTimestamp: batchTimestamp
    func getExposeeGaen(batchTimestamp: Date) -> URL {
        let milliseconds = batchTimestamp.millisecondsSince1970
        return baseURLVersionned.appendingPathComponent("gaen")
            .appendingPathComponent("exposedios")
            .appendingPathComponent(String(milliseconds))
    }
}

/// An endpoint for adding and removing exposed people
struct ManagingExposeeEndpoint {
    /// The base URL to derive the url from
    let baseURL: URL
    /// A version of the API
    let version: String
    /// Initialize the endpoint
    /// - Parameters:
    ///   - baseURL: The base URL of the endpoint
    ///   - version: The version of the API
    init(baseURL: URL, version: String = "v1") {
        self.baseURL = baseURL
        self.version = version
    }

    /// A versionned base URL
    private var baseURLVersionned: URL {
        baseURL.appendingPathComponent(version)
    }

    /// Get the add exposed endpoint URL
    func addExposedGaen() -> URL {
        baseURLVersionned.appendingPathComponent("gaen").appendingPathComponent("exposed")
    }

    /// Get the add exposed next day endpoint URL
    func addExposedGaenNextDay() -> URL {
        baseURLVersionned.appendingPathComponent("gaen").appendingPathComponent("exposednextday")
    }
}
