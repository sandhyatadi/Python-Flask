#Base Image
FROM python:3.9-slim-buster
# Working directory 
WORKDIR /app
#Adding dependencies
COPY requirements.txt .
# Install the require pythong packages
RUN apt-get update && \
    apt-get install -y gcc libc-dev

RUN pip3 install --no-cache-dir psutil
RUN pip3 install --no-cache-dir -r requirements.txt

#Coy the app code to the working directory 
COPY . .
# Set the env variables for the Flass app
ENV FLASK_RUN_HOST=0.0.0.0

#Expose the port on which the Flask app will run
EXPOSE 5001

CMD ["flask" , "run"]
