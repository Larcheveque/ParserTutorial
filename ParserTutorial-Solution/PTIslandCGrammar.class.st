Class {
	#name : #PTIslandCGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'identifier',
		'function',
		'codeInParenthesis',
		'codeInCurlyBraces',
		'cFile',
		'forLoop',
		'whileLoop',
		'island',
		'islandParenthesis',
		'if',
		'islandCurlyBraces'
	],
	#category : #'ParserTutorial-Solution'
}

{ #category : #accessing }
PTIslandCGrammar class >> folderToAnalyse [
	^ '/Users/larcheveque/Downloads/linux-master/arch/alpha'
		asFileReference
]

{ #category : #translating }
PTIslandCGrammar class >> generate [
	<script>
	PPTASTGenerator
		generateEverythingFrom: PTIslandCGrammar
		generationStrategy: self generationStrategy
]

{ #category : #accessing }
PTIslandCGrammar class >> generationStrategy [ 
	^ PPASTGeneratorStrategy  new
		rulesToFlatten:
			#(identifier islandParenthesis islandCurlyBraces);
		rulesToIgnore: #(cFile);
		parserPackage: #'ParserTutorial-Solution-Grammar';
		parserClass: #PTIslandCParser;
		astPackage: #'ParserTutorial-Solution-AST';
		astPrefix: #PTAST;
		visitorPackage: #'ParserTutorial-Solution-Visitor';
		visitorClass: #PTCVisitor;
		yourself
]

{ #category : #accessing }
PTIslandCGrammar class >> launchingScript1 [
	<script>
	(self folderToAnalyse allFiles
		select: [ :aFile | aFile extension = 'c' ]
		thenCollect: [ :aFile | PTIslandCGrammar parse: aFile contents ])
		inspect
]

{ #category : #accessing }
PTIslandCGrammar class >> launchingScript2 [
	<script>
	(self folderToAnalyse allFiles
		select: [ :aFile | aFile extension = 'c' ]
		thenCollect: [ :aFile | #PTIslandCParser asClass parse: aFile contents ])
		inspect
]

{ #category : #accessing }
PTIslandCGrammar class >> launchingScript3 [
	<script>
	| visitor |
	visitor := PTFunctionCreatorVisitor new.
	self folderToAnalyse allFiles
		select: [ :aFile | aFile extension = 'c' ]
		thenDo: [ :aFile | 
			(#PTIslandCParser asClass parse: aFile contents)
				acceptVisitor: visitor ].
	visitor functionList inspect
]

{ #category : #accessing }
PTIslandCGrammar class >> launchingScript4 [
	<script>
	| visitor |
	visitor := PTFunctionCreatorVisitor new.
	self folderToAnalyse allFiles
		select: [ :aFile | aFile extension = 'c' ]
		thenDo: [ :aFile | 
			(#PTIslandCParser asClass parse: aFile contents)
				file: aFile;
				acceptVisitor: visitor ].
	visitor functionList inspect
]

{ #category : #accessing }
PTIslandCGrammar >> cFile [
	^ (function / #any asPParser) star
]

{ #category : #rules }
PTIslandCGrammar >> codeInCurlyBraces [
	<reify: #(island / codeInCurlyBraces / islandCurlyBraces) into: #content>
	^ ${ asPParser , (island / codeInCurlyBraces / islandCurlyBraces) star
		, $} asPParser
]

{ #category : #rules }
PTIslandCGrammar >> codeInParenthesis [
	<reify: #(island / codeInParenthesis / islandParenthesis) into: #content>
	^ $( asPParser
		, (island / codeInParenthesis / islandParenthesis) star
		, $) asPParser
]

{ #category : #rules }
PTIslandCGrammar >> forLoop [
	^ 'for' asPParser, codeInParenthesis trim, codeInCurlyBraces 
]

{ #category : #rules }
PTIslandCGrammar >> function [
	^ identifier, codeInParenthesis trim, codeInCurlyBraces
]

{ #category : #rules }
PTIslandCGrammar >> identifier [
	^( #letter asPParser / $_ asPParser
		, (#letter asPParser / $_ asPParser / #digit asPParser) star) flatten
]

{ #category : #rules }
PTIslandCGrammar >> if [
	^ 'if' asPParser, codeInParenthesis trim, codeInCurlyBraces 
]

{ #category : #rules }
PTIslandCGrammar >> island [
	^ forLoop / whileLoop / if
]

{ #category : #rules }
PTIslandCGrammar >> islandCurlyBraces [
	^ $} asPParser negate
]

{ #category : #rules }
PTIslandCGrammar >> islandParenthesis [
	^ $) asPParser negate
]

{ #category : #accessing }
PTIslandCGrammar >> start [
	^ cFile
]

{ #category : #rules }
PTIslandCGrammar >> whileLoop [
	^ 'while' asPParser, codeInParenthesis trim, codeInCurlyBraces 
]
