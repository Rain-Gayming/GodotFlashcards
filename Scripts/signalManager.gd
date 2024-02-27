extends Node

signal answerCheck(answer)

func emitAnswerCheck(answer : int):
	emit_signal("answerCheck", answer)
