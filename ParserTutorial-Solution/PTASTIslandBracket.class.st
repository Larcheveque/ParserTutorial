Class {
	#name : #PTASTIslandBracket,
	#superclass : #Object,
	#instVars : [
		'islandBracket'
	],
	#category : #'ParserTutorial-Solution-AST'
}

{ #category : #visiting }
PTASTIslandBracket >> acceptVisitor: aVisitor [
	<generated>
	^ aVisitor visitPTASTIslandBracket: self
]

{ #category : #accessing }
PTASTIslandBracket >> islandBracket [
	^ islandBracket
]

{ #category : #accessing }
PTASTIslandBracket >> islandBracket: anObject [
	islandBracket := anObject
]
