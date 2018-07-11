# !/bin/bash
 
# Take user Input
echo "Enter Two numbers : "
read a
read b
 
# Input type of operation
echo "Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read ch
 
# Switch Case to perform
# calulator operations
case $ch in
  1)res=`expr $a + $b`
    echo $res
  ;;
  2)res=`expr $a - $b`
    echo $res
;;
  3)res=`expr $a \* $b`
    echo $res

  ;;
  4)res=`expr $a / $b`
    echo $res

  ;;
  *)echo "Wrong choice"
  ;;
esac
echo "Result : $res"

