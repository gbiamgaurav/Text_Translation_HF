from fastapi import FastAPI
from transformers import pipeline

## create FastAPI app instance
app = FastAPI()

## Initialize text translation pipeline
pipe = pipeline("translation", model="google/madlad400-3b-mt")

@app.get("/")
def home():
    return {"message": "Hello World!"}


@app.get("/generate")
def generate(text: str):
    # use the pipeline to generate text from given input text
    output = pipe(text)

    ## return the generated text in json
    return {"output": output[0]}