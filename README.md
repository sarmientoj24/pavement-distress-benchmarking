# pavement-distress-benchmarking
Repository for Benchmarking Pavement Distress Detection

## Tools:
- Docker: Training and testing without the hassle of reinstalling and affecting the environment
- Pytorch: weapon of choice for most DL tasks
- Pytorch Lightning: makes Pytorch a little bit easier to maintain
- OpenCV: image manipulation, processing, CLAHE, etc.
- YOLOv5, mmdetection, detectron: libraries with model Zoo and easy to use interface for training
- wandb: tracking training online
- and a looot of bash scripting to automate the testing and retrieval of data.

This is trained on a server with a GPU but prototyped on Google Colab to save some $$$

## Training with YOLOv5
### Setup Mayon Environment
```
git clone https://github.com/sarmientoj24/pavement-distress-benchmarking.git
cd pavement-distress-benchmarking
chmod a+x scripts/*.sh
./scripts/prepare_env.sh
```

### Download YOLOv5 RDDC2020 Dataset 
For training large dataset, use *_full* while *_cl* contains dataset that went through CLAHE enhancement.
```
./scripts/download_rddc_full.sh
./scripts/prepare_yolo_data.sh
```

### Clone YOLOv5 and setup Docker
If you have Docker 18 and below, install nvidia-docker
```
git clone https://github.com/ultralytics/yolov5.git
./scripts/start_yolov5_docker.sh
```

### Train inside Docker Image
```
cp ./yolo_data/rddc.yaml .
pip install wandb
wandb login <api-key>
python train.py --img 512 --batch 64 --epochs 100 --data rddc.yaml --weights yolov5m.pt
```

# Colab Notebooks Guide
For object detection baselines, I have used YOLOv5, mmdetection, and detectron2 as Object Detection Libraries. I also had adopted and modified a code for Faster-RCNN that uses Pytorch Lightning. All notebooks are working on Google Colab. I also included DeepLabV3 (for segmentation) since I have used it before.  

**All notebooks have sections and are organized although there might be some extra logs.**

**Faster_RCNN_PytorchLightning.ipynb**  
  Uses Pytorch + Pytorch Lightning to train an object detector for a dataset by Murad et. al

**Faster_RCNN_using_Detectron2.ipynb  **
  Uses Detectron2 to build a Faster-RCNN object detection model. Fewer lines of code than the first one but a little bit less flexible. Easier training with Docker.
  
**RetinaNet_using_Detectron2.ipynb**  
  Uses Detectron2's RetinaNet to train model

**DeepLabV3.ipynb**
  Adopted code for DeepLabV3 using Pytorch
