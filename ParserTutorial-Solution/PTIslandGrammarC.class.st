Class {
	#name : #PTIslandGrammarC,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'identifier',
		'function',
		'codeInParenthesis',
		'codeInBrackets',
		'cFile'
	],
	#category : #'ParserTutorial-Solution'
}

{ #category : #accessing }
PTIslandGrammarC >> cFile [
	^ (function / #any asPParser) star
]

{ #category : #rules }
PTIslandGrammarC >> codeInBrackets [
	^ ${ asPParser , (codeInBrackets / $} asPParser negate) star
		, $} asPParser
]

{ #category : #rules }
PTIslandGrammarC >> codeInParenthesis [
	^ $( asPParser , (codeInParenthesis / $) asPParser negate) star
		, $) asPParser
]

{ #category : #rules }
PTIslandGrammarC >> function [
	^ identifier, codeInParenthesis trim, codeInBrackets ==> [ :production | production first -> production third ]
]

{ #category : #rules }
PTIslandGrammarC >> identifier [
	^( #letter asPParser / $_ asPParser
		, (#letter asPParser / $_ asPParser / #digit asPParser) star) flatten
]

{ #category : #accessing }
PTIslandGrammarC >> start [
	^ cFile
]
