mkdir yolo_data
mkdir yolo_data/images
mkdir yolo_data/labels
mkdir yolo_data/images/train
mkdir yolo_data/images/val
mkdir yolo_data/labels/train
mkdir yolo_data/labels/val

cp data/train/images/*.jpg yolo_data/images/train/
cp data/val/images/*.jpg yolo_data/images/val/
cp data/train/annotations/*.xml yolo_data/labels/train
cp data/val/annotations/*.xml yolo_data/labels/val

pip install pillow

python utils/xml2yolo.py --classes $(pwd)/artifacts/damage_list.txt --anns $(pwd)/yolo_data/val/annotations
python utils/xml2yolo.py --classes $(pwd)/artifacts/damage_list.txt --anns $(pwd)/yolo_data/train/annotations

rm $(pwd)/yolo_data/val/annotations/*.xml
rm $(pwd)/yolo_data/train/annotations/*.xml