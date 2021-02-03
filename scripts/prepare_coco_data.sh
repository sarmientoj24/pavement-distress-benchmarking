# For MMDetection usage or anything that uses COCO JSON
python ../utils/xml2json.py --ann_dir $(pwd)/data/train/annotations/ --output $(pwd)/data/train.json
python ../utils/xml2json.py --ann_dir $(pwd)/data/val/annotations/ --output $(pwd)/val/train.json
