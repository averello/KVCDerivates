//
//  JSONObjectDerivate.swift
//  KVCDerivates
//
//  Created by Georges Boumis on 10/06/2016.
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
import LKVCKit
import RepresentationKit

open class JSONObjectDerivate: JSONDerivate, Representable, LKVC {
    final private var _dictionary: [String : Any]
    final public var dictionary: [String : Any] {
        return _dictionary
    }
    
    required public init(dictionary: [String : Any]) {
        _dictionary = dictionary
        self.set(valuesForKeysWithDictionary: dictionary)
    }

    open func value(forKey key: String) -> Any? {
        return self.dictionary[key]
    }

    open func set(value: Any?, forKey key: String) throws {
        throw LightKVCError.undefinedKey(key: key, value: value)
    }

	open func represent(using representation: Representation) -> Representation {
        return self.dictionary.reduce(representation, { (rep, pair) -> Representation in
            rep.with(key: pair.0, value: pair.1)
        })
	}
}
