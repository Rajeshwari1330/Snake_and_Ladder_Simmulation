#!/bin/bash -x
echo "Welcome to Snake and Ladder Simulation ...!"

ladder+=( "4" "9" "20" "28" "40" "52" "63" "74" )
snake+=( "3" "17" "35" "45" "54" "62" "87" "93" "95" "99" )

start1=0
start2=0

echo "Game Starts"
echo "player 1 is at $start1 now"
echo "player 1 is at $start2 now"

function die()
{
	dieValue=$((RANDOM%6 + 1))
        echo "The die value is : $dieValue"
}

function ladderCheck()
{
	for value in ${ladder[@]}
	do
        	if(($value==$start1))
        	then
                	echo "The player 1 is $start1, you got a ladder."
                	start1=`expr $start1 + $dieValue`
                	echo "The position is $start1"
                	break
        	fi

		if(($value==$start2))
        	then
                	echo "The player 2 is $start2, you got a ladder."
                	start2=`expr $start2 + $dieValue`
                	echo "The position is $start2"
                	break
        	fi
	done
}

function snakeCheck()
{
for value in ${snake[@]}
do
        if(($value==$start1))
        then
                echo "The position is $start1"
                start1=`expr $start1 - $dieValue`
                start1=`expr $start1 - $dieValue`
                echo "You got a snake, the position is $start1"
                break
        fi

	if(($value==$start2))
        then
                echo "The position is $start2"
                start2=`expr $start2 - $dieValue`
                start2=`expr $start2 - $dieValue`
                echo "You got a snake, the position is $start2"
                break
        fi
done
}

winPosition=100
zero=0
dieCount=0

while(($start1<$winPosition+1 || $start2<$winPosition+1))
do
	echo "-------------------------- Player 1 -------------------------------------"
	let "dieCount = dieCount+1"
        die
        start1=`expr $start1 + $dieValue`
        newStart1=$start1
        ladderCheck
        snakeCheck
        if(($newStart1==$start1))
        then
                echo "You dont get any snake or ladder, you are in NO PLAY condition."
                echo "Player 1 is at $start1 now"
        fi

	if(($start1<$zero))
        then
                start1=0
                echo "player 1 is at $start1"

	elif(($start1>$winPosition))
        then
                start1=`expr $start1 - $dieValue`
                echo "player 1 is at same position $start1"

        elif(($start1==$winPosition))
        then
		echo "Player 1 Won."
		echo "Die is rolled $dieCount times. "
                exit
	fi

	echo "-------------------------- Player 2 -------------------------------------"
        let "dieCount = dieCount+1"
        die
        start2=`expr $start2 + $dieValue`
        newStart2=$start2
        ladderCheck
        snakeCheck
        if(($newStart2==$start2))
        then
                echo "You dont get any snake or ladder, you are in NO PLAY condition."
                echo "Player 2 is at $start2 now"
        fi

        if(($start2<$zero))
        then
                start2=0
                echo "player 2 is at $start2"

        elif(($start2>$winPosition))
        then
                start2=`expr $start2 - $dieValue`
                echo "player 2 is at same position $start2"

        elif(($start2==$winPosition))
        then
                echo "Player 2 Won."
                echo "Die is rolled $dieCount times. "
                exit
        fi
done
