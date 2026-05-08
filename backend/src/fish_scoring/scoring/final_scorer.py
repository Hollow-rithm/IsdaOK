def compute(rule_score, rule_quality, ml_quality):
    if rule_quality == ml_quality:
        return rule_quality
    
    if rule_quality == "mid" and ml_quality == "high":
        if rule_score >= 0.70:
            return "high"

    if rule_quality == "low" and ml_quality == "mid":
        if rule_score >= 0.68:
            return "mid"

    return rule_quality