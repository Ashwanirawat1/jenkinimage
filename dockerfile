# Use an official Python runtime as a parent image
FROM ubuntu:latest
FROM python:3.11

# Set the working directory in the container
#WORKDIR C:/Users/Ashwani R-3309/.jenkins/jobs/Jenkins_demo/workspace/
WORKDIR /appp


# Clone the source code from your Git repository
RUN git clone https://github.com/Ashwanirawat1/demodocker.git
#C:\Users\Ashwani R-3309\.jenkins\jobs\Jenkins_demo\workspace\dockerfile
#WORKDIR C:/Users/Ashwani R-3309/.jenkins/jobs/Jenkins_demo/workspace/jenkins
WORKDIR /appp/demodocker

# Run your script when the container launches
CMD ["python", "jenkins.py"]
