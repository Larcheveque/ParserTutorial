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
PTCVisitor >> visitPTASTCodeInBrackets: aPTASTCodeInBrackets [
	<generated>
	self visitAll: aPTASTCodeInBrackets contents.
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
	self visit: aPTASTForLoop codeInBrackets.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTFunction: aPTASTFunction [
	<generated>
	self visit: aPTASTFunction identifier.
	self visit: aPTASTFunction codeInParenthesis.
	self visit: aPTASTFunction codeInBrackets.
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
	self visit: aPTASTIf codeInBrackets.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIsland: aPTASTIsland [
	<generated>
	self visit: aPTASTIsland island.
]

{ #category : #visiting }
PTCVisitor >> visitPTASTIslandBracket: anPTASTIslandBracket [
	<generated>
	^ anPTASTIslandBracket islandBracket
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
	self visit: aPTASTWhileLoop codeInBrackets.
]
