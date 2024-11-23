import json
import requests

from fastapi import FastAPI
from pydantic import BaseModel

from inference import inference

app = FastAPI()

class InferenceInputData(BaseModel):
    input_text: str
    
class InferenceOutputData(BaseModel):
    output_text:str
    


@app.post("/inference")
async def inference(data: InferenceInputData) -> InferenceOutputData:
    input_text = data.input_text
    ## MODEL INFERENCE CODE
    model_output = inference(input_text)
    ## MODEL INFERENCE CODE
    output = InferenceOutputData(
        output_text=model_output
    )
    return output