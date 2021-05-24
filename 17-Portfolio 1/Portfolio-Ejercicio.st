!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 13:54:06'!
createReceptiveAccountWithDeposit
	
	| account |
	
	account _ ReceptiveAccount new.
	Deposit register: 50 on: account. 
	
	^account ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/17/2021 21:05:53'!
test01UnPortfolioSePuedeCrearSinCuentas
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: 0 equals: aPortfolio balance ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 13:54:44'!
test02APortfolioWithOneAccountHasABalanceOfHisAccountBalance
	|portfolio|
	
	portfolio _ Portfolio with: self createReceptiveAccountWithDeposit.
		
	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 13:56:06'!
test03APortfolioWithOnePortfolio
	|mainPortfolio aPortfolio|
	
	aPortfolio _ Portfolio with: self createReceptiveAccountWithDeposit.
	mainPortfolio _ Portfolio with: aPortfolio.
			
	self assert: 50 equals: mainPortfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 14:00:11'!
test04APortfolioWithManyAccountHasTheSumOfTheBalance

	|mainPortfolio aPortfolio  account account2 anotherPortfolio |
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 150 on: account.
	Withdraw register: 20 on: account.
	Deposit register: 30 on: account2.
	
	aPortfolio _ Portfolio with: account.
	anotherPortfolio _ Portfolio with: aPortfolio.
		
	mainPortfolio _ Portfolio with: anotherPortfolio. 
	mainPortfolio add: account2.
	
	self assert: 160 equals: mainPortfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/22/2021 20:04:26'!
test05AnEmptyPortfolioDoNotKnowAnyTransaction

	|aPortfolio aDeposit |
	
	aDeposit _ Deposit for: 150.
	aPortfolio _ Portfolio new.
	
	self deny: (aPortfolio hasRegistered: aDeposit)
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/22/2021 20:09:35'!
test06APortfolioWithOneAccountWithATransactionKnowsTransaction

	|aPortfolio aDeposit account |
	
	account _ ReceptiveAccount new.	
	aDeposit _ Deposit register: 150 on: account.
	aPortfolio _ Portfolio new.
	
	aPortfolio add: account.
	
	self assert: (aPortfolio hasRegistered: aDeposit)
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 12:27:21'!
test07APortfolioWithManyAccountsKnowsAllTransaction

	|aPortfolio mainPortfolio aDeposit account aWithdraw account2 |
	
	account _ ReceptiveAccount new.	
	aDeposit _ Deposit register: 150 on: account.
	aPortfolio _ Portfolio new.
	aPortfolio add: account.
	
	account2 _ ReceptiveAccount new.
	Deposit register: 100 on: account2. 
	aWithdraw _ Withdraw register: 50 on: account2.  
	
	mainPortfolio _ Portfolio new.
	mainPortfolio add: account2.
	mainPortfolio add: aPortfolio.
	
	self assert: (mainPortfolio hasRegistered: aDeposit).
	self assert: (mainPortfolio hasRegistered: aWithdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 12:30:16'!
test08APortfolioWithotAnAccountHasNotAnyTransaction

	|aPortfolio |
	
	aPortfolio _ Portfolio new.

	self assert: aPortfolio transactions isEmpty
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 12:57:26'!
test09APortfolioWithOneAccountHasCorrectTransactions

	|aPortfolio aPortfolioTransactions account deposit withdraw |
	
	aPortfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 on: account.
	withdraw _ Withdraw register: 50 on: account.
	
	aPortfolio add: account. 
	aPortfolioTransactions _ aPortfolio transactions. 
	
	self assert: 2 equals: (aPortfolioTransactions) size.
	self assert: (aPortfolio transactions includes: deposit).
	self assert: (aPortfolio transactions includes: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:06:27'!
test10APortfolioWithAPortfolioKnowsTransactions

	|aPortfolio mainPortfolio aDeposit account aWithdraw aPortfolioTransactions|
	
	account _ ReceptiveAccount new.	
	aDeposit _ Deposit register: 150 on: account.
	aWithdraw _ Withdraw register: 50 on: account.
	aPortfolio _ Portfolio with: account.
	
	mainPortfolio _ Portfolio with: aPortfolio.

	aPortfolioTransactions _ mainPortfolio transactions.
	
	self assert: 2 equals: (aPortfolioTransactions) size.
	self assert: (mainPortfolio transactions includes: aDeposit).
	self assert: (mainPortfolio transactions includes: aWithdraw).	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:08:10'!
test11APortfolioWithManyAccountsReturnsAllTransactions

	|aPortfolio mainPortfolio aDeposit account aWithdraw account2 aPortfolioTransactions deposit2 |
	
	account _ ReceptiveAccount new.	
	aDeposit _ Deposit register: 150 on: account.
	aPortfolio _ Portfolio with: account.
	
	account2 _ ReceptiveAccount new.
	deposit2 _ Deposit register: 100 on: account2. 
	aWithdraw _ Withdraw register: 50 on: account2.  
	
	mainPortfolio _ Portfolio with: account2.
	mainPortfolio add: aPortfolio.
	
	aPortfolioTransactions _ mainPortfolio transactions.
	
	self assert: 3 equals: (aPortfolioTransactions) size.
	self assert: (mainPortfolio transactions includes: aDeposit).
	self assert: (mainPortfolio transactions includes: aWithdraw).
	self assert: (mainPortfolio transactions includes: deposit2).
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:23:08'!
test12APortfolioCanNotHaveDuplicatedAccount

	|aPortfolio  account |
	
	account _ ReceptiveAccount new.	
	aPortfolio _ Portfolio with: account.
	
	self should: [aPortfolio add: account ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anErrorMessage |
			self assert: Portfolio canNotAddDuplicatedAccountErrorMessage equals: anErrorMessage messageText]
 ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:21:53'!
test13APortfolioCanNotIncludeItSelf

	|aPortfolio  account |
	
	account _ ReceptiveAccount new.	
	aPortfolio _ Portfolio with: account.
	
	self should: [aPortfolio add: aPortfolio] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anErrorMessage |
			self assert: Portfolio canNotAddDuplicatedAccountErrorMessage equals: anErrorMessage messageText]
 ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:31:22'!
test14APortfolioWithManyAccountCanNotConteintDuplicatedAccount

	|aPortfolio  account mainPortfolio |
	
	account _ ReceptiveAccount new.	
	aPortfolio _ Portfolio with: account.
	
	mainPortfolio _ Portfolio with: aPortfolio.
	
	self should: [mainPortfolio add: account] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anErrorMessage |
			self assert: Portfolio canNotAddDuplicatedAccountErrorMessage equals: anErrorMessage messageText]
 ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 21:37:30'!
test15APortfolioCanNotAddAPortfolioThatContaintsADuplicatedAccount

	|aPortfolio  account mainPortfolio |
	
	account _ ReceptiveAccount new.	
	mainPortfolio _ Portfolio with: account.
	
	aPortfolio _ Portfolio with: account.
			
	self should: [mainPortfolio add: aPortfolio] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anErrorMessage |
			self assert: Portfolio canNotAddDuplicatedAccountErrorMessage equals: anErrorMessage messageText]
 ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 21:12:46'!
test16

	|aPortfolio  account mainPortfolio |
	
	account _ ReceptiveAccount new.	
	aPortfolio _ Portfolio new.
	mainPortfolio _ Portfolio with: aPortfolio.
	mainPortfolio add: account. 
	
	self should: [aPortfolio add: account] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anErrorMessage |
			self assert: Portfolio canNotAddDuplicatedAccountErrorMessage equals: anErrorMessage messageText]
 ! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'ERMC 5/17/2021 22:05:47'!
addTo: aBalance
	
	^aBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'ERMC 5/17/2021 22:05:31'!
addTo: aBalance
	
	^aBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 21:04:14'!
accounts

	^accounts! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 21:36:10'!
accountsIncludes: anAccount

"checkear si existe alguna cuenta que este incluida dentro de accounts y viceversa "
	accounts  do: [:aPortfolioOrAccount |
		(aPortfolioOrAccount isKindOf: Portfolio) ifTrue: [^aPortfolioOrAccount accounts includes: anAccount]].
	^false
	
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:35:58'!
add: anAccount 
	
	self assertCanAdd: anAccount. 
	accounts add: anAccount 
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 21:19:55'!
assertCanAdd: anAccount
	
	((self accountsIncludes: anAccount accounts) or: (anAccount = self)) ifTrue: [^self error: self class canNotAddDuplicatedAccountErrorMessage].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/22/2021 19:40:28'!
balance
	
	^accounts sum: [:account | account balance ] ifEmpty: [^0]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/22/2021 20:56:18'!
hasRegistered: aTransaction
	
	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction] ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/22/2021 19:08:00'!
initialize
	
	accounts _ OrderedCollection new! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 12:56:22'!
transactions

	| transactions |
	transactions _ OrderedCollection new.
	
	accounts do: [:anAccount | transactions addAll: anAccount transactions ].
	
	^transactions 
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 20:20:58'!
canNotAddDuplicatedAccountErrorMessage

	^'can not add account'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/23/2021 13:52:13'!
with: aReceptiveAccount 

	| porfolio |
	
	porfolio _ self new.
	porfolio add: aReceptiveAccount.
	^porfolio
	! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'ERMC 5/23/2021 21:27:01'!
accounts
	
	^self! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'ERMC 5/23/2021 21:28:20'!
includes: anAccount

	^self = anAccount! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ERMC 5/17/2021 22:06:17'!
balance

	| totalBalance |
	totalBalance _ 0.

	totalBalance _ transactions sum: [ :aTransaction | aTransaction addTo: totalBalance].
	
	^totalBalance! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
