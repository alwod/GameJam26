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

var start_game : bool = false

var event_bad_accuse : bool = false
var display_bad_accuse : bool = false

var event_game_over : bool = false
var display_game_over : bool = false

var event_game_win : bool = false
var display_game_win : bool = false

var has_info_for_loner : bool = false

var play_wrong_mask_sound : bool = false
var play_correct_mask_sound : bool = false
