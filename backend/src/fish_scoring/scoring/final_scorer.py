def compute(rule_score, rule_quality, ml_quality):
    if rule_quality == ml_quality:
        return ml_quality
    
    # If rule score == mid & ml quality == high
    if rule_score >= 0.70 and ml_quality == "high":
        return "high"

    # If rule == high & ml quality == mid
    if 0.74 >= rule_score >= 0.72 and ml_quality == "mid":
        return "mid"

    # If rule == low & ml quality == mid
    if rule_score >= 0.58 and ml_quality == "mid":
        return "mid"
    
    # if rule == mid & ml quality == low
    if rule_score <= 0.62 and ml_quality == "low":
        return "low"

    return ml_quality