Class {
	#name : #PTASTWhileLoop,
	#superclass : #Object,
	#instVars : [
		'codeInParenthesis',
		'codeInCurlyBraces'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTWhileLoop >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTWhileLoop: self
]

{ #category : #accessing }
PTASTWhileLoop >> codeInCurlyBraces [
	^ codeInCurlyBraces
]

{ #category : #accessing }
PTASTWhileLoop >> codeInCurlyBraces: anObject [
	codeInCurlyBraces := anObject
]

{ #category : #accessing }
PTASTWhileLoop >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTWhileLoop >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]
