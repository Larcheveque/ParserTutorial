Class {
	#name : #PTIslandGrammarC,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'identifier',
		'function',
		'codeInParenthesis',
		'codeInBrackets',
		'cFile',
		'forLoop',
		'whileLoop',
		'island',
		'islandBracket',
		'islandParenthesis',
		'if'
	],
	#category : #'ParserTutorial-Solution'
}

{ #category : #translating }
PTIslandGrammarC class >> generate [
	<script>
	PPTASTGenerator
		generateEverythingFrom: PTIslandGrammarC
		generationStrategy: self generationStrategy
]

{ #category : #accessing }
PTIslandGrammarC class >> generationStrategy [ 
	^ PPASTGeneratorStrategy  new
		rulesToFlatten:
			#(identifier islandParenthesis islandBracket);
		rulesToIgnore: #(cFile);
		parserPackage: #'ParserTutorial-Solution';
		parserClass: #PTIslandCParser;
		astPackage: #'ParserTutorial-Solution-AST';
		astPrefix: #PTAST;
		visitorPackage: #'ParserTutorial-Solution';
		visitorClass: #PTCVisitor;
		keepPositions: false;
		yourself
]

{ #category : #accessing }
PTIslandGrammarC class >> launchingScript [
	| visitor |
	visitor := PTFunctionCreatorVisitor new.
	'/Users/larcheveque/Downloads/linux-master/arch/alpha'
		asFileReference allFiles
		select: [ :aFile | aFile extension = 'c' ]
		thenDo: [ :aFile | 
			visitor currentFile: aFile.
			(PTIslandCParser parse: aFile contents) acceptVisitor: visitor ].
	visitor functionList
]

{ #category : #accessing }
PTIslandGrammarC >> cFile [
	^ (function / #any asPParser) star
]

{ #category : #rules }
PTIslandGrammarC >> codeInBrackets [
	<reify: #(island / codeInBrackets / islandBracket) into: #content>
	^ ${ asPParser , (island / codeInBrackets / islandBracket) star
		, $} asPParser
]

{ #category : #rules }
PTIslandGrammarC >> codeInParenthesis [
	<reify: #(island / codeInParenthesis / islandParenthesis) into: #content>
	^ $( asPParser
		, (island / codeInParenthesis / islandParenthesis) star
		, $) asPParser
]

{ #category : #rules }
PTIslandGrammarC >> forLoop [
	^ 'for' asPParser, codeInParenthesis trim, codeInBrackets 
]

{ #category : #rules }
PTIslandGrammarC >> function [
	^ identifier, codeInParenthesis trim, codeInBrackets
]

{ #category : #rules }
PTIslandGrammarC >> identifier [
	^( #letter asPParser / $_ asPParser
		, (#letter asPParser / $_ asPParser / #digit asPParser) star) flatten
]

{ #category : #rules }
PTIslandGrammarC >> if [
	^ 'if' asPParser, codeInParenthesis trim, codeInBrackets 
]

{ #category : #rules }
PTIslandGrammarC >> island [
	^ forLoop / whileLoop / if
]

{ #category : #rules }
PTIslandGrammarC >> islandBracket [
	^ $} asPParser negate
]

{ #category : #rules }
PTIslandGrammarC >> islandParenthesis [
	^ $) asPParser negate
]

{ #category : #accessing }
PTIslandGrammarC >> start [
	^ cFile
]

{ #category : #rules }
PTIslandGrammarC >> whileLoop [
	^ 'while' asPParser, codeInParenthesis trim, codeInBrackets 
]
