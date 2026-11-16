# Unconstrained Optimization Benchmark: Line Search Methods

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023a%2بي-orange.svg)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Repository developed as part of an Undergraduate Scientific Initiation (Iniciação Científica) research at the **Universidade Tecnológica Federal do Paraná (UTFPR)**, Curitiba, Brazil. 

This project implements and benchmarks unconstrained optimization algorithms using Cauchy's steepest descent direction coupled with different line search strategies across the standard Moré-Garbow-Hillstrom (MGH) test problem collection.

## 🛠️ Implemented Methods

- **Descent Direction:** Cauchy's Gradient Descent $d = -\nabla f(x)$.
- **Line Search Strategies:**
  1. **Armijo Condition** (with backtracking).
  2. **Golden Section Method** (Golden-section search).
  3. **Bisection Method** (directional derivative root-finding).
- **Performance Evaluation:** 
  - CPU execution time tracking.
  - **Dolan-Moré Performance Profiles** for rigorous robustness and efficiency comparison among algorithms.

## 📂 Repository Structure

- `OTIMIZACAO.m`: Main script executing the 33 MGH test problems and generating the Dolan-Moré performance profile plot.
- `cauchy.m`: Core Cauchy descent routine with tolerance control and failure handling.
- `busca_linear.m`: Unified line search function housing the 3 strategies (Armijo, Golden Section, Bisection).
- `mgh.m`: Analytical wrapper computing the objective function $f(x) = F(x)^T F(x)$ and gradient $\nabla f(x) = 2 J(x)^T F(x)$.
- `banco_f.m`: Database containing the 33 MGH test problems (dimensions $n, m$ and initial points $x_0$).

## 🚀 Getting Started

1. Clone or download this repository into your local machine.
2. Open **MATLAB** and set the working directory to the project folder.
3. Run the main benchmark script:
   ```matlab
   OTIMIZACAO
