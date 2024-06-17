# Official Python
FROM python:3.9 

# Set the Working dir
WORKDIR /code

# Copying the requirements
COPY ./requirements.txt /code/requirements.txt

# Installing the requirements
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Adding User
RUN useradd user 

# Create User
USER user

# Set the Environment 
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Set the Workdir Home    
WORKDIR $HOME/app

# Copy the Home
COPY --chown=user . $HOME/app

# FASTAPI
CMD["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]