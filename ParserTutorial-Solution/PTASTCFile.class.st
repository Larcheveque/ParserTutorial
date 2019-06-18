Class {
	#name : #PTASTCFile,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTCFile >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTCFile: self
]

{ #category : #accessing }
PTASTCFile >> contents [
	^ contents
]

{ #category : #accessing }
PTASTCFile >> contents: anObject [
	contents := anObject
]
