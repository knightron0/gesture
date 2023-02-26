from flask import Flask, request
import torch
import urllib.request
import base64
from ultralytics import YOLO
import cv2
from io import BytesIO
from PIL import Image
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

def predict(imageSource):
    model = YOLO("../../best.pt")
    outDict = {}

    results = model.predict(source=imageSource, verbose=False)
    print(imageSource)
    if len(results) > 0 and len(results[0].boxes.xyxy) > 0:
        confs = results[0].boxes.conf
        boxCords = results[0].boxes.xyxy
        classes = results[0].boxes.cls

        img = cv2.imread(imageSource)
        outDict = {}
        outDict["coords"] = boxCords[0].tolist()
        outDict["letter"] = chr(int(classes[0].item()) + 97)
        outDict["conf"] = confs[0].item()
    return outDict


@app.route('/query', methods = ["GET", "POST"])
def query():
    model = YOLO("../../best.pt")
    print(request.method)
    print(request.get_json())
    file = request.get_json()["image"]
    starter = file.find(',')
    image_data = file[starter+1:]
    image_data = bytes(image_data, encoding="ascii")
    im = Image.open(BytesIO(base64.b64decode(image_data)))
    im.save('image.png')
    return predict('image.png')

if __name__ == "__main__":
    app.run(host= "0.0.0.0", debug=True)
