//
//  UsersTable.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.18
//

import Foundation
import UIKit
import AWSDynamoDB
import AWSMobileHubHelper



class UsersTable: NSObject, Table {
    var tableName: String
    var partitionKeyName: String
    var partitionKeyType: String
    var sortKeyName: String?
    var sortKeyType: String?
    var model: AWSDynamoDBObjectModel
    var indexes: [Index]
    var orderedAttributeKeys: [String] {
        return produceOrderedAttributeKeys(model)
    }
    var tableDisplayName: String {
        return "Users"
    }
    
    
    override init() {
        model = UserDBModel()
        
        tableName = model.classForCoder.dynamoDBTableName()
        partitionKeyName = model.classForCoder.hashKeyAttribute()
        partitionKeyType = "String"
        indexes = [
            UsersSchoolMajor(),
            UsersSchoolLocation(),
        ]
        if let sortKeyNamePossible = model.classForCoder.rangeKeyAttribute?() {
            sortKeyName = sortKeyNamePossible
        }
        super.init()
    }
    
    
    class func getItem(hashKey: String, completionHandler: @escaping (_ response: AWSDynamoDBObjectModel?, _ error: Error?) -> Void) {
        AWSDynamoDBObjectMapper.default().load(UserDBModel.self, hashKey: hashKey, rangeKey: nil, completionHandler: completionHandler)
    }
    
    class func addItem(_ item: UserDBModel) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        var errors: [NSError] = []
        let group: DispatchGroup = DispatchGroup()
        
        group.enter()
        
        objectMapper.save(item, completionHandler: {(error: Error?) -> Void in
            if let error = error as NSError? {
                DispatchQueue.main.async(execute: {
                    errors.append(error)
                })
            }
            
            group.leave()
        })
    }
}

class UsersSchoolMajor: NSObject, Index {
    
    var indexName: String? {
        
        return "School-Major"
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
            QueryWithPartitionKeyAndSortKey,
            QueryWithPartitionKeyAndSortKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        return "Find all items with school = \(partitionKeyValue)."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Major"
        queryExpression.keyConditionExpression = "#school = :school"
        queryExpression.expressionAttributeNames = ["#school": "school",]
        queryExpression.expressionAttributeValues = [":school": "demo-school-3",]
        
        objectMapper.query(UserDBModel.self, expression: queryExpression) { (response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        }
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let filterAttributeValue = "demo-location-500000"
        return "Find all items with school = \(partitionKeyValue) and location > \(filterAttributeValue)."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Major"
        queryExpression.keyConditionExpression = "#school = :school"
        queryExpression.filterExpression = "#location > :location"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#location": "location",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":location": "demo-location-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let sortKeyValue = "demo-major-500000"
        return "Find all items with school = \(partitionKeyValue) and major < \(sortKeyValue)."
    }
    
    func queryWithPartitionKeyAndSortKeyWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Major"
        queryExpression.keyConditionExpression = "#school = :school AND #major < :major"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#major": "major",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":major": "demo-major-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) -> Void in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let sortKeyValue = "demo-major-500000"
        let filterValue = "demo-location-500000"
        return "Find all items with school = \(partitionKeyValue), major < \(sortKeyValue), and location > \(filterValue)."
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Major"
        queryExpression.keyConditionExpression = "#school = :school AND #major < :major"
        queryExpression.filterExpression = "#location > :location"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#major": "major",
            "#location": "location",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":major": "demo-major-500000",
            ":location": "demo-location-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
}

class UsersSchoolLocation: NSObject, Index {
    
    var indexName: String? {
        
        return "School-Location"
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
            QueryWithPartitionKeyAndSortKey,
            QueryWithPartitionKeyAndSortKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        return "Find all items with school = \(partitionKeyValue)."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Location"
        queryExpression.keyConditionExpression = "#school = :school"
        queryExpression.expressionAttributeNames = ["#school": "school",]
        queryExpression.expressionAttributeValues = [":school": "demo-school-3",]
        
        objectMapper.query(UserDBModel.self, expression: queryExpression) { (response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        }
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let filterAttributeValue = "demo-major-500000"
        return "Find all items with school = \(partitionKeyValue) and major > \(filterAttributeValue)."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Location"
        queryExpression.keyConditionExpression = "#school = :school"
        queryExpression.filterExpression = "#major > :major"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#major": "major",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":major": "demo-major-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let sortKeyValue = "demo-location-500000"
        return "Find all items with school = \(partitionKeyValue) and location < \(sortKeyValue)."
    }
    
    func queryWithPartitionKeyAndSortKeyWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Location"
        queryExpression.keyConditionExpression = "#school = :school AND #location < :location"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#location": "location",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":location": "demo-location-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) -> Void in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterDescription() -> String {
        let partitionKeyValue = "demo-school-3"
        let sortKeyValue = "demo-location-500000"
        let filterValue = "demo-major-500000"
        return "Find all items with school = \(partitionKeyValue), location < \(sortKeyValue), and major > \(filterValue)."
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        
        queryExpression.indexName = "School-Location"
        queryExpression.keyConditionExpression = "#school = :school AND #location < :location"
        queryExpression.filterExpression = "#major > :major"
        queryExpression.expressionAttributeNames = [
            "#school": "school",
            "#location": "location",
            "#major": "major",
        ]
        queryExpression.expressionAttributeValues = [
            ":school": "demo-school-3",
            ":location": "demo-location-500000",
            ":major": "demo-major-500000",
        ]
        
        
        objectMapper.query(UserDBModel.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        })
    }
}
