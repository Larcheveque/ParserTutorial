Class {
	#name : #PTASTCFile,
	#superclass : #Object,
	#instVars : [
		'contents',
		'file'
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

{ #category : #accessing }
PTASTCFile >> file [
	^ file
]

{ #category : #accessing }
PTASTCFile >> file: anObject [
	file := anObject
]
