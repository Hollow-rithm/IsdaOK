def compute(gill_score, eye_score, body_score):
    rule_score = (
        gill_score * 0.5 +
        eye_score * 0.3 +
        body_score * 0.2
    )

    if rule_score >= 0.72:
        rule_quality = "high"
    elif rule_score >= 0.60:
        rule_quality = "mid"
    else:
        rule_quality = "low"
        
    return round(float(rule_score), 3), rule_quality