#!/bin/bash -x
echo "Welcome to Snake and Ladder Simulation ...!"

ladder+=( "4" "9" "20" "28" "40" "52" "63" "74" )
snake+=( "3" "17" "35" "45" "54" "62" "87" "93" "95" "99" )

start=0

echo "Game Starts"
echo "player 1 is at $start now"

function die()
{
	dieValue=$((RANDOM%6 + 1))
        echo "The die value is : $dieValue"
}
die
