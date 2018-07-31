if false; then
python3 -m tensorflow.python.tools.optimize_for_inference \
  --input=tf_files/retrained_graph.pb \
  --output=tf_files/optimized_graph.pb \
  --input_names="input" \
  --output_names="final_result"

python3 -m scripts.quantize_graph \
  --input=tf_files/optimized_graph.pb \
  --output=tf_files/rounded_graph.pb \
  --output_node_names=final_result \
  --mode=weights_rounded
fi


IMAGE_SIZE=224

rm tf_files/optimized_graph.lite

if false; then
toco \
  --graph_def_file=tf_files/retrained_graph.pb \
  --output_file=tf_files/optimized_graph.lite \
  --input_format=TENSORFLOW_GRAPHDEF \
  --output_format=TFLITE \
  --input_shape=1,${IMAGE_SIZE},${IMAGE_SIZE},3 \
  --input_array=input \
  --output_array=final_result \
  --inference_type=FLOAT \
  --input_data_type=FLOAT
fi

toco   --input_file=tf_files/retrained_graph.pb   --output_file=tf_files/optimized_graph.lite   --input_format=TENSORFLOW_GRAPHDEF   --output_format=TFLITE   --input_shape=1,${IMAGE_SIZE},${IMAGE_SIZE},3   --input_array=input   --output_array=final_result   --inference_type=FLOAT   --input_data_type=FLOAT


cp tf_files/rounded_graph.pb ~/tensorflow/tensorflow/examples/android/assets/tensorflow_inception_graph.pb
cp tf_files/retrained_labels.txt ~/tensorflow/tensorflow/examples/android/assets/imagenet_comp_graph_label_strings.txt 

cp tf_files/optimized_graph.lite android/tflite/app/src/main/assets/graph.lite
cp tf_files/retrained_labels.txt android/tflite/app/src/main/assets/labels.txt

ls -al ~/tensorflow/tensorflow/examples/android/assets
ls -al android/tflite/app/src/main/assets/*
