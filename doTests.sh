python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/training_pics/LegoBB8/images_079.jpg

python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/tests/test_blurrycoke.jpg 

python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/tests/test_goodtardis.jpg 
