Class {
	#name : #BaselineOfParserTutorial,
	#superclass : #BaselineOf,
	#category : #BaselineOfParserTutorial
}

{ #category : #baselines }
BaselineOfParserTutorial >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'PetitParser2Gui'
				with: [ spec repository: 'github://kursjan/petitparser2' ].
			spec
				baseline: 'PetitParserTooling'
				with: [ spec repository: 'github://Larcheveque/PetitParserTooling' ] ]
]
