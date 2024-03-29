#!/bin/bash

chr() {
  printf \\$(printf '%03o' $1)
}

ord() {
  printf '%d' "'$1"
}

ord_a=$(ord A)
number=$(ord $1)
next_to_last=$(($number-1))

default_diff=$(($number - $ord_a)) 

diff_to_a=0

i=65
while [ $i -le $number ]
do
  j=$(($number-$i))
  left=j
  while [ $j -gt 0 ]
  do
    printf ' '
    j=$(($j-1))
  done  

  chr $i

  diff_to_a=$(( $i - $ord_a)) 

  spaces_at_right=0
  if [ $diff_to_a -ne "0" ]; then
  
   spaces_at_right=$(($diff_to_a * 2 + $left - 1));

    while [ $spaces_at_right -gt 0 ]
    do
      printf ' '
      spaces_at_right=$(($spaces_at_right-1))
    done

    chr $i    
  fi

  i=$(( $i + 1 ))

  echo
done

i=$next_to_last
while [ $i -ge $ord_a ]
do
  j=$(($number-$i))
  left=j
  while [ $j -gt 0 ]
  do
    printf ' '
    j=$(($j-1))
  done  


  chr $i

  diff_to_a=$(( $i - $ord_a)) 

  spaces_at_right=0
  if [ $diff_to_a -ne "0" ]; then
  
   spaces_at_right=$(($diff_to_a * 2 + $left - 1));

    while [ $spaces_at_right -gt 0 ]
    do
      printf ' '
      spaces_at_right=$(($spaces_at_right-1))
    done

    chr $i    
  fi


  i=$(( $i - 1 ))

  echo
done
