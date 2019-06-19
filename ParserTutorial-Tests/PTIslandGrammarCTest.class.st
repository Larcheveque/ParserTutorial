Class {
	#name : #PTIslandGrammarCTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'ParserTutorial-Tests'
}

{ #category : #accessing }
PTIslandGrammarCTest >> parserClass [
	^ PTIslandCGrammar 
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInCurlyBraces1 [
	self parse: '{
			soft_qbb = temp & 7;
		}' rule: #codeInCurlyBraces
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInCurlyBraces2 [
	self parse: '{}' rule: #codeInCurlyBraces
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInCurlyBraces3 [
	self parse: '{
			if (temp & 8) { /* Is there a QBB? */
				soft_qbb = temp & 7;
				wildfire_hard_qbb_mask |= (1 << hard_qbb);
				wildfire_soft_qbb_mask |= (1 << soft_qbb);
			}
			temp >>= 4;
		}' rule: #codeInCurlyBraces
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInParenthesis1 [
	self parse: '(i = 0; i < 2; i++)' rule: #codeInParenthesis
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInParenthesis2 [
	self parse: '()' rule: #codeInParenthesis
]

{ #category : #accessing }
PTIslandGrammarCTest >> testCodeInParenthesis3 [
	self parse: '(i = 0; (i < 2); i++)' rule: #codeInParenthesis
]

{ #category : #accessing }
PTIslandGrammarCTest >> testForLoop1 [
	self parse: 'for (i = 0; i < 2; i++) {
		}' rule: #forLoop
]

{ #category : #accessing }
PTIslandGrammarCTest >> testForLoop2 [
	self parse: 'for (i = 0; i < 2; i++) {
	break;
		}' rule: #forLoop
]

{ #category : #accessing }
PTIslandGrammarCTest >> testForLoop3 [
	self parse: 'for (hard_qbb = 0; hard_qbb < WILDFIRE_MAX_QBB; hard_qbb++) {
			if (temp & 8) { /* Is there a QBB? */
				soft_qbb = temp & 7;
				wildfire_hard_qbb_mask |= (1 << hard_qbb);
				wildfire_soft_qbb_mask |= (1 << soft_qbb);
			}
			temp >>= 4;
		}' rule: #forLoop
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
PTIslandGrammarCTest >> testIdentifier5 [
	self fail: 'ans wer' rule: #identifier
]

{ #category : #accessing }
PTIslandGrammarCTest >> testIdentifier6 [
	self parse: 'AnSwEr42' rule: #identifier
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
PTIslandGrammarCTest >> testWhileLoop2 [
	self parse: 'while (true)
		{}' rule: #whileLoop
]

{ #category : #accessing }
PTIslandGrammarCTest >> testWhileLoop3 [
	self parse: 'while (true)
		{ while (false){}}' rule: #whileLoop
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
