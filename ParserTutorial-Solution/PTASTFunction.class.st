Class {
	#name : #PTASTFunction,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'codeInParenthesis',
		'codeInBrackets'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTFunction >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTFunction: self
]

{ #category : #accessing }
PTASTFunction >> codeInBrackets [
	^ codeInBrackets
]

{ #category : #accessing }
PTASTFunction >> codeInBrackets: anObject [
	codeInBrackets := anObject
]

{ #category : #accessing }
PTASTFunction >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTFunction >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]

{ #category : #accessing }
PTASTFunction >> identifier [
	^ identifier
]

{ #category : #accessing }
PTASTFunction >> identifier: anObject [
	identifier := anObject
]
