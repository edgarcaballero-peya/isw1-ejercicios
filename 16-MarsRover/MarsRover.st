!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 22:43:47'!
test01ElMarsRoversEsCorrectamenteCreadoIniciandoEnUnPuntoYApuntandoAUnPuntoCardinal
	
	| aCardinalPoint marsR startingPoint |
	startingPoint _ 1@1.
	aCardinalPoint _ #North.
	marsR _ MarsRover at: startingPoint pointingTo: aCardinalPoint.
	
	self assert: marsR position equals: startingPoint.
	self assert: marsR cardinalPoint equals: aCardinalPoint.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 22:50:42'!
test02CanNotCreateAMarsRoverWithAnInvalidPosition
	
	self should: [MarsRover at: 5 pointingTo: #North ]
	 raise: Error
	 withExceptionDo: [:anError | 
		self assert: anError messageText = MarsRover invalidPositionErrorDescription]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:03:33'!
test03CanNotCreateAMarsRoverWithAnInvalidCardinalPoint
	
	self should: [MarsRover at: 1@1 pointingTo: 'North' ]
	 raise: Error
	 withExceptionDo: [:anError | 
		self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:19:12'!
test04IfAnInvalidCommandIsReceivedPositioAnCardinalPointIsMaintained
	| marsR |
	
	marsR _ MarsRover at: 1@1 pointingTo: #North.
	marsR processCommands: 'a'.
	
	self assert: marsR position equals: 1@1.
	self assert: marsR cardinalPoint equals: #North.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:32:12'!
test05ShouldMoveForwardIfForwardCommandIsReceived
	
	| marsR |
	marsR _ MarsRover at: 1@1 pointingTo: #North.
	marsR processCommands: 'f'.
	
	self assert: marsR position equals: 1@2.
	self assert: marsR cardinalPoint equals: #North.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'ERMC 5/16/2021 22:35:58'!
initializeAt: aPoint pointingTo: aCardinalPoint 

	position _ aPoint.
	cardinalPoint _ aCardinalPoint.! !

!MarsRover methodsFor: 'initialization' stamp: 'ERMC 5/16/2021 22:37:49'!
position

	^position! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 22:41:32'!
cardinalPoint

	^cardinalPoint! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:30:35'!
processCommands: commandsPackedInString
	
	(commandsPackedInString = 'a') ifFalse: [position _ (position x)@(position y +1)]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:16:15'!
at: aPoint pointingTo: aCardinalPoint 
	
	(aPoint class = Point) ifFalse: [self error: self invalidPositionErrorDescription].
	(self isAcardinalPoint: aCardinalPoint ) ifFalse: [self error: self invalidCardinalPointErrorDescription].
	^self new initializeAt: aPoint pointingTo: aCardinalPoint.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:00:37'!
invalidCardinalPointErrorDescription
	
	'invalid cardinal Point'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 22:50:13'!
invalidPositionErrorDescription
	
	'invalid cardinal point'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ERMC 5/16/2021 23:16:31'!
isAcardinalPoint: aCardinalPoint
	
	| points |
	points _ OrderedCollection with: #North with: #East with: #West with: #South.
	
	^points includes: aCardinalPoint.
	
	! !
