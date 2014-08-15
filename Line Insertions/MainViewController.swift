//
//  MainViewController.swift
//  Line Insertions
//
//  Created by Jasper Reddin on 8/14/14.
//  Copyright (c) 2014 TwoGuysBrickfilms. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
	
	@IBOutlet var insertionText: NSTextField!
	@IBOutlet var mainText: NSTextView!
	@IBOutlet var putInFrontOfLine: NSButton!
	@IBOutlet var putAfterLine: NSButton!
	
	override func awakeFromNib() {
		mainText.font = NSFont(name: "Menlo Regular",size: 11)
	}
	
	@IBAction func insertTextIntoLines(sender: NSButton) {
		// Split text into lines
		var lines = StringUtil.split(mainText.string, regex: "\n")
		
		// Prefix and suffix lines
		var i = 0
		for line in lines {
			var _line = line
			var insertWhat = insertionText.stringValue
			
			if putInFrontOfLine.integerValue == 1 {
				_line = insertWhat + _line
			}
			
			if putAfterLine.integerValue == 1 {
				_line = _line + insertWhat
			}
			
			lines[i] = _line
			i++
		}
		
		// Display to user
		var text = ""
		if lines.count > 1{
			for count in 0...lines.count-2 {
				text += lines[count]
				text += "\n"
			}
		}
		text += lines[lines.count-1]
		mainText.string = text
		
	}
	
	@IBAction func removeTextFromLines(sender: NSButton) {
		
		if(putInFrontOfLine.integerValue == 0 && putAfterLine.integerValue == 0){
			return
		}
		
		// Split text into lines
		var lines = StringUtil.split(mainText.string, regex: "\n")
		var removeWhat: String = insertionText.stringValue
		
		// Set length of removeWhat = length
		var length: Int = countElements(removeWhat)
		
		// Remove prefixes and suffixes
		for i in 0..<lines.count{
			// Determine if line has prefix or suffix of removeWhat
			var hasPrefix: Bool = lines[i].hasPrefix(removeWhat) && putInFrontOfLine.integerValue == 1
			var hasSuffix: Bool = lines[i].hasSuffix(removeWhat) && putAfterLine.integerValue == 1
			
			// Fix for crash that happens when line is supposed to be blank after operation.
			if countElements(removeWhat)*(hasPrefix && hasSuffix ? 2:1) >= countElements(lines[i]){
				lines[i] = ""
			}else{
				
				if hasPrefix{
					lines[i] = StringUtil.substringOf(lines[i], startIndex: length, endIndex: countElements(lines[i])-1)!
				}
				
				if hasSuffix{
					lines[i] = StringUtil.substringOf(lines[i], startIndex: 0, endIndex: countElements(lines[i])-length-1)!
				}
			}
		}
		
		// Display to user
		var text = ""
		if lines.count > 1{
			for count in 0...lines.count-2 {
				text += lines[count]
				text += "\n"
			}
		}
		
		text += lines[lines.count-1]
		mainText.string = text
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do view setup here.
	}
}