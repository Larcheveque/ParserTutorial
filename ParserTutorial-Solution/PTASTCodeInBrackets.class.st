Class {
	#name : #PTASTCodeInBrackets,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTCodeInBrackets >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCodeInBrackets: self
]

{ #category : #accessing }
PTASTCodeInBrackets >> contents [
	^ contents
]

{ #category : #accessing }
PTASTCodeInBrackets >> contents: anObject [
	contents := anObject
]
