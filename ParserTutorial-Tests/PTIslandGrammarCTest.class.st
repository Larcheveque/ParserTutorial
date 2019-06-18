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

{ #category : #accessing }
PTIslandGrammarCTest >> testWhileLoop1 [
	self parse: 'while (true)
		{
i += 5;
		}' rule: #whileLoop
]

{ #category : #accessing }
PTIslandGrammarCTest >> testWhileLoop5 [
	self parse: 'while (check_range(V_DATA_START, V_DATA_END,
				   uncompressed_image_start,
				   uncompressed_image_end))
		{
#if 0
			uncompressed_image_start += K_COPY_IMAGE_SIZE;
			uncompressed_image_end += K_COPY_IMAGE_SIZE;
			initrd_image_start += K_COPY_IMAGE_SIZE;
#else
			/* Keep as close as possible to end of BOOTP image. */
			uncompressed_image_start += PAGE_SIZE;
			uncompressed_image_end += PAGE_SIZE;
			initrd_image_start += PAGE_SIZE;
#endif
		}' rule: #whileLoop
]
