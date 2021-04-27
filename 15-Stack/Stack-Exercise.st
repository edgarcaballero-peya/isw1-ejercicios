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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:42:44'!
test01NoSePuedeUtilizarPrefijosVacios
	
	| stack firstPushedObject prefijo  xxx|
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	stack push: firstPushedObject.
	prefijo := ' '.
	xxx := SentenceFinderByPrefix new initializeWith: stack.
	self
		should: [ xxx find: prefijo. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: stack top = firstPushedObject.
			self assert: anError messageText = SentenceFinderByPrefix prefijoEmptyErrorDescription ]
	
	
	 
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:50:07'!
test02ElPrefijoNoPuedeContenerEspaciosVacios
	
	| stack firstPushedObject prefijo  xxx|
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	stack push: firstPushedObject.
	prefijo := 'fi rst'.
	xxx := SentenceFinderByPrefix new initializeWith: stack.
	self
		should: [ xxx find: prefijo. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: stack top = firstPushedObject.
			self assert: anError messageText = SentenceFinderByPrefix elPrefijoNoPuedeTenerEspaciosVaciosErrorDescription ]
	
	
	 
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'sgs 4/26/2021 20:54:34'!
initialize
	
	
	 elements := 	OrderedCollection new.
	! !


!OOStack methodsFor: 'xxxx' stamp: 'sgs 4/26/2021 20:54:34'!
isEmpty
	
	^elements isEmpty .
	! !

!OOStack methodsFor: 'xxxx' stamp: 'sgs 4/26/2021 20:57:16'!
size
	
	^elements size .
	! !


!OOStack methodsFor: 'operations' stamp: 'sgs 4/26/2021 18:00:22'!
pop 
"
	 elements isEmpty ifTrue: [self error: self class stackEmptyErrorDescription].
	^elements removeFirst.
"
	^OOStackState comoHagoPop: self.! !

!OOStack methodsFor: 'operations' stamp: 'sgs 4/26/2021 20:54:34'!
push: aElement

	elements addFirst: aElement.! !

!OOStack methodsFor: 'operations' stamp: 'sgs 4/26/2021 17:59:06'!
top 
"	elements isEmpty ifTrue: [self error: self class stackEmptyErrorDescription].

	^elements first.
"
	^OOStackState comoHagoTop: self.! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:15:24'!
haceElPopConElementos
	
	|element|
	
	element:= elements first.
	elements removeFirst.
	^element.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 20:55:20'!
haceElPopConLaBase.

	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:11:28'!
haceElTopConElementos.
	
	^elements first.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 20:56:01'!
haceElTopConLaBase

	self error: self class stackEmptyErrorDescription.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 15:41:11'!
initialize
	^self new initialize.! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:26:19'!
comoHagoPop: aStack
	|aSackSatet|
	(aStack size < 1) ifTrue: [ aSackSatet:= OOEmpty new ] ifFalse: [aSackSatet := OONotEmpty  new].
	^aSackSatet comoHagoPop: aStack.! !

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:26:25'!
comoHagoTop: aStack

	|aSackSatet|
	(aStack size < 1) ifTrue: [ aSackSatet:= OOEmpty new] ifFalse: [aSackSatet := OONotEmpty  new].
	
	^aSackSatet comoHagoTop: aStack.! !


!classDefinition: #OOEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmpty methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 20:56:11'!
comoHagoPop: aStack

	^aStack haceElPopConLaBase.
! !

!OOEmpty methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 20:56:15'!
comoHagoTop: aStack

	^aStack haceElTopConLaBase.
! !


!classDefinition: #OONotEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OONotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmpty methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:12:19'!
comoHagoPop: aStack
	
	^aStack haceElPopConElementos.
	
	

	! !

!OONotEmpty methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:12:15'!
comoHagoTop: aStack
	
	^aStack haceElTopConElementos.
	
	

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:59:29'!
find: unPrefijo
	(unPrefijo findString: ' ' > 1) ifTrue: [^self error: self class elPrefijoNoPuedeTenerEspaciosVaciosErrorDescription].
	
	self error: self class prefijoEmptyErrorDescription.
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:42:07'!
initializeWith: unStack
	
	stack:= unStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:50:42'!
elPrefijoNoPuedeTenerEspaciosVaciosErrorDescription
	
	^'No se admiten prefijos con espacios vacios'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'sgs 4/26/2021 21:35:48'!
prefijoEmptyErrorDescription
	
	^'No se admiten prefijos vacios'! !

OOStack initialize!