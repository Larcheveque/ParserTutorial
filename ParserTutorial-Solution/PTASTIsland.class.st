Class {
	#name : #PTASTIsland,
	#superclass : #Object,
	#instVars : [
		'island'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIsland >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIsland: self
]

{ #category : #accessing }
PTASTIsland >> island [
	^ island
]

{ #category : #accessing }
PTASTIsland >> island: anObject [
	island := anObject
]
