Class {
	#name : #PTIslandCGrammar,
	#superclass : #PP2CompositeNode,
	#category : #'ParserTutorial-Base-Grammar'
}

{ #category : #accessing }
PTIslandCGrammar class >> folderToAnalyse [
	self error: 'Define the path to the folder to analyse'.
	^ '/alpha' asFileReference
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
			#();
		rulesToIgnore: #();
		parserPackage: #'ParserTutorial-Base-Grammar';
		parserClass: #PTIslandCParser;
		astPackage: #'ParserTutorial-Base-AST';
		astPrefix: #PTAST;
		visitorPackage: #'ParserTutorial-Base-Visitor';
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
			visitor currentFile: aFile.
			(#PTIslandCParser asClass parse: aFile contents)
				acceptVisitor: visitor ].
	visitor functionList inspect
]
