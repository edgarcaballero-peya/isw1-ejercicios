!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:31:49'!
assertThatCustomerBook: aCustomerBook numberOfActiveCustomersAre: activeUser andSuspendedUsers: suspendedUsers

	self assert: activeUser equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedUsers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: activeUser + suspendedUsers equals: aCustomerBook numberOfCustomers.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:28:25'!
assertThatEvaluateOperation: aClosure shouldNotTakeMoreThan: aMaxTime

	| millisecondsBeforeRunning millisecondsAfterRunning  |
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aMaxTime
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:34:41'!
createCustomerBookAddAndSuspend: aCustomer
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	^customerBook.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:18:08'!
raiseErrorCantSuspendWhenTryToSuspend: aClient in: aCustomerBook
	
	[aCustomerBook suspendCustomerNamed: aClient. self fail]
		on: CantSuspend 
		do:  [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:28:45'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook  |
	
	customerBook := CustomerBook new.
	
	self assertThatEvaluateOperation: [customerBook addCustomerNamed: 'John Lennon'.] shouldNotTakeMoreThan: 50 * millisecond ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:28:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook  paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.

	self assertThatEvaluateOperation: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100 * millisecond ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:32:33'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook _ self createCustomerBookAddAndSuspend: 'Paul McCartney'.

	self assertThatCustomerBook: customerBook numberOfActiveCustomersAre: 0 andSuspendedUsers: 1
.	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:35:35'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.

	customerBook:= self createCustomerBookAddAndSuspend: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatCustomerBook: customerBook numberOfActiveCustomersAre: 0 andSuspendedUsers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:32:33'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook:= self createCustomerBookAddAndSuspend: 'John Lennon'.
	
	self raiseErrorCantSuspendWhenTryToSuspend: 'George Harrison' 
		 in: customerBook 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 4/13/2021 22:32:33'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon _ 'John Lennon'.
			
	customerBook _ self createCustomerBookAddAndSuspend: 'John Lennon'.
	
	self raiseErrorCantSuspendWhenTryToSuspend: johnLennon 
		in: customerBook 
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 4/13/2021 23:45:58'!
deleteACustomer: aName from: aCustomerCollection
 
	1 to: aCustomerCollection size do: 
	[ :index |
		aName = (aCustomerCollection at: index)
			ifTrue: [
				aCustomerCollection removeAt: index.
				^ aName 
			] 
	].
	^nil! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 4/13/2021 23:52:47'!
removeCustomerNamed: aName 
 
	"(self deleteACustomer: aName from: active) ifNil: [(self deleteACustomer: aName from: suspended) ifNil: [^NotFound signal]]."
	
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal]]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !
