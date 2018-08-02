#based on examples from:
#https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/index.html#7

IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"
pkill -f "tensorboard"
tensorboard --logdir tf_files/training_summaries &

python3 -m scripts.retrain \
  --bottleneck_dir=tf_files/bottlenecks \
  --how_many_training_steps=4000 \
  --model_dir=tf_files/models/ \
  --summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
  --output_graph=tf_files/retrained_graph.pb \
  --output_labels=tf_files/retrained_labels.txt \
  --architecture="${ARCHITECTURE}" \
  --image_dir=tf_files/training_pics

./doTests.sh

./prepTFLite.sh

