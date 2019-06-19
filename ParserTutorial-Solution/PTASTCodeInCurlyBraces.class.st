Class {
	#name : #PTASTCodeInCurlyBraces,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTCodeInCurlyBraces >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCodeInCurlyBraces: self
]

{ #category : #accessing }
PTASTCodeInCurlyBraces >> contents [
	^ contents
]

{ #category : #accessing }
PTASTCodeInCurlyBraces >> contents: anObject [
	contents := anObject
]
