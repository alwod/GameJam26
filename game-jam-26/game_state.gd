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

# Events
var victim_gave_mask : bool = false

var intro_lights_out : bool = false
var intro_lights_on : bool = false
var intro_resume_music : bool = false

var event_accuse : bool = false
var event_game_over : bool = false
var event_game_win : bool = false
