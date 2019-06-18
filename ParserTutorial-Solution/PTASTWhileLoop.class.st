Class {
	#name : #PTASTWhileLoop,
	#superclass : #Object,
	#instVars : [
		'codeInParenthesis',
		'codeInBrackets'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTWhileLoop >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTWhileLoop: self
]

{ #category : #accessing }
PTASTWhileLoop >> codeInBrackets [
	^ codeInBrackets
]

{ #category : #accessing }
PTASTWhileLoop >> codeInBrackets: anObject [
	codeInBrackets := anObject
]

{ #category : #accessing }
PTASTWhileLoop >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTWhileLoop >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]
