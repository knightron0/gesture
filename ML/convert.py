import torch
from pytorch2keras.converter import pytorch_to_keras


model = torch.load("../best.pt")
x = torch.randn(1, 3, 640, 640, requires_grad=False)

k_model = pytorch_to_keras(model, x, [(3, None, None)], verbose=True, names='short')
k_model.save('keras.h5')
