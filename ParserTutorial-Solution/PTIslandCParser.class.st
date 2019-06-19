Class {
	#name : #PTIslandCParser,
	#superclass : #PTIslandCGrammar,
	#category : #'ParserTutorial-Solution'
}

{ #category : #rules }
PTIslandCParser >> cFile [
	^ super cFile
		==> [ :production | 
			PTASTCFile new
				contents: (production reject: #isCharacter);
				yourself ]
]

{ #category : #rules }
PTIslandCParser >> codeInCurlyBraces [
	<generated>
	^ super codeInCurlyBraces ==> [ :production | PTASTCodeInCurlyBraces new contents: (production at: 2); yourself ]
]

{ #category : #rules }
PTIslandCParser >> codeInParenthesis [
	<generated>
	^ super codeInParenthesis ==> [ :production | PTASTCodeInParenthesis new contents: (production at: 2); yourself ]
]

{ #category : #rules }
PTIslandCParser >> forLoop [
	<generated>
	^ super forLoop ==> [ :production | PTASTForLoop new codeInParenthesis: (production at: 2); codeInCurlyBraces: (production at: 3); yourself ]
]

{ #category : #rules }
PTIslandCParser >> function [
	<generated>
	^ super function ==> [ :production | PTASTFunction new identifier: (production at: 1); codeInParenthesis: (production at: 2); codeInCurlyBraces: (production at: 3); yourself ]
]

{ #category : #rules }
PTIslandCParser >> identifier [
	<generated>
	^ super identifier flatten  ==> [ :production | PTASTIdentifier new identifier: production; yourself ]
]

{ #category : #rules }
PTIslandCParser >> if [
	<generated>
	^ super if ==> [ :production | PTASTIf new codeInParenthesis: (production at: 2); codeInCurlyBraces: (production at: 3); yourself ]
]

{ #category : #rules }
PTIslandCParser >> island [
	<generated>
	^ super island ==> [ :production | PTASTIsland new island: production; yourself ]
]

{ #category : #rules }
PTIslandCParser >> islandCurlyBraces [
	<generated>
	^ super islandCurlyBraces flatten  ==> [ :production | PTASTIslandCurlyBraces new islandCurlyBraces: production; yourself ]
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
	^ super whileLoop ==> [ :production | PTASTWhileLoop new codeInParenthesis: (production at: 2); codeInCurlyBraces: (production at: 3); yourself ]
]
