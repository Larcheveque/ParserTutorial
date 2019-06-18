Class {
	#name : #PTASTIslandParenthesis,
	#superclass : #Object,
	#instVars : [
		'islandParenthesis'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIslandParenthesis >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIslandParenthesis: self
]

{ #category : #accessing }
PTASTIslandParenthesis >> islandParenthesis [
	^ islandParenthesis
]

{ #category : #accessing }
PTASTIslandParenthesis >> islandParenthesis: anObject [
	islandParenthesis := anObject
]
