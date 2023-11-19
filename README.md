# Part 1: Deploying the Flask application locally
Step 1: Clone the code
Clone the code from the repository:

`git clone <repository_url>`
Step 2: Install dependencies
The application uses the psutil and Flask, Plotly, boto3 libraries. Install them using pip:

`pip3 install -r requirements.txt`

Step 3: Run the application
To run the application, navigate to the root directory of the project and execute the following command:

`python3 app.py`

This will start the Flask server on localhost:5000. Navigate to > http://localhost:5000/ on your browser to access the application.

Part 2: Dockerizing the Flask application
Step 1: Create a Dockerfile
Create a Dockerfile in the root directory of the project with the following contents:

Step 2: Build the Docker image
To build the Docker image, execute the following command:

`docker build -t <image_name> .`
Step 3: Run the Docker container
To run the Docker container, execute the following command:

`docker run -p 5000:5000 <image_name>`
This will start the Flask server in a Docker container on localhost:5000. Navigate to http://localhost:5000/ on your browser to access the application.

Part 3: Pushing the Docker image to ECR
Step 1: Create an ECR repository
Create an ECR repository using Python:

import boto3

# Create an ECR client


# Create a new ECR repository


# Print the repository URI

Step 2: Push the Docker image to ECR
Push the Docker image to ECR using the push commands on the console:

`docker push <ecr_repo_uri>:<tag>`

Part 4: Creating an EKS cluster and deploying the app using Python
Step 1: Create an EKS cluster
Create an EKS cluster and add node group

Step 2: Create a node group
Create a node group in the EKS cluster.

Step 3: Create deployment and service
from kubernetes import client, config

# Load Kubernetes configuration

# Create a Kubernetes API client


# Define the deployment
make sure to edit the name of the image on line 25 with your image Uri.

Once you run this file by running “python3 eks.py” deployment and service will be created.
Check by running following commands:
`kubectl get deployment -n default (check deployments)
kubectl get service -n default (check service)
kubectl get pods -n default (to check the pods)`
Once your pod is up and running, run the port-forward to expose the service

`kubectl port-forward service/<service_name> 5000:5000`
