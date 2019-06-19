Class {
	#name : #PTASTIf,
	#superclass : #Object,
	#instVars : [
		'codeInParenthesis',
		'codeInCurlyBraces'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIf >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIf: self
]

{ #category : #accessing }
PTASTIf >> codeInCurlyBraces [
	^ codeInCurlyBraces
]

{ #category : #accessing }
PTASTIf >> codeInCurlyBraces: anObject [
	codeInCurlyBraces := anObject
]

{ #category : #accessing }
PTASTIf >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTIf >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]
