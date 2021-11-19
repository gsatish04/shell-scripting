Print() {

  LSPACE=$(echo $1 | awk '{print length}')
  SPACE=$((MSPACE-$LSPACE))
  SPACES=""
  while [ $SPACE -gt 0 ]; do
    SPACES="$SPACES$(echo ' ')"
    SPACE=$(($SPACE-1))
  done

  echo -n -e "\e[1m$1${SPACEs}\e[0m ..."
  echo -e "\n\e[36m==================$1================\e[0m" >>$LOG
}


Stat(){
if [ $? -eq 0 ] ; then
  echo -e "\e[1;32mSUCCESS\e[0m"
else
    echo -e "\e[1;31mfailure\e[0m"
    echo -e "\e[1;33m Script Failed and check the detailed log in $LOG file\e[0m"
    exit1

fi
}

LOG=/tmp/roboshop.log
rm -f $LOG