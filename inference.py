import torch
from torchvision import transforms
from torchvision.models import MobileNet_V2_Weights
from PIL import Image
import sys

model = torch.jit.load("model.pt")
model.eval()

weights = MobileNet_V2_Weights.DEFAULT
preprocess = weights.transforms()
categories = weights.meta["categories"]


def predict(image_path):
    image = Image.open(image_path).convert("RGB")
    x = preprocess(image).unsqueeze(0)

    with torch.no_grad():
        logits = model(x)
        probs = torch.softmax(logits, dim=1)[0]

    top_probs, top_idxs = probs.topk(3)

    print("Top-3 predictions:")
    for p, idx in zip(top_probs, top_idxs):
        print(f"{categories[idx]} — {p.item():.4f}")

if __name__ == "__main__":
    predict(sys.argv[1])