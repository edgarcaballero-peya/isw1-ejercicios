!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:33:54'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:53:26'!
defaultCatalog
	
	|aDictionary|
	aDictionary _ Dictionary new.
	
	^ aDictionary add: 'validBook' -> 100; yourself .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:34:55'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:37:50'!
test01CheakOutWithEmptyCart
	|aCart aCashier aCreditCardExpiration aCreditCardNumber aCreditCardOwner |
	
	aCart _ self createCart.
	aCashier _ Cashier new.
	
	aCreditCardNumber _ '010101010101'.
	aCreditCardExpiration _ '01010101'.
	aCreditCardOwner _ 'Pepe'.
	
	 self 
		should: [aCashier checkOut:aCart with: aCreditCardNumber and: aCreditCardExpiration to: aCreditCardOwner. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = aCashier canNotCheakOutWithEmptyCart.].! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:55:51'!
test02CheakOutWithOneItemInTheCart
	|aCart aCashier aCreditCardExpiration aCreditCardNumber aCreditCardOwner totalTransaction aCatalogo |
	
	aCart _ self createCart.
	aCart add: 'validBook'.

	aCashier _ Cashier new.
	
	aCreditCardNumber _ '010101010101'.
	aCreditCardExpiration _ '01010101'.
	aCreditCardOwner _ 'Pepe'.
	
	totalTransaction _	aCashier checkOut:aCart with: aCreditCardNumber and: aCreditCardExpiration to: aCreditCardOwner.
	
	self assert: totalTransaction equals: 100.
	
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 21:03:35'!
test03CheakOutWithManyItemsInTheCart
	|aCart aCashier aCreditCardExpiration aCreditCardNumber aCreditCardOwner totalTransaction aCatalogo |
	
	aCart _ self createCart.
	aCart add: 4 of: 'validBook'.

	aCashier _ Cashier new.
	
	aCreditCardNumber _ '010101010101'.
	aCreditCardExpiration _ '01010101'.
	aCreditCardOwner _ 'Pepe'.
	
	totalTransaction _	aCashier checkOut:aCart with: aCreditCardNumber and: aCreditCardExpiration to: aCreditCardOwner.
	
	self assert: totalTransaction equals: 400.
	
	
	! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'sgs 6/11/2021 20:26:10'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'sgs 6/11/2021 21:02:56'!
assertIsValidQuantity: aQuantity

	(aQuantity strictlyPositive) ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 21:02:14'!
totalAmount
	
	
	^items sum:[:aBook |catalog at: aBook] ifEmpty: [^0].
	 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:39:49'!
assertIsValidCart: aCart

	^(aCart isEmpty) ifTrue: [ self error: self canNotCheakOutWithEmptyCart.].
! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'sgs 6/10/2021 20:18:11'!
canNotCheakOutWithEmptyCart
	
	^'Invalidad Cart'! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'sgs 6/11/2021 20:40:01'!
checkOut: aCart with: aCreditCardNumber and: aCreditCardExpiration to: aCreditCardOwner
	
	self assertIsValidCart: aCart .
	
	^aCart totalAmount.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'sgs 6/10/2021 20:51:20'!
initializeWith: aSalesBook
	
	
	salesBook _ aSalesBook.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'sgs 6/10/2021 20:50:46'!
initializeWith: aSalesBook
	
	^self new initializeWith: aSalesBook.! !
