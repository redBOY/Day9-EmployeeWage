#!/bin/bash -x


dailyWagePerHrs=20
numOfDays=20
isFullTime=2
isPartTime=1
randomCheck=$(( RANDOM%3 ))
maxHrsInMonth=20

totalWrkDays=0
totalEmpHrs=0

declare -A dailywage

function getWrkHrs() {
   local $randomCheck=$1
   case $randomCheck in
               $isFullTime)
                           empHrs=8 ;;
               $isPartTime)
                           empHrs=4 ;;
               *)
                           empHrs=0 ;;
   esac
   echo $empHrs
}

function getEmpwage() {
	local empHrs=$1
	echo $(( $empHrs*$dailyWagePerHrs ))
}

while [[ $totalWrkDays -lt $numOfDays && $totalEmpHrs -lt  $maxHrsInMonth ]]
do
   ((totalWrkDays++))
   randomCheck=$(( RANDOM%3 ));
   empHrs="$( getWrkHrs $randomCheck )"
   totalEmpHrs=$(( $totalEmpHrs + $empHrs ))
	dailywage["day"$totalWrkDays]="$( getEmpwage $empHrs )"
done
   totalSalary=$(( $totalEmpHrs*$dailyWagePerHrs ))
   echo $totalSalary
	echo ${dailywage[@]}
	echo ${!dailywage[@]}
