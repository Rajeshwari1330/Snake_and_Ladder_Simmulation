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

function ladderCheck()
{
for value in ${ladder[@]}
do
        if(($value==$start))
        then
                echo "the position is $start, you got a ladder."
                start=`expr $start + $dieValue`
                echo "the position is $start"
		echo "------------------------------------------"
                break
        fi
done
}

function snakeCheck()
{
for value in ${snake[@]}
do
        if(($value==$start))
        then
                echo "The position is $start"
                start=`expr $start - $dieValue`
                start=`expr $start - $dieValue`
                echo "You got a snake, the position is $start"
		echo "-----------------------------------------"
                break
        fi
done
}

winPosition=100
zero=0
dieCount=0

while(($start<$winPosition+1))
do
	let "dieCount = dieCount+1"
        die
        start=`expr $start + $dieValue`
        newStart=$start
        ladderCheck
        snakeCheck
        if(($newStart==$start))
        then
                echo "You dont get any snake or ladder, you are in NO PLAY condition."
                echo "Player is at $start now"
		echo "---------------------------------------------------------------"
        fi

	if(($start<$zero))
        then
                start=0
                echo "player is at $start"

	elif(($start>$winPosition))
        then
                start=`expr $start - $dieValue`
                echo "player is at same position $start"

        elif(($start==$winPosition))
        then
		echo "Player Won."
		echo "Die is rolled $dieCount times. "
                exit
	fi
done
