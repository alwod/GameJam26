extends Node

var current_dialogue : DialogueResource

var is_talking : bool = false

enum Masks {
	DEFAULT,
	ARISTROCRAT,
	COURTESAN,
	STAFF,
	GUARD,
	DIPLOMAT,
	FOOL
}

var current_mask  = Masks.DEFAULT

func change_mask(mask) -> bool:
	current_mask = mask
	# Really hacky way of calling this method in an if statement
	return true
