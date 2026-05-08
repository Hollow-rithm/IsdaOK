import numpy as np

from config import SPECIES_BOUNDS, MIN_SCORE, MAX_SCORE

def normalize(value, feature, species):
    bounds = SPECIES_BOUNDS.get(species, SPECIES_BOUNDS["unknown"])[feature]
    score = (value - bounds["min"]) / (bounds["max"] - bounds["min"] + 1e-6)
    return float(np.clip(score, MIN_SCORE, MAX_SCORE))