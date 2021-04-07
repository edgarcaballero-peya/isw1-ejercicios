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

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 21:39:02'!
* unMultiplicando

	^ unMultiplicando.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:46:25'!
+ unSumando

	^unSumando next! !

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 21:37:09'!
- unSustraendo

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:41:19'!
/ unDivisor
	^ self.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 21:36:19'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'Resta Invalida'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:33:44'!
multiplicar: unMultiplicando

	^ unMultiplicando.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:31:42'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 21:38:35'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:39:54'!
* unMultiplicando
	
	(unMultiplicando = I)	 ifTrue: [^self].
	^ ((unMultiplicando previous) * self) + self. ! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:56:14'!
+ unSumando

	^self previous + unSumando next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 21:34:43'!
- unSustraendo

	^ unSustraendo resultadoDeRestarme: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:43:28'!
/ unDivisor

	| result temp |
	temp _ unDivisor.
	result _ self.
	[temp = I] whileFalse: [
		result _ result - unDivisor.
		temp _ temp - I. 
		].
	
	^ result. ! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:42:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	'No se puede dividir un numero por otro mayor. Division Invalida'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:43:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:32:52'!
multiplicar: unNumero

	^ ((unNumero previous) multiplicar: self) + self. ! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 21:07:59'!
next

	next ifNil:[
		next _ self createChildNamed: self name, 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:57:01'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:19:22'!
resultadoDeRestarme: unNumero

	^ unNumero previous - self previous. ! !


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

!III class methodsFor: 'previous' stamp: 'ARM 4/5/2021 21:09:08'!
previous: aNumber
	previous _ aNumber ! !


!III class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:43:36'!
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

!IIII class methodsFor: 'as yet unclassified' stamp: 'ERMC 4/6/2021 22:43:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := AnObsoleteIIIII.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!