# Create folder
mkdir $(pwd)/VOCDATA
mkdir $(pwd)/VOCDATA/Annotations
mkdir $(pwd)/VOCDATA/ImageSets
mkdir $(pwd)/VOCDATA/ImageSets/Main
mkdir $(pwd)/VOCDATA/JPEGImages

# Generate txt
ls $(pwd)/data/val/annotations/ | sed -e 's/\.xml$//' | sort -n | tee -a $(pwd)/VOCDATA/ImageSets/Main/test.txt
ls $(pwd)/data/val/annotations/ | sed -e 's/\.xml$//' | sort -n | tee -a $(pwd)/VOCDATA/ImageSets/Main/val.txt
ls $(pwd)/data/train/annotations/ | sed -e 's/\.xml$//' | sort -n | tee -a $(pwd)/VOCDATA/ImageSets/Main/train.txt

# Copy annotations
cp $(pwd)/data/train/annotations/*.xml $(pwd)/VOCDATA/Annotations
cp $(pwd)/data/val/annotations/*.xml $(pwd)/VOCDATA/Annotations

# Copy images
cp $(pwd)/data/val/images/*.jpg $(pwd)/VOCDATA/JPEGImages
cp $(pwd)/data/train/images/*.jpg $(pwd)/VOCDATA/JPEGImages