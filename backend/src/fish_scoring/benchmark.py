"""
Benchmark script for thesis evaluation
Measures: latency, memory, startup time
"""

import time
import psutil
import os
from datetime import datetime

class PipelineProfiler:
    """Simple profiler for measuring pipeline performance"""
    
    def __init__(self):
        self.metrics = {}
        self.process = psutil.Process(os.getpid())
    
    def measure_memory(self):
        """Get current memory usage in MB"""
        return self.process.memory_info().rss / 1024 / 1024
    
    def measure_latency(self, label, func):
        """Time a function and record result"""
        mem_before = self.measure_memory()
        start = time.perf_counter()
        result = func()
        end = time.perf_counter()
        mem_after = self.measure_memory()
        
        elapsed_ms = (end - start) * 1000
        mem_delta = mem_after - mem_before
        
        self.metrics[label] = {
            'latency_ms': elapsed_ms,
            'mem_before_MB': mem_before,
            'mem_after_MB': mem_after,
            'mem_delta_MB': mem_delta,
        }
        
        print(f"{label:30s} | {elapsed_ms:8.1f}ms | Peak: {mem_after:6.1f}MB | Delta: {mem_delta:+6.1f}MB")
        return result
    
    def report(self):
        """Print summary table"""
        print("\n" + "="*80)
        print("PIPELINE PERFORMANCE REPORT")
        print("="*80)
        print(f"{'Stage':<30} {'Latency (ms)':<15} {'Memory (MB)':<15} {'Delta (MB)':<15}")
        print("-"*80)
        
        total_latency = 0
        for label, metrics in self.metrics.items():
            latency = metrics['latency_ms']
            mem_peak = metrics['mem_after_MB']
            mem_delta = metrics['mem_delta_MB']
            total_latency += latency
            
            print(f"{label:<30} {latency:>8.1f}      {mem_peak:>8.1f}       {mem_delta:>+8.1f}")
        
        print("-"*80)
        print(f"{'TOTAL':<30} {total_latency:>8.1f}ms")
        print("="*80)
        
        return self.metrics


# Example usage:
if __name__ == "__main__":
    from fastapi.testclient import TestClient
    from main import app
    
    profiler = PipelineProfiler()
    client = TestClient(app)
    
    # Measure health check (should be instant)
    profiler.measure_latency("Health Check", lambda: client.get("/health"))
    
    # Measure inference with a test image
    def test_inference():
        with open("dataset/full/BANG_BWM_01_FULL.jpg", "rb") as f:
            response = client.post(
                "/api/fish/analyze",
                files={"fish_image": f}
            )
        return response
    
    profiler.measure_latency("Full Inference", test_inference)
    
    # Print summary
    metrics = profiler.report()
    
    # Save to CSV for thesis analysis
    import csv
    with open("benchmarks/benchmark_results.csv", "w") as f:
        writer = csv.DictWriter(f, fieldnames=["stage", "latency_ms", "memory_MB"])
        writer.writeheader()
        for label, values in metrics.items():
            writer.writerow({
                "stage": label,
                "latency_ms": values['latency_ms'],
                "memory_MB": values['mem_after_MB']
            })