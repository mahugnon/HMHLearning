Class {
	#name : #HMHDynamicSpec,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
		'collection',
		'label'
	],
	#category : #HMHLearning
}

{ #category : #'instance creation' }
HMHDynamicSpec class >> on: aCollection [
	| inst |
	inst := self basicNew.
	inst collection: aCollection.
	inst initialize.
	^ inst
]

{ #category : #specs }
HMHDynamicSpec class >> runMe [
	<script>
	(self on: #(1 2 3)) openWithSpec
]

{ #category : #accessing }
HMHDynamicSpec >> collection [
	^ collection
]

{ #category : #accessing }
HMHDynamicSpec >> collection: anObject [
	collection := anObject
]

{ #category : #initialization }
HMHDynamicSpec >> initializeWidgets [
	label := self newLabel.
	label
		label:
			'An array with ' , collection size asString
				,
					'
elements:'.
	1 to: collection size do: [ :count | 
		| model |
		model := self instantiate: MDMetricPresenter .
		"model text: (collection at: count) asString".
		self assign: model to: ('txt_' , count asString) asSymbol ]
]

{ #category : #accessing }
HMHDynamicSpec >> label [
	^ label
]

{ #category : #accessing }
HMHDynamicSpec >> label: anObject [
	label := anObject
]

{ #category : #initialization }
HMHDynamicSpec >> layout [
	| col |
	col := SpecColumnLayout composed.
	col add: #label.
	1 to: collection size do: [ :count | col add: ('txt_' , count asString) asSymbol ].
	^ col
]
