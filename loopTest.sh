./takePic.sh $1 show notest
while [ 1 -lt 2 ]
do
  ./takePic.sh $1 noshow test
  sleep .1
done
