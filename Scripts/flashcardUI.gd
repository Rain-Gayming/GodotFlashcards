extends Node

@export_category("Flashcards")
@export var currentFlashcards : flashcardDatabase
@export var currentFlashcard : flashcard
@export var shuffledAnswers : Array[String] = []

@export_category("UI")
@export var questionText : RichTextLabel
@export var answerTexts : Array[RichTextLabel]

func _ready():
	SignalManager.connect("answerCheck", checkAnswer)
	getNewFlashcard()

func getNewFlashcard():
	var rng = RandomNumberGenerator.new()
	var newSet = currentFlashcards.flashcards[rng.randi_range(0, currentFlashcards.flashcards.size() - 1)]
	var newCard = newSet.cards[rng.randi_range(0, newSet.cards.size() - 1)]
	currentFlashcard = newCard
	
	questionText.text = "[center] " + currentFlashcard.question
	
	shuffledAnswers = currentFlashcard.possibleAnswers
	shuffledAnswers.shuffle()
	
	var i = 0
	for answer in shuffledAnswers:
		i += 1
		answerTexts[i - 1].text = shuffledAnswers[i - 1]

func checkAnswer(answer : int):
	if answer == currentFlashcard.correctAnswer:
		print("Answer correct")
		getNewFlashcard()
	else:
		print("Answer wrong")
