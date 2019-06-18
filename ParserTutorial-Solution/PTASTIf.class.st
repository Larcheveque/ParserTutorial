Class {
	#name : #PTASTIf,
	#superclass : #Object,
	#instVars : [
		'codeInParenthesis',
		'codeInBrackets'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIf >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIf: self
]

{ #category : #accessing }
PTASTIf >> codeInBrackets [
	^ codeInBrackets
]

{ #category : #accessing }
PTASTIf >> codeInBrackets: anObject [
	codeInBrackets := anObject
]

{ #category : #accessing }
PTASTIf >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTIf >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]
