Class {
	#name : #PTFunctionCreatorVisitor,
	#superclass : #PTCVisitor,
	#instVars : [
		'functionList',
		'currentFile'
	],
	#category : #'ParserTutorial-Solution'
}

{ #category : #accessing }
PTFunctionCreatorVisitor >> currentFile [
	^ currentFile
]

{ #category : #accessing }
PTFunctionCreatorVisitor >> currentFile: anObject [
	currentFile := anObject
]

{ #category : #visiting }
PTFunctionCreatorVisitor >> currentFunction [
	^ self functionList last
]

{ #category : #accessing }
PTFunctionCreatorVisitor >> functionList [
	^ functionList
]

{ #category : #accessing }
PTFunctionCreatorVisitor >> functionList: anObject [
	functionList := anObject
]

{ #category : #initialization }
PTFunctionCreatorVisitor >> initialize [ 
	super initialize.
	functionList := OrderedCollection new
]

{ #category : #visiting }
PTFunctionCreatorVisitor >> visitPTASTForLoop: aPTASTForLoop [
	self currentFunction increaseCyclomaticComplexity.
	super visitPTASTForLoop: aPTASTForLoop.
	
]

{ #category : #visiting }
PTFunctionCreatorVisitor >> visitPTASTFunction: aPTASTFunction [
	functionList
		addLast:
			(PTFunctionEntity new
				name: (self visit: aPTASTFunction identifier);
				cyclomaticComplexity: 1;
				file: self currentFile;
				yourself).
	self visit: aPTASTFunction codeInParenthesis.
	self visit: aPTASTFunction codeInBrackets
]

{ #category : #visiting }
PTFunctionCreatorVisitor >> visitPTASTIf: aPTASTIf [
	self currentFunction increaseCyclomaticComplexity.
	super visitPTASTIf: aPTASTIf.
	
]

{ #category : #visiting }
PTFunctionCreatorVisitor >> visitPTASTWhileLoop: aPTASTWhileLoop [
	self currentFunction increaseCyclomaticComplexity.
	super visitPTASTWhileLoop: aPTASTWhileLoop
]
