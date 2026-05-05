import os
from typing import Dict, Tuple
import pickle
import numpy as np

import sklearn

MODEL_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '../artifacts/unet_fish.pth'))
FEATURE_VECTOR_SIZE = 6

class FishClassifier:
    def __init__(self):
        self.model = None
        self.load_model()
    
    def _load_model(self) -> None:
        if not os.path.exists(MODEL_PATH):
            raise FileNotFoundError(f"Model not found at {MODEL_PATH}")
        
        with open (MODEL_PATH, 'rb') as f:
            self.model = pickle.load(f)

    def predict(self, feature_vector: np.ndarray) -> 

classifier_instance = FishClassifier()