Class {
	#name : #PTASTIslandCurlyBraces,
	#superclass : #Object,
	#instVars : [
		'islandCurlyBraces'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIslandCurlyBraces >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIslandCurlyBraces: self
]

{ #category : #accessing }
PTASTIslandCurlyBraces >> islandCurlyBraces [
	^ islandCurlyBraces
]

{ #category : #accessing }
PTASTIslandCurlyBraces >> islandCurlyBraces: anObject [
	islandCurlyBraces := anObject
]
