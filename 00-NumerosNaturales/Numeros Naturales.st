!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operations' stamp: 'ERMC 4/6/2021 21:39:02'!
* unMultiplicando

	^ unMultiplicando.! !

!I class methodsFor: 'operations' stamp: 'ARM 4/5/2021 20:46:25'!
+ unSumando

	^unSumando next! !

!I class methodsFor: 'operations' stamp: 'ERMC 4/6/2021 21:37:09'!
- unSustraendo

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'operations' stamp: 'sgs 4/7/2021 19:46:26'!
/ unDivisor
	(unDivisor = self) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self.! !

!I class methodsFor: 'operations' stamp: 'sgs 4/7/2021 20:16:43'!
>unNumeroDePeano 

	^self asString size > unNumeroDePeano asString size.! !

!I class methodsFor: 'operations' stamp: 'ARM 4/5/2021 20:31:42'!
next

	^II! !


!I class methodsFor: 'error' stamp: 'sgs 4/7/2021 19:42:12'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Division Invalida'! !

!I class methodsFor: 'error' stamp: 'ERMC 4/6/2021 21:36:19'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'Resta Invalida'! !


!I class methodsFor: 'operations private' stamp: 'ERMC 4/6/2021 21:38:35'!
resultadoDeRestarme: unNumero

	^ unNumero previous.! !


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'operations private' stamp: 'ERMC 4/6/2021 22:19:22'!
resultadoDeRestarme: unNumero

	^ unNumero previous - self previous. ! !


!II class methodsFor: 'operations' stamp: 'ERMC 4/6/2021 22:39:54'!
* unMultiplicando
	
	(unMultiplicando = I)	 ifTrue: [^self].
	^ ((unMultiplicando previous) * self) + self. ! !

!II class methodsFor: 'operations' stamp: 'ARM 4/5/2021 20:56:14'!
+ unSumando

	^self previous + unSumando next! !

!II class methodsFor: 'operations' stamp: 'ERMC 4/6/2021 21:34:43'!
- unSustraendo

	^ unSustraendo resultadoDeRestarme: self.! !

!II class methodsFor: 'operations' stamp: 'sgs 4/7/2021 20:33:26'!
/ unDivisor
		
	(unDivisor > self) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	(unDivisor = self) ifTrue: [^I].
	^ ((self - unDivisor) / unDivisor) + I.	
! !

!II class methodsFor: 'operations' stamp: 'sgs 4/7/2021 20:16:04'!
>unNumeroDePeano 

	^self asString size > unNumeroDePeano asString size.! !

!II class methodsFor: 'operations' stamp: 'ARM 4/5/2021 21:07:59'!
next

	next ifNil:[
		next _ self createChildNamed: self name, 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'operations' stamp: 'ARM 4/5/2021 20:57:01'!
previous
	^previous! !


!II class methodsFor: 'error' stamp: 'sgs 4/7/2021 19:47:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Division Invalida'! !


!II class methodsFor: 'as yet unclassified' stamp: 'sgs 4/7/2021 20:36:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!


!III class methodsFor: 'as yet unclassified' stamp: 'sgs 4/7/2021 20:36:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'sgs 4/7/2021 20:36:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!