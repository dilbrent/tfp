#based on examples from:
#https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/index.html#7

IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"
pkill -f "tensorboard"
tensorboard --logdir tf_files/training_summaries &

python3 -m scripts.retrain \
  --bottleneck_dir=tf_files/bottlenecks \
  --how_many_training_steps=500 \
  --model_dir=tf_files/models/ \
  --summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
  --output_graph=tf_files/retrained_graph.pb \
  --output_labels=tf_files/retrained_labels.txt \
  --architecture="${ARCHITECTURE}" \
  --image_dir=tf_files/training_pics

python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/training_pics/LegoBB8/images_079.jpg

python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/tests/test_blurrycoke.jpg 

python3 -m scripts.label_image     --graph=tf_files/retrained_graph.pb      \
  --image=tf_files/tests/test_goodtardis.jpg 
