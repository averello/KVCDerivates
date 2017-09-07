//
//  JSONDerivate.swift
//  KVCDerivates
//
//  Created by Georges Boumis on 15/06/2016.
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//

import Foundation

public enum JSONDerivateError: Error {
    case invalidJSON
    case topLevelObjectIsNotADictionary
}

/// The conforming class can be initialized using a JSON string
public protocol JSONDerivate: DictionaryDerivate {
    /// - Parameter jsonString: should be a dictianry in JSON representation
    /// - Throws: Can throw JSONDerivateError.InvalidJSON if jsonString is not
    /// representing a dictionary
    init(jsonString: String) throws
}

public extension JSONDerivate {
    init(jsonString: String) throws {
        if let data = jsonString.data(using: String.Encoding.utf8) {
            do {
                let obj: Any? = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = obj {
                    if let dict: [String : Any] = object as? [String : Any] {
                        self.init(dictionary: dict)
                    }
                    else {
                        throw JSONDerivateError.topLevelObjectIsNotADictionary
                    }
                }
                else {
                    throw JSONDerivateError.invalidJSON
                }
            }
            catch JSONDerivateError.topLevelObjectIsNotADictionary {
                throw JSONDerivateError.topLevelObjectIsNotADictionary
            } catch {
                throw JSONDerivateError.invalidJSON
            }
        }
        else {
            throw JSONDerivateError.invalidJSON
        }
    }
}
