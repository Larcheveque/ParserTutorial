Class {
	#name : #PTASTIdentifier,
	#superclass : #Object,
	#instVars : [
		'identifier'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIdentifier >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIdentifier: self
]

{ #category : #accessing }
PTASTIdentifier >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTIdentifier >> identifier: anObject [
	identifier := anObject
]
