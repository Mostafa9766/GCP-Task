# GCP-Task

- Create Dockerfile for python application
    
    ```docker
    FROM python:3.7

    COPY . /gcp-task

    WORKDIR /gcp-task

    RUN pip install -r requirements.txt

    RUN export $(cat .env | xargs)
    
    CMD [ "python3", "hello.py" ]
    ```
    
- Create the image using Dockerfile
    
    `docker build . -t my-python-app`
  
- Tag the image

    `docker tag my-python-app gcr.io/mostafa-ahmed-gomaa/my-python-app:v1.0`
    
- Login to GCR

     `cat ~/mostafa-ahmed-gomaa-keyfile.json | docker login -u _json_key --password-stdin https://gcr.io` 
     
- Push image to GCR

     `docker push gcr.io/mostafa-ahmed-gomaa/my-python-app:v1.0` 
    
## **Build infrastructure by Terraform**

- Authenticate terraform with gcp using service account
    `terraform init`
- Create resources 

    `terraform plan`
    `terraform apply`
    
    ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/cluster%20up%20and%20running?raw=true)
    
    ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/cluster%20nodes%20and%20private%20instance%20up%20and%20running?raw=true)
    
## **Deploy Application**
- **Connect private instance (management-ce) using ssh**
  ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/ssh%20to%20private%20instance?raw=true)
- **Join private cluster from private instance**
  ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/join%20cluster%20and%20get%20nodes?raw=true)
- **Move deployment files on private instance**
- Python application  deployment and redis deployment up and running
  ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/pyrhon%20and%20redis%20up%20and%20running?raw=true)
- Loadbalancer to expose application
  ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/load-balancer%20external%20ip%20to%20exspose%20application?raw=true)

## **Python Application is running**

 ![alt text](https://github.com/Mostafa9766/GCP-Task/blob/master/Task-screenshots/python%20application%20running?raw=true)



<<<<<<< HEAD

=======
>>>>>>> 4ee00924e519a8c3229c53996c0f707328754833
