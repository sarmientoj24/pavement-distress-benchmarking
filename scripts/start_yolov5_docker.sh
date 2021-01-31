# Copy YAML to data folder
cp artifacts/rddc.yaml yolo_data/

# Pull docker image
docker pull ultralytics/yolov5:latest

# Run docker interactively
docker run --gpus all --ipc=host -it -v "$(pwd)"/yolo_data:/usr/src/data ultralytics/yolov5:latest