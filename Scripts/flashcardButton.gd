extends Node

@export var answer : int

func checkAnswer():
	SignalManager.emitAnswerCheck(answer)
