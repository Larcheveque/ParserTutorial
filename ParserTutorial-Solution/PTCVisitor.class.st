Class {
	#name : #PTCVisitor,
	#superclass : #Object,
	#category : #'ParserTutorial-Solution'
}

{ #category : #helpers }
PTCVisitor >> visit: aChildNode [
	^ aChildNode ifNotNil: [ aChildNode acceptVisitor: self ]
]

{ #category : #helpers }
PTCVisitor >> visitAll: childrenNodes [
	childrenNodes
		ifNotNil: [ childrenNodes do: [ :aChildNode | aChildNode acceptVisitor: self ] ]
]

{ #category : #visit }
PTCVisitor >> visitPTASTCFile: aPTASTCFile [ 
	^ self visitAll: aPTASTCFile contents
]

{ #category : #visiting }
PTCVisitor >> visitPTASTCodeInCurlyBraces: aPTASTCodeInCurlyBraces [
	<generated>
	self visitAll: aPTASTCodeInCurlyBraces contents.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTCodeInParenthesis: aPTASTCodeInParenthesis [
	<generated>
	self visitAll: aPTASTCodeInParenthesis contents.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTForLoop: aPTASTForLoop [
	<generated>
	self visit: aPTASTForLoop codeInParenthesis.
	self visit: aPTASTForLoop codeInCurlyBraces.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTFunction: aPTASTFunction [
	<generated>
	self visit: aPTASTFunction identifier.
	self visit: aPTASTFunction codeInParenthesis.
	self visit: aPTASTFunction codeInCurlyBraces.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIdentifier: anPTASTIdentifier [
	<generated>
	^ anPTASTIdentifier identifier
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIf: aPTASTIf [
	<generated>
	self visit: aPTASTIf codeInParenthesis.
	self visit: aPTASTIf codeInCurlyBraces.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIsland: aPTASTIsland [
	<generated>
	self visit: aPTASTIsland island.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIslandCurlyBraces: anPTASTIslandCurlyBraces [
	<generated>
	^ anPTASTIslandCurlyBraces islandCurlyBraces
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIslandParenthesis: anPTASTIslandParenthesis [
	<generated>
	^ anPTASTIslandParenthesis islandParenthesis
]

{ #category : #visiting }
PTCVisitor >> visitPTASTWhileLoop: aPTASTWhileLoop [
	<generated>
	self visit: aPTASTWhileLoop codeInParenthesis.
	self visit: aPTASTWhileLoop codeInCurlyBraces.
]
