### Soft-NMS (Reduce number of detection Boxes to have only one box for each object)

### Prerequisites
1. In the folder `images`, extract all images

2. We need two models for this notebook to obtain multiple detection boxes for the same object. In the folder `data/models`, you have to put both models. If you don't know which one to take, you can go to this [link](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md) and take kitti and coco models.
Current names in the code for both models are `kitti.pb` and `coco.pb`. Think about changing that names if you don't take same models.

3. Update `kitti.txt` and `coco.txt` in function of the previous model downloaded from step2.
