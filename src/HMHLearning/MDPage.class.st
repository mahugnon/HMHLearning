Class {
	#name : #MDPage,
	#superclass : #ComposablePresenter,
	#instVars : [
		'tabManager',
		'mooseModelView'
	],
	#category : #HMHLearning
}

{ #category : #specs }
MDPage class >> defaultSpec [
	<spec>
	^ SpecRowLayout composed
		add: #mooseModelView;
		add: #tabManager;
		yourself
]

{ #category : #specs }
MDPage class >> runMe [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
MDPage >> exampleTab [
	| tab |
	tab := self newTab.
	tab
		label: 'Example';
		closeable: false;
		icon: (tab iconNamed: #smallPaint);
		presenter: (self instantiate: self pageClass).
	^ tab
]

{ #category : #initialization }
MDPage >> exampleTab2 [
	| tab |
	tab := self newTab.
	tab
		label: 'Example2';
		closeable: false;
		icon: (tab iconNamed: #thumbUp);
		presenter: (self instantiate: self pageClass).
	^ tab
]

{ #category : #initialization }
MDPage >> initializeWidgets [
	tabManager := self newTabManager.
	mooseModelView := self instantiate: MVSMooseViewPresenter.
	"tabManager whenTabSelected: [ self updateTitle ]."
	tabManager
		addTab: self exampleTab;
		addTab: self exampleTab2
	"addTab: self commentTab"
]

{ #category : #accessing }
MDPage >> mooseModelView [
	^mooseModelView
]

{ #category : #initialization }
MDPage >> pageClass [
^MVSMainPresenter 
]

{ #category : #accessing }
MDPage >> tabManager [
	^ tabManager
]
