!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 4/22/2021 17:25:26'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	secondPushedObject := 'secondObject'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:26:28'!
test01PrefixCanNotBeEmpty
	
	|  sentenceFinder|
		
	sentenceFinder _ SentenceFinderByPrefix with: self stackWithOneSentence.
	
	self
		should: [ sentenceFinder find: '']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
	
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:27:31'!
test02PrefixCanNotContainsSpaces
	
	| sentenceFinder |
	
	sentenceFinder _ SentenceFinderByPrefix with: self stackWithOneSentence.
	
	self
		should: [ sentenceFinder find: 'fir st'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixCanNotContainsSpacesErrorDescription]
	
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:28:24'!
test03CanNotFindInAEmptySenteceFinder
	
	| sentenceFinder sentencesMatchesExpected |
	
	sentenceFinder _ SentenceFinderByPrefix with: OOStack new.
	sentencesMatchesExpected _ OrderedCollection new.
		
	self assert: sentencesMatchesExpected equals: (sentenceFinder find: 'winter')
	
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:28:59'!
test04WhenThereIsNotPrefixMatchInASentenceReturnAnEmptyCollection
	
	| sentenceFinder sentencesMatchesExpected |
	
	sentenceFinder _ SentenceFinderByPrefix with: self stackWithOneSentence.
	sentencesMatchesExpected _ OrderedCollection new.
	
	self assert: sentencesMatchesExpected equals: (sentenceFinder find: 'winter')
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:34:31'!
test05FindPrefixMatchWhenFinderHasOneSentenceAndReturnTheSentence
	
	| sentenceFinder sentencesMatchesExpected stackWithOneSentence |
	
	stackWithOneSentence _ self stackWithOneSentence. 
	sentenceFinder _ SentenceFinderByPrefix with: stackWithOneSentence.
	
	sentencesMatchesExpected _ sentenceFinder find: 'north'.
	
	self assert: 1 equals: sentencesMatchesExpected size. 
	self assert: sentencesMatchesExpected first equals: stackWithOneSentence top.
	self assert: (self stackWithOneSentence) hasEqualsElementsAndTheSameSize: (sentenceFinder stackSentences).
	
	
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:30:54'!
test06GivenASentenceFinderWithMoreThanOneSentencesAndThereIsNotPrefixMatchReturnEmptyCollection
	
	| sentenceFinder sentencesMatchesExpected |

	sentenceFinder := SentenceFinderByPrefix with: self stackWithFourSentences.
	sentencesMatchesExpected _ OrderedCollection new.
	
	self assert: sentencesMatchesExpected equals: (sentenceFinder find: 'sum')
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:33:38'!
test07GivenASentenceFinderWithMoreThanOneSentencesAndThereIsPrefixMatchReturnCorrectMatchSentences
	
	| sentenceFinder sentencesExpected |
	
	sentenceFinder := SentenceFinderByPrefix with: self stackWithFourSentences.
	sentencesExpected _ OrderedCollection with: 'The winds of winter'  with: 'winter'.
	
	self assert: sentencesExpected equals: (sentenceFinder find: 'win').
	self assert:  self stackWithFourSentences hasEqualsElements: sentenceFinder stackSentences.
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ERMC 4/28/2021 23:21:53'!
test08FindSentenceWithCaseSensitive
	
	| sentenceFinder sentencesExpected |

	sentenceFinder := SentenceFinderByPrefix with: self stackWithOneSentence.
	sentencesExpected _ OrderedCollection new.
	
	self assert: sentencesExpected equals: (sentenceFinder find: 'king')
	
	 
! !


!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'ERMC 4/28/2021 23:33:38'!
assert: aStack hasEqualsElements: anotherStack.

	[aStack isNotEmpty] whileTrue: [self assert: aStack pop equals: anotherStack pop]
! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'ERMC 4/28/2021 23:34:31'!
assert: aStack hasEqualsElementsAndTheSameSize: anotherStack 
	
	self assert: aStack size equals: anotherStack size.
	self assert: aStack hasEqualsElements: anotherStack.
	 
! !


!SentenceFinderByPrefixTest methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 23:17:43'!
stackWithFourSentences
	
	| stack |
	stack _ OOStack new.
	stack push: 'winter'.
	stack push: 'Winter is coming'.
	stack push: 'The winds of winter'.
	stack push: 'Winter is here'.
	
	^stack 
! !

!SentenceFinderByPrefixTest methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 20:02:59'!
stackWithOneSentence
	
	|stackWithOneSentence|
	
	stackWithOneSentence _ OOStack new. 
	stackWithOneSentence push: 'King in the north'.
	
	^stackWithOneSentence ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'ERMC 4/27/2021 22:43:07'!
initialize
	
	
	 elements _ 	OrderedCollection new.
	! !


!OOStack methodsFor: 'stack properties' stamp: 'sgs 4/26/2021 20:54:34'!
isEmpty
	
	^elements isEmpty .
	! !

!OOStack methodsFor: 'stack properties' stamp: 'ERMC 4/28/2021 21:16:55'!
isNotEmpty
	
	^ (elements isEmpty ) not
	! !

!OOStack methodsFor: 'stack properties' stamp: 'sgs 4/26/2021 20:57:16'!
size
	
	^elements size .
	! !


!OOStack methodsFor: 'operations' stamp: 'ERMC 4/27/2021 23:04:38'!
pop 

	| top |
	top _ self top.
	elements removeLast .
	
	^top 
	! !

!OOStack methodsFor: 'operations' stamp: 'ERMC 4/28/2021 19:33:06'!
push: anElement

	elements addLast: anElement.! !

!OOStack methodsFor: 'operations' stamp: 'ERMC 4/28/2021 23:39:51'!
top 

	^ self state top
	
	! !


!OOStack methodsFor: 'operations - private' stamp: 'ERMC 4/28/2021 23:39:51'!
state

	^OOStackState howMakeToTop: self.
	
	! !

!OOStack methodsFor: 'operations - private' stamp: 'ERMC 4/27/2021 22:50:22'!
topWithElemnts
	
	^elements last.
	! !

!OOStack methodsFor: 'operations - private' stamp: 'ERMC 4/27/2021 22:51:00'!
topWithoutElements

	self error: self class stackEmptyErrorDescription.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !



!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'ERMC 4/28/2021 20:37:01'!
howMakeToTop: aStack
	
	self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'ERMC 4/28/2021 21:07:23'!
initializeWith: aStack
	
	stack _ aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'testing' stamp: 'ERMC 4/28/2021 21:09:54'!
canHandle: aStack

	self subclassResponsibility! !


!OOStackState class methodsFor: 'helper' stamp: 'ERMC 4/28/2021 23:38:51'!
howMakeToTop: aStack
	
	^(self subclasses detect: [:aStackStateClass | aStackStateClass canHandle: aStack ]) for: aStack! !


!OOStackState class methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 21:10:19'!
for: aStack

	self subclassResponsibility! !


!classDefinition: #OOEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmpty methodsFor: 'as yet unclassified' stamp: 'ERMC 4/28/2021 20:45:01'!
top

	^stack topWithoutElements.
! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmpty class' category: 'Stack-Exercise'!
OOEmpty class
	instanceVariableNames: ''!

!OOEmpty class methodsFor: 'testing' stamp: 'ERMC 4/28/2021 20:40:30'!
canHandle: aStack
	
	^aStack isEmpty ! !


!OOEmpty class methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 20:44:18'!
for: aStack 
	
	^self new initializeWith: aStack! !


!classDefinition: #OONotEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OONotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmpty methodsFor: 'as yet unclassified' stamp: 'ERMC 4/28/2021 20:45:16'!
top
	
	^stack topWithElemnts.
	
	

	! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmpty class' category: 'Stack-Exercise'!
OONotEmpty class
	instanceVariableNames: ''!

!OONotEmpty class methodsFor: 'testing' stamp: 'ERMC 4/28/2021 21:16:05'!
canHandle: aStack
	
	^ (aStack isNotEmpty)! !


!OONotEmpty class methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 20:42:49'!
for: anOOStack 

 	^self new initializeWith: anOOStack.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackSentences sentencesMatches stackBackup'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'propertie' stamp: 'ERMC 4/28/2021 21:32:19'!
stackSentences
	
	^stackSentences.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 21:32:00'!
initializeWith: anStack 

	stackSentences _ anStack.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'ERMC 4/28/2021 23:42:02'!
find: aPrefix

	self isPrefixValid: aPrefix.
	
	sentencesMatches _ OrderedCollection new.
	stackBackup _ OOStack new.
	
	self findAllSentencesMatchesWith: aPrefix.
	
	self restoreOriginalStack. 
	
	^sentencesMatches 		
! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'ERMC 4/28/2021 23:42:02'!
addSentenceIfThereIsAMatch: aPrefix
	
	| sentence |
	
	sentence _ stackSentences pop.
	
	 (sentence includesSubString: aPrefix ) ifTrue: [sentencesMatches add: sentence].
	
	stackBackup push: sentence.
	! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'ERMC 4/28/2021 23:41:40'!
findAllSentencesMatchesWith: aPrefix

	[stackSentences isNotEmpty ] whileTrue: [self addSentenceIfThereIsAMatch: aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'ERMC 4/28/2021 23:27:11'!
isPrefixValid: aPrefix
	
 	(aPrefix = '' ) ifTrue: [^self error: self class prefixEmptyErrorDescription].
	(aPrefix includesSubString: ' ') ifTrue: [^self error: self class prefixCanNotContainsSpacesErrorDescription].! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'ERMC 4/28/2021 23:41:55'!
restoreOriginalStack 
	
	[stackBackup isNotEmpty] whileTrue: [stackSentences push: stackBackup pop]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 4/27/2021 20:22:11'!
SentenceFinderIsEmptyErrorDescription
	
	'Can not search prefix in an Empty sentence finder'.! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 4/28/2021 23:27:11'!
prefixCanNotContainsSpacesErrorDescription
	
	^'No se admiten prefijos con espacios vacios'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 4/28/2021 23:26:28'!
prefixEmptyErrorDescription
	
	^'No se admiten prefijos vacios'! !


!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'ERMC 4/28/2021 23:42:20'!
with: aStack 
		
	^self new initializeWith: aStack
	! !
