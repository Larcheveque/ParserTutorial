Class {
	#name : #PTIslandGrammarCTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'ParserTutorial-Tests'
}

{ #category : #accessing }
PTIslandGrammarCTest >> parserClass [
	^ PTIslandGrammarC 
]

{ #category : #accessing }
PTIslandGrammarCTest >> testIdentifier1 [
	self parse: 'foo' rule: #identifier
]

{ #category : #accessing }
PTIslandGrammarCTest >> testIdentifier2 [
	self parse: '__kmalloc' rule: #identifier
]

{ #category : #accessing }
PTIslandGrammarCTest >> testIdentifier3 [
	self parse: 'answer42' rule: #identifier
]

{ #category : #accessing }
PTIslandGrammarCTest >> testIdentifier4 [
	self fail: '42answer' rule: #identifier
]

{ #category : #accessing }
PTIslandGrammarCTest >> testSimpleFunction [
	self parse: '__kmalloc(size_t size, gfp_t flags)
{
	return (void *)NULL;
}' rule: #function
]
