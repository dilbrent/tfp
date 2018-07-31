mkdir -p frames
rm -r frames/*
if [ "$1" != "" ]; then
  ffmpeg -i $1 -vf scale="640:-1" frames/out%05d.jpg
fi
