//
//  String Extension.swift
//  MathQuizGame-Mac
//
//  Created by Jasper Reddin on 8/13/14.
//  Copyright (c) 2014 TwoGuysBrickfilms. All rights reserved.
//

import Foundation

extension String {
	subscript (r: Range<Int>) -> String? {
		
		if r.endIndex > (countElements(self)) || r.endIndex < (0){
			return nil
			}
			
			if r.startIndex > (countElements(self)) || r.startIndex < (0){
				return nil
			}
			
			var start = advance(startIndex, r.startIndex)
			var end = advance(startIndex, r.endIndex)
			return substringWithRange(Range(start: start, end: end))
	}

subscript (i: Int) -> String? {
		if i>=countElements(self) || i<0{
			return nil
		}
			
		return String(Array(self)[i])
	}
}

class StringUtil {
	class func substringOf(string: String, startIndex:Int,endIndex:Int) -> String? {
		return string[startIndex...endIndex]
	}
	
	class func split(string:String!,regex:Character!)->[String]!{
		var buffer: [String] = []
		var currentWord = ""
		
		for char in string{
			if(char == regex){
				buffer.append(currentWord)
				currentWord = ""
			}else{
				currentWord += char
			}
		}
		
		buffer.append(currentWord)
		
		return buffer
	}
	
	class func splitWords(string:String!)->[String]!{
		return split(string, regex: " ")
	}
}