mkdir -p lastpic

fswebcam --no-banner --no-info -d /dev/video$1 lastpic/pic.jpg

if [ "$2" == "show" ]; then
  eog lastpic/pic.jpg &
fi

if [ "$3" == "test" ]; then
  python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
    --image=lastpic/pic.jpg
fi

