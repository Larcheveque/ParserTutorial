Class {
	#name : #PTFunctionEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'cyclomaticComplexity',
		'file'
	],
	#category : #'ParserTutorial-Solution-Entities'
}

{ #category : #accessing }
PTFunctionEntity >> cyclomaticComplexity [
	^ cyclomaticComplexity
]

{ #category : #accessing }
PTFunctionEntity >> cyclomaticComplexity: anObject [
	cyclomaticComplexity := anObject
]

{ #category : #accessing }
PTFunctionEntity >> file [
	^ file
]

{ #category : #accessing }
PTFunctionEntity >> file: anObject [
	file := anObject
]

{ #category : #metric }
PTFunctionEntity >> increaseCyclomaticComplexity [
	self cyclomaticComplexity: self cyclomaticComplexity + 1.
]

{ #category : #accessing }
PTFunctionEntity >> name [
	^ name
]

{ #category : #accessing }
PTFunctionEntity >> name: anObject [
	name := anObject
]
