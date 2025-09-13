<p align="left">
  <a href="https://www.mathworks.com/products/matlab.html">
    <img src="https://img.shields.io/badge/MATLAB-R2022a%2B-blue" alt="MATLAB">
  </a>
  <a href="./LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-success" alt="License: MIT">
  </a>
</p>

# Radar Satellite Tracking Accuracy

Runs the **original residual dashboard script** unchanged and saves the output figure to `results/`.

## Quickstart

1. Place your radar observation file in the project root as:

   ```
   PC_RADAR_OBS.csv
   ```

2. From MATLAB, run:

   ```matlab
   run('run_demo.m')
   ```

3. This will generate:

   ```
   results/residual_accuracy_dashboard.png
   ```
## Example Output

![Residual Accuracy Dashboard](results/residual_accuracy_dashboard.png)

## Repository Structure

```
.
├── data/                     # Input data (e.g., PC_RADAR_OBS.csv)
├── results/                  # Output figures & artifacts
├── scripts/                  # Original residual dashboard (unchanged)
│   └── original_residual_dashboard.m
├── run_demo.m                # Entrypoint wrapper script
├── .gitignore
├── .gitattributes
└── README.md
```

## Requirements

- MATLAB **R2022a+**
- Example CSV input (`PC_RADAR_OBS.csv`)

## License

This project is licensed under the [MIT License](./LICENSE).
