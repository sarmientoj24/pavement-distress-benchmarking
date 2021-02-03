# pavement-distress-benchmarking
Repository for Benchmarking Pavement Distress Detection

## Training with YOLOv5
### Setup Mayon Environment
- git clone https://github.com/sarmientoj24/pavement-distress-benchmarking.git
- cd pavement-distress-benchmarking
- chmod a+x scripts/*.sh
- ./scripts/prepare_env.sh

### Download YOLOv5 RDDC2020 Dataset 
For training large dataset, use *_full* while *_cl* contains dataset that went through CLAHE enhancement.
- ./scripts/download_rddc_full.sh
- ./scripts/prepare_yolo_data.sh

### Clone YOLOv5 and setup Docker
- git clone https://github.com/ultralytics/yolov5.git
- If you have Docker 18 and below, install nvidia-docker
- ./scripts/start_yolov5_docker.sh

### Train inside Docker Image
- cp ./yolo_data/rddc.yaml .
- pip install wandb
- wandb login <api-key>
- python train.py --img 512 --batch 64 --epochs 100 --data rddc.yaml --weights yolov5m.pt
