extends Resource
class_name flashcard

@export_category("Title")
@export var question : String

@export_category("Answers")
@export var possibleAnswers : Array[String] = []
@export var correctAnswer : int
