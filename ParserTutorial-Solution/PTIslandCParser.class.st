Class {
	#name : #PTIslandCParser,
	#superclass : #PTIslandGrammarC,
	#category : #'ParserTutorial-Solution'
}

{ #category : #rules }
PTIslandCParser >> codeInBrackets [
	<generated>
	^ super codeInBrackets ==> [ :production | PTASTCodeInBrackets new contents: (production at: 2); yourself ]
]

{ #category : #rules }
PTIslandCParser >> codeInParenthesis [
	<generated>
	^ super codeInParenthesis ==> [ :production | PTASTCodeInParenthesis new contents: (production at: 2); yourself ]
]

{ #category : #rules }
PTIslandCParser >> forLoop [
	<generated>
	^ super forLoop ==> [ :production | PTASTForLoop new codeInParenthesis: (production at: 2); codeInBrackets: (production at: 3); yourself ]
]

{ #category : #rules }
PTIslandCParser >> function [
	<generated>
	^ super function ==> [ :production | PTASTFunction new identifier: (production at: 1); codeInParenthesis: (production at: 2); codeInBrackets: (production at: 3); yourself ]
]

{ #category : #rules }
PTIslandCParser >> identifier [
	<generated>
	^ super identifier flatten  ==> [ :production | PTASTIdentifier new identifier: production; yourself ]
]

{ #category : #rules }
PTIslandCParser >> island [
	<generated>
	^ super island ==> [ :production | PTASTIsland new island: production; yourself ]
]

{ #category : #rules }
PTIslandCParser >> islandBracket [
	<generated>
	^ super islandBracket flatten  ==> [ :production | PTASTIslandBracket new islandBracket: production; yourself ]
]

{ #category : #rules }
PTIslandCParser >> islandParenthesis [
	<generated>
	^ super islandParenthesis flatten  ==> [ :production | PTASTIslandParenthesis new islandParenthesis: production; yourself ]
]

{ #category : #helpers }
PTIslandCParser >> rejectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex odd]
]

{ #category : #helpers }
PTIslandCParser >> selectSeparators: anArray [
	<generated>
	^ anArray withIndexSelect: [:anElement :anIndex | anIndex even]
]

{ #category : #rules }
PTIslandCParser >> whileLoop [
	<generated>
	^ super whileLoop ==> [ :production | PTASTWhileLoop new codeInParenthesis: (production at: 2); codeInBrackets: (production at: 3); yourself ]
]
