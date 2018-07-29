while [ 1 -lt 2 ]
do
  fswebcam -d /dev/video0 ./test.jpg > lastout.txt
  python3 -m scripts.label_image --graph=tf_files/retrained_graph.pb --image=./test.jpg
  sleep .1
done
