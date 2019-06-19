Class {
	#name : #PTASTForLoop,
	#superclass : #Object,
	#instVars : [
		'codeInParenthesis',
		'codeInCurlyBraces'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTForLoop >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTForLoop: self
]

{ #category : #accessing }
PTASTForLoop >> codeInCurlyBraces [
	^ codeInCurlyBraces
]

{ #category : #accessing }
PTASTForLoop >> codeInCurlyBraces: anObject [
	codeInCurlyBraces := anObject
]

{ #category : #accessing }
PTASTForLoop >> codeInParenthesis [
	^ codeInParenthesis
]

{ #category : #accessing }
PTASTForLoop >> codeInParenthesis: anObject [
	codeInParenthesis := anObject
]
