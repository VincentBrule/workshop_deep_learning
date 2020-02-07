
#### Instructions
First solution: Use the image gave by the speaker.

Second solution: VERIFY YOUR DOCKER SETUP, please put at least 6GB for the RAM.
1. `docker build -t workshop_scala_tensorflow .`
2. `docker-compose up`
3. Access `localhost:8888`

### Prerequisites (They are included in above solutions)
1. [Jupyter notebook](https://jupyter.readthedocs.io/en/latest/install.html)
2. [Scala kernel for Jupyter](https://almond.sh/docs/quick-start-install). You need  the version 0.9.1 (Almond) with 2.12.10 (Scala) to run notebook examples

### Useful documentations
1. [Scala API for Tensorflow](https://github.com/eaplatanios/tensorflow_scala)
2. [Almond documentation to interact with Jupyter](https://almond.sh/docs/api-jupyter)

### Workshop organization
**Partie 1**: Learning a simple linear model
```
PARTIE_1    
└───notebooks
   │   dataset_creation.ipynb -> dataset creation with random images
   |   training.ipynb -> train and test liner model
└───resources
   │   interaction.html -> HTML code to allow user to create dataset
```

**Partie 2**: Classify images with digits MNIST: MLP
```
PARTIE_2    
└───notebooks
   |   training_MNIST.ipynb -> train MLP on MNIST dataset and infererence to test results
└───resources
   │   dataset -> folder to save MNIST dataset
```

**Partie 3**: Classify images with digits MNIST: CNN
```
PARTIE_3    
└───notebooks
   |   training_MNIST_CNN.ipynb -> train CNN on MNIST dataset and infererence to test results
└───resources
   │   dataset -> folder to save MNIST dataset
```

**Partie 4**: Object Detection with Akka HTTP

### Workshop Topics
**Slides** *(10-15’)*:
* ML for image classification in a nutshell
* Tensorflow

**Set-up** *(10-15’)*:
* Getting started with infrastructure (notebooks in VM / local)
* Hello world notebook and shell

**Slide** *(5-10’)*:
* Modele lineaire, pixels as features
* Use case

**Scala Tensorflow Notebook** *(50’)*:

Learning a simple linear model:
* Linear model for color perception
* Generate small images (e.g 10x10) with pixels in the blue-green spectrum
* User labels images as blue or green
* Train a linear model to predict label
* Present new image, ask for label to user then show prediction

**Slides** *(5’)*:
* Neural networks
* MNIST dataset

**Classify images with digits MNIST: MLP** *(25’)*:
* Learn MNIST handwritten digits
* Predict user written digits

**Slides** *(5’)*:
* CNN

**Classify images with digits MNIST: CNN** *(15’)*:
* Learn MNIST handwritten digits
* Predict user written digits

**Slides** *(10’)*:
* Advanced models
* Models libraries
* Model signatures
* Object detection

**Face detection model** *(50’)*:
* Anonymization face/plate detection model usage
* Composition with blurring tf graph
* Video tracking: track face on video, with blurring???

##### Overall time: 200 minutes max
