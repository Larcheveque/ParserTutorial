Class {
	#name : #PTASTCodeInParenthesis,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTCodeInParenthesis >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCodeInParenthesis: self
]

{ #category : #accessing }
PTASTCodeInParenthesis >> contents [
	^ contents
]

{ #category : #accessing }
PTASTCodeInParenthesis >> contents: anObject [
	contents := anObject
]
